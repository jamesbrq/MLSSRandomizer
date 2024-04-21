using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Runtime.InteropServices.ComTypes;
using System.Security.Cryptography;

public class Decompression
{
    public static void LZ77(List<byte> cBytes, string name)
    {
        //Check for directory, if none then make one
        if (!Directory.Exists(Environment.CurrentDirectory + "/bis/decompressed/"))
            Directory.CreateDirectory(Environment.CurrentDirectory + "/bis/decompressed/");
        //Init new decompressed file
        FileStream decomp = new FileStream(Environment.CurrentDirectory + "/bis/decompressed/" + name, FileMode.Create);
        uint dSize = 0;
        uint r1 = 0;
        uint currentPosition = 0;
        uint endPosition = 0;
        if (cBytes.Count == 0)
            return;
        //Read last 8 bytes of file for start position and decompressed filesize
        for (int i = 1; i <= 2; i++)
        {
            byte[] temp = new byte[] { cBytes[cBytes.Count - (4 * i)], cBytes[cBytes.Count - (4 * i - 1)], cBytes[cBytes.Count - (4 * i - 2)], cBytes[cBytes.Count - (4 * i - 3)] };
            if (!BitConverter.IsLittleEndian)
            {
                Array.Reverse(temp);
            }
            if (i == 1)
                dSize = (uint)(BitConverter.ToUInt32(temp, 0) + cBytes.Count);
            else
            {
                r1 = BitConverter.ToUInt32(temp, 0);
                currentPosition = (uint)(cBytes.Count - (r1 >> 0x18));
            }
        }
        //Fill array first with header bytes, then all 0's
        List<byte> dBytes = new List<byte>((int)dSize);
        dBytes.AddRange(cBytes.GetRange(0, 0x4000));
        dBytes.AddRange(Enumerable.Repeat<byte>(0x0, (int)dSize - dBytes.Count));
        r1 &= 0x00FFFFFF;
        //Equal to 0x4000, stops when gets to header bytes
        endPosition = (uint)cBytes.Count - r1;
        while (currentPosition > endPosition)
        {
            uint read = cBytes[(int)--currentPosition];
            int r6 = 8;
            loop:
            if (--r6 < 0)
                continue;
            uint readCopy = read & 0x80;
            if (readCopy != 0)
            {
                int temp = cBytes[(int)--currentPosition];
                int temp2 = cBytes[(int)--currentPosition];
                temp2 |= (temp << 8);
                temp2 &= 0x0FFF;
                temp2 += 2;
                temp += 0x20;
                while (temp >= 0)
                {
                    byte tRead = dBytes[(int)(dSize + temp2)];
                    dBytes[(int)--dSize] = tRead;
                    temp -= 0x10;
                }
            }
            else
            {
                byte temp = cBytes[(int)--currentPosition];
                dBytes[(int)--dSize] = temp;
            }
            read <<= 1;
            if (currentPosition > endPosition)
                goto loop;
        }
        decomp.Write(dBytes.ToArray(), 0, dBytes.Count);
        decomp.Close();
        Console.WriteLine("Decompressed!");
    }

    public static void ExtractRom(string fileName)
    {
        Process process = new Process();
        ProcessStartInfo startInfo = new ProcessStartInfo();
        //startInfo.WindowStyle = ProcessWindowStyle.Hidden;
        string domain = @Environment.CurrentDirectory + @"/bis/extraction/";
        startInfo.WorkingDirectory = domain;
        if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
        {
            startInfo.FileName = "cmd.exe";
            startInfo.Arguments = $"/C mdnds.exe e ../bis.nds ./decompressed";
        }
        else
        { 
            //TODO
        }
        process.StartInfo = startInfo;
        process.Start();
        process.WaitForExit();
    }

    public static void BuildRom(string fileName)
    {
        Process process = new Process();
        ProcessStartInfo startInfo = new ProcessStartInfo();
        startInfo.WindowStyle = ProcessWindowStyle.Normal;
        string domain = @Environment.CurrentDirectory + @"/bis/extraction/";
        startInfo.WorkingDirectory = domain;
        if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
        {
            startInfo.FileName = "cmd.exe";
            startInfo.Arguments = "/C mdnds.exe b ./decompressed ../bis.nds";
        }
        else
        {
            //TODO
        }
        process.StartInfo = startInfo;
        process.Start();
        process.WaitForExit();
    }

    public static void Decompress(string fileName, string command)
    {
        Process process = new Process();
        ProcessStartInfo startInfo = new ProcessStartInfo();
        startInfo.WindowStyle = ProcessWindowStyle.Hidden;
        string domain = @Environment.CurrentDirectory + @"/bis/extraction/decompressed/";
        startInfo.WorkingDirectory = domain;
        if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
        {
            startInfo.FileName = "cmd.exe";
            startInfo.Arguments = $"/C blz.exe {command} " + fileName;
        }
        else
        {
            //TODO
        }
        process.StartInfo = startInfo;
        process.Start();
        process.WaitForExit();
    }
}