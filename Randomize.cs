using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;
using System.Windows.Forms;


public static class ListExtensions
{

    public static void Shuffle<T>(this IList<T> list, Random random)
    {
        int n = list.Count;
        while (n > 1)
        {
            n--;
            int k = random.Next(n + 1);
            T value = list[k];
            list[k] = list[n];
            list[n] = value;
        }
    }
}

namespace MLSSRandomizerForm
{
    class Randomize
    {
        static Rom rom;
        public static (string newFile, int hash) Random(string path, string seed, int gameId)
        {
            if (gameId == 1)
            {
                rom = new Rom(path, seed, gameId);
                rom.Randomize();
                rom.SpoilerFill();
                rom.SpoilerGen();
                rom.HintWrite();
                rom.EnemyRandomize();
                rom.RandomizeStats();
                rom.MusicRandomize();
                rom.BackgroundRandomize();
                Form1.mColor = Rom.GenColor(Form1.mColor, false);
                Form1.lColor = Rom.GenColor(Form1.lColor, false);
                rom.ColorSwap(Form1.mColor, 0, "");
                rom.ColorSwap(Form1.lColor, 1, "");
                rom.ColorSwap(Rom.GenColor(Form1.mPants, true), 0, "pants/");
                rom.ColorSwap(Rom.GenColor(Form1.lPants, true), 1, "pants/");
                rom.SeedInject();
                rom.EntranceRandomize();
                rom.stream.Close();
                rom.Inject();
                return (Environment.CurrentDirectory + "/asm/mlss_loop.gba", rom.hash);
            }
            if (gameId == 3)
            {
                rom = new Rom(path, seed, gameId);
                rom.Randomize();
                rom.stream.Close();
                Decompression.BuildRom("bis.nds");
                return (Environment.CurrentDirectory + "/bis/bis.nds", rom.hash);
            }
            return ("", 0);
        }
    }

    class Rom
    {
        public FileStream stream;
        static Random random;
        public int hash;
        public static int gameId;

        //mlss var
        List<dynamic> freshLocationArray = new List<dynamic>();
        List<dynamic> validLocationArray = new List<dynamic>();
        List<Room> freshRoomArray = new List<Room>();
        List<Door> freshDoorArray = new List<Door>();
        List<Door> oceanDoorArray = new List<Door>();
        List<dynamic> optionsArray = new List<dynamic>();
        List<dynamic> locationArray = new List<dynamic>();
        List<dynamic> validityArray = new List<dynamic>();
        List<dynamic> validLocations = new List<dynamic>();
        List<Hint> hints = new List<Hint>();
        List<Spoiler> spoilerArray = new List<Spoiler>();
        List<SpoilerItem> spoilerItemArray = new List<SpoilerItem>();
        List<SpoilerLocation> spoilerLocationArray = new List<SpoilerLocation>();
        List<dynamic> freshItemArray = new List<dynamic>();
        public LocationData gameState = new LocationData(0);
        public int iterationCount = 0;
        public List<Enemy> enemies = new List<Enemy>();
        public List<Enemy> spikedEnemies = new List<Enemy>();
        public List<int> groupSizes = new List<int>();
        public List<EnemyGroup> groups = new List<EnemyGroup>();
        public List<EnemyGroup> stardustGroups = new List<EnemyGroup>();
        public List<EnemyGroup> bossGroups = new List<EnemyGroup>();


        public Rom(string path, string seed, int id)
        {
            gameId = id;
            if (gameId == 1)
            {
                if (!File.Exists(Environment.CurrentDirectory + "/asm/mlss.gba"))
                    File.Copy(path, Environment.CurrentDirectory + "/asm/mlss.gba");
                stream = new FileStream(Environment.CurrentDirectory + "/asm/mlss.gba", FileMode.Open);
                SeedInitialize(seed);
                if (Form1.rSettings)
                    RandomSettings();
                FreshArrayPopulate();
                CheckOptions();
            }
            if (gameId == 3)
            {
                if (!File.Exists(Environment.CurrentDirectory + "/bis/bis.nds"))
                    File.Copy(path, Environment.CurrentDirectory + "/bis/bis.nds");
                Decompression.ExtractRom("bis.nds");
                Decompression.Decompress("./sys/arm9.bin", "-d");
                Decompression.Decompress("./sys/arm9.bin", "-en9");
                stream = new FileStream(Environment.CurrentDirectory + "/bis/extraction/decompressed/files/Treasure/TreasureInfo.dat", FileMode.Open);
                FreshArrayPopulate();
                SeedInitialize(seed);
                CheckOptions();
            }
        }



        public class Room
        {
            public Room(int id, List<Door> doors, bool used)
            {
                this.id = id;
                this.doors = doors;
                this.index = doors.Count;
                this.used = used;
            }

            public void DoorAdd(Door door)
            {
                doors.Add(door);
                index = doors.Count;
            }

            public int id;
            public List<Door> doors;
            public int index;
            public bool used;
        }

        public struct Door
        {
            public Door(int id, byte[] arr, int returnRoom, int returnIndex, LocationData logic)
            {
                this.id = id;
                this.returnRoom = returnRoom;
                this.returnIndex = returnIndex;
                this.arr = arr;
                this.logic = logic;
            }

            public int id;
            public byte[] arr;
            public int returnRoom;
            public int returnIndex;
            public LocationData logic;
        }

        public struct SpriteLocation
        {
            public SpriteLocation(uint location, uint sprite, uint palette)
            {
                this.location = location;
                this.sprite = sprite;
                this.palette = palette;
            }

            public uint location;
            public uint sprite;
            public uint palette;
        }

        public struct SpriteData
        {
            public SpriteData(uint id, byte[] sprite, byte[] palette)
            {
                this.id = id;
                this.sprite = sprite;
                this.palette = palette;
            }

            public uint id;
            public byte[] sprite;
            public byte[] palette;
        }

        public struct Color
        {
            public Color(uint location, byte byte1, byte byte2, int bro)
            {
                this.location = location;
                this.byte1 = byte1;
                this.byte2 = byte2;
                this.bro = bro;
            }

            public uint location;
            public byte byte1;
            public byte byte2;
            public int bro;
        }

        public struct GbaColor
        {
            public GbaColor(byte byte1, byte byte2)
            {
                this.byte1 = byte1;
                this.byte2 = byte2;
            }

            public byte byte1;
            public byte byte2;
        }

        public struct Palette
        {
            public Palette(string hex)
            {
                shades = new List<GbaColor>();
                var tempcolor = HexToColor(hex);
                shades.Add(HexTo15Bit(tempcolor.R, tempcolor.G, tempcolor.B));
                var tempshade = ControlPaint.Dark(tempcolor, .1f);
                shades.Add(HexTo15Bit(tempshade.R, tempshade.G, tempshade.B));
                tempshade = ControlPaint.Light(tempcolor, .1f);
                shades.Add(HexTo15Bit(tempshade.R, tempshade.G, tempshade.B));
                tempshade = ControlPaint.Dark(tempcolor, .2f);
                shades.Add(HexTo15Bit(tempshade.R, tempshade.G, tempshade.B));
                tempshade = ControlPaint.Light(tempcolor, .2f);
                shades.Add(HexTo15Bit(tempshade.R, tempshade.G, tempshade.B));
            }

            //Shades: 0 - Normal, 1 - Slightly Darker, 2 - Slightly Lighter, 3 - Darker, 4 - Lighter
            public List<GbaColor> shades { get; set; }
        }

        public struct SpoilerItem
        {
            public SpoilerItem(uint item, string name)
            {
                this.name = name;
                this.item = item;
            }
            public string name;
            public uint item;
        }

        public struct SpoilerLocation
        {
            public SpoilerLocation(uint location, string name)
            {
                this.location = location;
                this.name = name;
            }
            public string name;
            public uint location;
        }

        public struct Spoiler
        {
            public Spoiler(string location, string item, string hex)
            {
                this.locationName = location;
                this.itemName = item;
                this.locationHex = hex;
            }
            public string locationName;
            public string locationHex;
            public string itemName;
        }

        public struct Hint
        {
            public Hint(byte id, string location, string itemName)
            {
                this.id = id;
                this.location = location;
                this.itemName = itemName;
            }

            public byte id;
            public string location;
            public string itemName;
        }

        public struct Enemy
        {
            public Enemy(byte id, byte type)
            {
                this.id = id;
                this.type = type;
            }

            public byte id;
            public byte type;
        }

        public struct EnemyGroup
        {

            public EnemyGroup(List<byte> id, List<byte> type, int position, byte[] data, int boss)
            {
                this.id = id;
                this.type = type;
                this.position = position;
                this.data = data;
                this.boss = boss;
                groupType = 0x64;
            }

            public EnemyGroup(byte groupType, List<byte> id, List<byte> type, int position, byte[] data, int boss)
            {
                this.id = id;
                this.type = type;
                this.position = position;
                this.data = data;
                this.boss = boss;
                this.groupType = groupType;
            }

            public int size { get { return id.Count; } set { } }
            public List<byte> id;
            public List<byte> type;
            public byte[] data;
            public int position;
            public int boss;
            public byte groupType;
        }


        public struct LocationData
        {
            public LocationData(uint location, uint item, int itemType, int hammerState, bool rose, bool brooch, bool fire, bool thunder, int fruitState, bool membership, bool winkle, bool beanstar, bool dress, bool mini, bool under, bool dash, bool crash, int neon, int beanfruit, bool spangle, int pieces, bool mario, bool luigi)
            {
                this.location = location;
                this.item = item;
                this.itemType = itemType;
                this.hammerState = hammerState;
                this.rose = rose;
                this.brooch = brooch;
                this.fire = fire;
                this.thunder = thunder;
                this.fruitState = fruitState;
                this.membership = membership;
                this.winkle = winkle;
                this.beanstar = beanstar;
                this.dress = dress;
                this.mini = mini;
                this.under = under;
                this.dash = dash;
                this.crash = crash;
                this.neon = neon;
                totalBeanfruit = beanfruit;
                currentBeanfruit = 0;
                this.spangle = spangle;
                this.pieces = pieces;
                this.mario = mario;
                this.luigi = luigi;
            }

            public LocationData(int def)
            {
                location = 0;
                item = 0;
                itemType = 0;
                hammerState = 0;
                rose = false;
                brooch = false;
                fire = false;
                thunder = false;
                fruitState = 0;
                membership = false;
                winkle = false;
                beanstar = false;
                dress = false;
                mini = false;
                under = false;
                dash = false;
                crash = false;
                neon = 0;
                totalBeanfruit = 0;
                currentBeanfruit = 0;
                spangle = false;
                pieces = 0;
                mario = false;
                luigi = false;
            }

            public uint location;
            public uint item;
            public int itemType;
            public int hammerState;
            public bool rose;
            public bool brooch;
            public bool fire;
            public bool thunder;
            public int fruitState;
            public bool membership;
            public bool winkle;
            public bool beanstar;
            public bool dress;
            public bool mini;
            public bool under;
            public bool dash;
            public bool crash;
            public int neon;
            public int totalBeanfruit;
            public int currentBeanfruit;
            public bool spangle;
            public int pieces;
            public bool mario;
            public bool luigi;
        }

        public struct BiSLocationData
        {
            public BiSLocationData(uint location, bisitem item)
            {
                this.location = location;
                this.item = item;

            }

            public uint location;
            public bisitem item;
        }

        public struct bisitem
        {
            public bisitem(byte byte1, byte byte2, byte quantity, int itemType)
            {
                this.byte1 = byte1;
                this.byte2 = byte2;
                this.quantity = quantity;
                this.itemType = itemType;
            }

            public byte byte1;
            public byte byte2;
            public byte quantity;
            public int itemType;
        }


        public void RandomSettings()
        {
            Form1.chuckle = random.Next(1, 4);
            Form1.bosses = random.Next(1, 4);
            Form1.intro = Convert.ToBoolean(random.Next(0, 2));
            Form1.mush = Convert.ToBoolean(random.Next(0, 2));
            Form1.rose = Convert.ToBoolean(random.Next(0, 2));
            Form1.brooch = Convert.ToBoolean(random.Next(0, 2));
            Form1.chuckola = Convert.ToBoolean(random.Next(0, 2));
            Form1.membership = Convert.ToBoolean(random.Next(0, 2));
            Form1.winkle = Convert.ToBoolean(random.Next(0, 2));
            Form1.beanstar = Convert.ToBoolean(random.Next(0, 2));
            Form1.dress = Convert.ToBoolean(random.Next(0, 2));
            Form1.fruit = Convert.ToBoolean(random.Next(0, 2));
            Form1.eggs = Convert.ToBoolean(random.Next(0, 2));
            Form1.scrolls = Convert.ToBoolean(random.Next(0, 2));
            Form1.beanstone = Convert.ToBoolean(random.Next(0, 2));
            Form1.beanlet = Convert.ToBoolean(random.Next(0, 2));
            Form1.hammers = Convert.ToBoolean(random.Next(0, 2));
            Form1.goblets = Convert.ToBoolean(random.Next(0, 2));
            Form1.hands = Convert.ToBoolean(random.Next(0, 2));
            Form1.pearls = Convert.ToBoolean(random.Next(0, 2));
            Form1.shops = Convert.ToBoolean(random.Next(0, 2));
            Form1.espresso = Convert.ToBoolean(random.Next(0, 2));
            Form1.pants = Convert.ToBoolean(random.Next(0, 2));
            Form1.badges = Convert.ToBoolean(random.Next(0, 2));
            Form1.surf = Convert.ToBoolean(random.Next(0, 2));
            Form1.castle = Convert.ToBoolean(random.Next(0, 2));
            Form1.enemy = Convert.ToBoolean(random.Next(0, 2));
            Form1.brosBp = Convert.ToBoolean(random.Next(0, 2));
            Form1.itemHeal = Convert.ToBoolean(random.Next(0, 2));
            Form1.coffeeValue = Convert.ToBoolean(random.Next(0, 2));
            Form1.music = Convert.ToBoolean(random.Next(0, 2));
            Form1.background = Convert.ToBoolean(random.Next(0, 2));
            Form1.scale = Convert.ToBoolean(random.Next(0, 2));
            Form1.minecart = Convert.ToBoolean(random.Next(0, 2));
            Form1.spangle = Convert.ToBoolean(random.Next(0, 2));
            Form1.pieces = Convert.ToBoolean(random.Next(0, 2));
            Form1.minigame = Convert.ToBoolean(random.Next(0, 2));
            Form1.mDisable = Convert.ToBoolean(random.Next(0, 2));
            Form1.sounds = Convert.ToBoolean(random.Next(0, 2));
            Form1.castletown = Convert.ToBoolean(random.Next(0, 2));
            Form1.visible = Convert.ToBoolean(random.Next(0, 2));
            Form1.invisible = Convert.ToBoolean(random.Next(0, 2));
            Form1.removeHidden = Convert.ToBoolean(random.Next(0, 2));
            Form1.espressoKey = Convert.ToBoolean(random.Next(0, 2));
            Form1.tattle = Convert.ToBoolean(random.Next(0, 2));
            Form1.items = true;
            Form1.harhall = Convert.ToBoolean(random.Next(0, 2));
            Form1.coins = Convert.ToBoolean(random.Next(0, 2));
            Form1.mColor = "Random";
            Form1.lColor = "Random";
            Form1.mPants = "Random";
            Form1.lPants = "Random";
            if (Form1.invisible && Form1.removeHidden)
            {
                Form1.removeHidden = false;
            }
        }






        public void SpriteReplace()
        {
            List<SpriteLocation> locations = new List<SpriteLocation>();
            string[] arr = StreamInitialize(Environment.CurrentDirectory + "/items/sprites/SpriteLocations.txt");
            for(int i = 0; i < stream.Length; i += 3)
            {
                locations.Add(new SpriteLocation(Convert.ToUInt32(arr[i], 16), Convert.ToUInt32(arr[i +1], 16), Convert.ToUInt32(arr[i + 2], 16)));
            }

            List<SpriteData> data = new List<SpriteData>();
            arr = StreamInitialize(Environment.CurrentDirectory + "/items/sprites/SpriteData.txt");
            for (int i = 0; i < arr.Length; i += 5)
            {
                data.Add(new SpriteData(Convert.ToUInt32(arr[i], 16), new byte[] { Convert.ToByte(arr[i + 1], 16), Convert.ToByte(arr[i + 2], 16) }, new byte[] { Convert.ToByte(arr[i + 3], 16), Convert.ToByte(arr[i + 4], 16) }));
            }

            foreach(SpriteLocation location in locations)
            {
                byte[] sprite = new byte[2];
                byte[] palette = new byte[2];
                stream.Seek(location.location, SeekOrigin.Begin);
                byte[] temp = new byte[2];
                stream.Read(temp, 0, 2);
                int temp2 = ItemConvert(temp[0], temp[1]);
                if (temp2 >= 0x1C && temp2 < 0x2B)
                    temp2 += 4;
                sprite = data.Where(c => c.id == temp2).ToList()[0].sprite;
                palette = data.Where(c => c.id == temp2).ToList()[0].palette;
                stream.Seek(location.sprite, SeekOrigin.Begin);
                stream.Write(sprite, 0, sprite.Length);
                stream.Seek(location.palette, SeekOrigin.Begin);
                stream.Write(palette, 0, palette.Length);
            }
        }



        public void EntranceRandomize()
        {
            if (!Form1.doors)
                return;
            FillRoomArray();
            NewShuffle();
        }

        public byte[] ScriptDoorArr(byte[] arr)
        {
            List<byte> list = new List<byte>
            {
                arr[1]
            };
            byte temp = arr[0];
            temp = (byte)(temp & 0xE);
            temp = (byte)(temp << 1);
            byte temp3 = (byte)(temp >> 4);
            byte temp2 = (byte)(arr[0] & 0xF0);
            temp2 |= 0x10;
            temp2 += temp3;
            list.Add(temp2);
            temp3 <<= 4;
            temp = (byte)(temp - temp3);
            temp3 = (byte)(arr[5] & 0x8);
            temp <<= 4;
            uint _uint;
            if (temp3 == 8)
                _uint = (uint)(arr[3] + 1);
            else
                _uint = arr[3];
            _uint <<= 2;
            uint _uint2 = _uint >> 4;
            _uint2 += temp;
            _uint &= 0xF;
            _uint <<= 4;
            list.Add((byte)_uint2);
            _uint2 = arr[4];
            _uint2 <<= 3;
            var bytes2 = BitConverter.GetBytes(_uint2);
            list.Add((byte)(_uint + bytes2[1]));
            list.Add(bytes2[0]);
            return list.ToArray();
        }


        public int GetReturnIndex(Door door)
        {
            int i = 0;
            foreach (Door d in freshRoomArray.Where(c => c.id == (int)Math.Floor(GetRoomId(door))).ToList()[0].doors)
            {

                byte[] arr = new byte[4];
                stream.Seek(d.logic.location, SeekOrigin.Begin);
                stream.Read(arr, 0, 4);
                if (door.arr[3] >= arr[0] && door.arr[3] <= arr[2] || door.arr[4] >= arr[1] && door.arr[4] <= arr[3])
                    return i;
                i++;
            }
            Console.WriteLine((int)Math.Floor(GetRoomId(door)));
            return -1;
        }



        public float GetRoomId(Door door)
        {
            return ((float)(door.arr[1] * 0x100) + door.arr[0]) / 0x40;
        }




        public void NewShuffle()
        {
            List<Door> doorArray = new List<Door>(freshDoorArray);
            List<Room> roomArray = new List<Room>(freshRoomArray);
            List<Door> insertArray = new List<Door>();
            doorArray.OrderBy(c => random.Next());
            doorArray.Shuffle(random);
            insertArray.Add(roomArray.Where(c => c.id == 0x66).ToList()[0].doors[0]);
            int availableDoors;
            for (int i = doorArray.Count - 1; i >= 0; i--)
            {
                int retryCount = 0;
                availableDoors = insertArray.Count;
                Retry:
                if ((availableDoors == 1 && roomArray.Where(c => c.id == doorArray[i].returnRoom).ToList()[0].index <= 1) || (availableDoors > 10 && roomArray[roomArray.FindIndex(c => c.id == doorArray[i].returnRoom)].index != 1))
                {
                    retryCount++;
                    if (availableDoors < 20 && retryCount > 100)
                        break;
                    doorArray.Shuffle(random);
                    goto Retry;
                }
                if (insertArray[0].logic.location >= 0x300000)
                {
                    stream.Seek(insertArray[0].logic.location + 4, SeekOrigin.Begin);
                    stream.Write(doorArray[i].arr, 0, doorArray[i].arr.Length);
                }
                else
                {
                    if (insertArray[0].logic.location == 0x2550C2)
                        Console.Write('a');
                    stream.Seek(insertArray[0].logic.location, SeekOrigin.Begin);
                    byte[] arr = ScriptDoorArr(doorArray[i].arr);
                    stream.Write(arr, 0, arr.Length);
                    stream.Seek(3, SeekOrigin.Current);
                    stream.Write(new byte[] { 0x0, 0x0, 0x0, 0x0 }, 0, 4);
                    if(stream.ReadByte() == 0x88)
                    {
                        stream.Seek(1, SeekOrigin.Current);
                        stream.Write(arr, 0, arr.Length);
                        stream.Seek(3, SeekOrigin.Current);
                        stream.Write(new byte[] { 0x0, 0x0, 0x0, 0x0 }, 0, 4);
                    }
                    else
                    {
                        for (int j = 1; j <= 3; j++)
                        {
                            stream.Seek(insertArray[0].logic.location + (j * 35), SeekOrigin.Begin);
                            stream.Write(arr, 0, arr.Length);
                            stream.Seek(3, SeekOrigin.Current);
                            stream.Write(new byte[] { 0x0, 0x0, 0x0, 0x0 }, 0, 4);
                        }
                    }
                }
                int rIndex = roomArray.FindIndex(c => c.id == doorArray[i].returnRoom);
                roomArray[rIndex].index -= 1;
                Door temp = new Door();
                Door tempInsert = new Door();
                try
                {
                    temp = roomArray.Where(c => c.id == insertArray[0].returnRoom).ToList()[0].doors[insertArray[0].returnIndex];
                    tempInsert = roomArray.Where(c => c.id == doorArray[i].returnRoom).ToList()[0].doors[doorArray[i].returnIndex];
                }
                catch (Exception e)
                {
                    Console.WriteLine(insertArray[0].returnRoom);
                    Console.WriteLine(doorArray[i].returnRoom);
                }
                if (temp.logic.location == 0x0 || tempInsert.logic.location == 0x0)
                    Console.WriteLine("a");
                if (tempInsert.logic.location >= 0x300000)
                {
                    stream.Seek(tempInsert.logic.location + 4, SeekOrigin.Begin);
                    stream.Write(temp.arr, 0, temp.arr.Length);
                }
                else
                {
                    if (insertArray[0].logic.location == 0x2550C2)
                        Console.Write('a');
                    stream.Seek(tempInsert.logic.location, SeekOrigin.Begin);
                    byte[] arr = ScriptDoorArr(temp.arr);
                    stream.Write(arr, 0, arr.Length);
                    stream.Seek(3, SeekOrigin.Current);
                    stream.Write(new byte[] { 0x0, 0x0, 0x0, 0x0 }, 0, 4);
                    if (stream.ReadByte() == 0x88)
                    {
                        stream.Seek(1, SeekOrigin.Current);
                        stream.Write(arr, 0, arr.Length);
                        stream.Seek(3, SeekOrigin.Current);
                        stream.Write(new byte[] { 0x0, 0x0, 0x0, 0x0 }, 0, 4);
                    }
                    else
                    {
                        for (int j = 1; j <= 3; j++)
                        {
                            stream.Seek(tempInsert.logic.location + (j * 35), SeekOrigin.Begin);
                            stream.Write(arr, 0, arr.Length);
                            stream.Seek(3, SeekOrigin.Current);
                            stream.Write(new byte[] { 0x0, 0x0, 0x0, 0x0 }, 0, 4);
                        }
                    }
                }
                doorArray.RemoveAt(i);
                doorArray.Remove(temp);
                insertArray.RemoveAt(0);
                if (!roomArray[rIndex].used)
                {
                    insertArray.AddRange(roomArray[rIndex].doors);
                    insertArray.Remove(tempInsert);
                    roomArray[rIndex].used = true;
                }
                else
                    insertArray.Remove(tempInsert);
                if (i > doorArray.Count)
                    i = doorArray.Count;
                if (insertArray.Count == 0)
                    break;
            }

        }

        public void FillRoomArray()
        {
            string[] stream = StreamInitialize(Environment.CurrentDirectory + "/items/entrances/EntranceRandomizer.txt");
            int roomIndex = 0;
            for (int i = 0; i < stream.Length; i += 30)
            {
                roomIndex = Convert.ToInt32(stream[i], 16);
                LocationData locationData = new LocationData(Convert.ToUInt32(stream[i + 1], 16),
                                                           0,
                                                           0,
                                                           Convert.ToInt32(stream[i + 10], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 11], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 12], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 13], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 14], 16)),
                                                           Convert.ToInt32(stream[i + 15], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 16], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 17], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 18], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 19], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 20], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 21], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 22], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 23], 16)),
                                                           Convert.ToInt32(stream[i + 24], 16),
                                                           Convert.ToInt32(stream[i + 25], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 26], 16)),
                                                           Convert.ToInt32(stream[i + 27], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 28], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 29], 16)));
                Door door = new Door(roomIndex, new byte[] { (byte)Convert.ToInt32(stream[i + 2], 16), (byte)Convert.ToInt32(stream[i + 3], 16), (byte)Convert.ToInt32(stream[i + 4], 16), (byte)Convert.ToInt32(stream[i + 5], 16), (byte)Convert.ToInt32(stream[i + 6], 16), (byte)Convert.ToInt32(stream[i + 7], 16) }, Convert.ToInt32(stream[i + 8], 16), Convert.ToInt32(stream[i + 9], 16), locationData);
                if (freshRoomArray.Where(c => c.id == roomIndex).ToList().Count == 0)
                {
                    freshRoomArray.Add(new Room(roomIndex, new List<Door>() { door }, false));
                    freshDoorArray.Add(door);
                }
                else
                {
                    int index = freshRoomArray.FindIndex(c => c.id == roomIndex);
                    Room temp = freshRoomArray[index];
                    temp.DoorAdd(door);
                    freshRoomArray[index] = temp;
                    freshDoorArray.Add(door);
                }
            }
            stream = StreamInitialize(Environment.CurrentDirectory + "/items/entrances/Ocean.txt");
            for (int i = 0; i < stream.Length; i += 30)
            {
                roomIndex = Convert.ToInt32(stream[i], 16);
                LocationData locationData = new LocationData(Convert.ToUInt32(stream[i + 1], 16),
                                                           0,
                                                           0,
                                                           Convert.ToInt32(stream[i + 10], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 11], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 12], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 13], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 14], 16)),
                                                           Convert.ToInt32(stream[i + 15], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 16], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 17], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 18], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 19], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 20], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 21], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 22], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 23], 16)),
                                                           Convert.ToInt32(stream[i + 24], 16),
                                                           Convert.ToInt32(stream[i + 25], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 26], 16)),
                                                           Convert.ToInt32(stream[i + 27], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 28], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(stream[i + 29], 16)));
                Door door = new Door(roomIndex, new byte[] { (byte)Convert.ToInt32(stream[i + 2], 16), (byte)Convert.ToInt32(stream[i + 3], 16), (byte)Convert.ToInt32(stream[i + 4], 16), (byte)Convert.ToInt32(stream[i + 5], 16), (byte)Convert.ToInt32(stream[i + 6], 16), (byte)Convert.ToInt32(stream[i + 7], 16) }, Convert.ToInt32(stream[i + 8], 16), Convert.ToInt32(stream[i + 9], 16), locationData);
                if (freshRoomArray.Where(c => c.id == roomIndex).ToList().Count == 0)
                {
                    freshRoomArray.Add(new Room(roomIndex, new List<Door>() { door }, false));
                    oceanDoorArray.Add(door);
                }
                else
                {
                    int index = freshRoomArray.FindIndex(c => c.id == roomIndex);
                    Room temp = freshRoomArray[index];
                    temp.DoorAdd(door);
                    freshRoomArray[index] = temp;
                    oceanDoorArray.Add(door);
                }
            }
        }



        public void UpdateState(byte item)
        {
            if (item == 0x56 || item == 0x57 || (item >= 0x60 && item <= 0x64))
            {
                gameState.neon += 1;
                return;
            }

            if (item == 0x47 || (item >= 0x50 && item <= 0x55))
            {
                gameState.totalBeanfruit += 1;
                gameState.currentBeanfruit += 1;
                return;
            }

            if (item == 0x70 || item == 0x65 || item == 0x66 || item == 0x67)
            {
                gameState.pieces += 1;
                if (gameState.pieces == 5)
                    Console.WriteLine("pieces");
                return;
            }

            switch (item)
            {

                case 0x31:
                    gameState.rose = true;
                    break;

                case 0x32:
                    gameState.brooch = true;
                    break;

                case 0x39:
                    gameState.fire = true;
                    break;

                case 0x3A:
                    gameState.thunder = true;
                    break;

                case 0x40:
                    gameState.membership = true;
                    break;

                case 0x41:
                    gameState.winkle = true;
                    break;

                case 0x42:
                    gameState.beanstar = true;
                    break;

                case 0x43:
                    gameState.dress = true;
                    break;

                case 0x35:
                    gameState.fruitState += 1;
                    break;

                case 0x36:
                    gameState.fruitState += 1;
                    break;

                case 0x37:
                    gameState.fruitState += 1;
                    break;

                case 0x38:
                    gameState.hammerState += 1;
                    break;

                case 0x33:
                    gameState.mini = true;
                    break;

                case 0x34:
                    gameState.under = true;
                    break;

                case 0x45:
                    gameState.dash = true;
                    break;

                case 0x46:
                    gameState.crash = true;
                    break;

                case 0x72:
                    gameState.spangle = true;
                    break;

                default:
                    break;

            }
        }

        public void FreshArrayPopulate()
        {
            if (gameId == 1)
            {
                ArrayInitialize(2, StreamInitialize(Environment.CurrentDirectory + "/items/AllAddresses.txt"));
                ArrayInitialize(2, StreamInitialize(Environment.CurrentDirectory + "/items/BrosItems.txt"));
                ArrayInitialize(2, StreamInitialize(Environment.CurrentDirectory + "/items/KeyItems.txt"));
                ArrayInitialize(2, StreamInitialize(Environment.CurrentDirectory + "/items/Shops.txt"));
                ArrayInitialize(2, StreamInitialize(Environment.CurrentDirectory + "/items/Espresso.txt"));
                ArrayInitialize(2, StreamInitialize(Environment.CurrentDirectory + "/items/Pants.txt"));
                ArrayInitialize(2, StreamInitialize(Environment.CurrentDirectory + "/items/Badges.txt"));
                ArrayInitialize(2, StreamInitialize(Environment.CurrentDirectory + "/items/Bowser.txt"));
            }

            if (gameId == 3)
            {
                ArrayInitialize(0, StreamInitialize(Environment.CurrentDirectory + "/bis/items/AllAddresses.txt"));
                ArrayInitialize(0, StreamInitialize(Environment.CurrentDirectory + "/bis/items/Shops.txt"));
            }
        }

        public void UpdateList()
        {
            if (gameId == 1)
            {
                for (int i = validityArray.Count - 1; i >= 0; i--)
                {
                    if (i <= validityArray.Count - 1)
                    {
                        if (Form1.pieces && validityArray[i].pieces != 0 && !validityArray[i].dress)
                        {
                            if (gameState.pieces == 4 && gameState.brooch && gameState.rose && gameState.fruitState == 3 && Convert.ToInt32(gameState.mario) >= Convert.ToInt32(validityArray[i].mario) && Convert.ToInt32(gameState.luigi) >= Convert.ToInt32(validityArray[i].luigi))
                            {
                                validLocations.Add(validityArray[i]);
                                validityArray = validityArray.Where(x => x.location != validityArray[i].location).ToList();
                            }
                        }
                        else if (gameState.hammerState >= validityArray[i].hammerState && Convert.ToInt32(gameState.rose) >= Convert.ToInt32(validityArray[i].rose) && Convert.ToInt32(gameState.brooch) >= Convert.ToInt32(validityArray[i].brooch) && Convert.ToInt32(gameState.fire) >= Convert.ToInt32(validityArray[i].fire) && Convert.ToInt32(gameState.thunder) >= Convert.ToInt32(validityArray[i].thunder) && gameState.fruitState >= validityArray[i].fruitState && Convert.ToInt32(gameState.membership) >= Convert.ToInt32(validityArray[i].membership) && Convert.ToInt32(gameState.winkle) >= Convert.ToInt32(validityArray[i].winkle) && Convert.ToInt32(gameState.beanstar) >= Convert.ToInt32(validityArray[i].beanstar) && Convert.ToInt32(gameState.dress) >= Convert.ToInt32(validityArray[i].dress) && Convert.ToInt32(gameState.mini) >= Convert.ToInt32(validityArray[i].mini) && Convert.ToInt32(gameState.under) >= Convert.ToInt32(validityArray[i].under) && Convert.ToInt32(gameState.dash) >= Convert.ToInt32(validityArray[i].dash) && Convert.ToInt32(gameState.crash) >= Convert.ToInt32(validityArray[i].crash) && gameState.neon >= validityArray[i].neon && gameState.currentBeanfruit >= validityArray[i].totalBeanfruit && Convert.ToInt32(gameState.spangle) >= Convert.ToInt32(validityArray[i].spangle) && Convert.ToInt32(gameState.mario) >= Convert.ToInt32(validityArray[i].mario) && Convert.ToInt32(gameState.luigi) >= Convert.ToInt32(validityArray[i].luigi))
                        {
                            if(Form1.pieces && validityArray[i].pieces != 0)
                            {
                                if (gameState.pieces == 4 && gameState.brooch && gameState.rose && gameState.fruitState == 3 && Convert.ToInt32(gameState.mario) >= Convert.ToInt32(validityArray[i].mario) && Convert.ToInt32(gameState.luigi) >= Convert.ToInt32(validityArray[i].luigi))
                                {
                                    validLocations.Add(validityArray[i]);
                                    validityArray = validityArray.Where(x => x.location != validityArray[i].location).ToList();
                                }
                            }
                            else
                            {
                                if (validityArray[i].totalBeanfruit >= 1)
                                    gameState.currentBeanfruit -= 1;
                                validLocations.Add(validityArray[i]);
                                validityArray = validityArray.Where(x => x.location != validityArray[i].location).ToList();
                            }
                        }
                    }
                }
            }

            if (gameId == 3)
            {
                int i = locationArray.Count - 1;
                foreach (LocationData data in validityArray.ToArray())
                {
                    validLocations.Add(data);
                    validityArray.RemoveAt(i);
                    i--;
                }
            }
        }

        public void SpoilerFill()
        {
            SpoilerArrayInitialize(0, StreamInitialize(Environment.CurrentDirectory + "/items/SpoilerNames.txt"));
            SpoilerArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/LocationNames.txt"));
            foreach (LocationData data in freshLocationArray.Where(d => d.itemType != 4 && d.itemType != 5).ToList())
            {
                int temp = 0;
                stream.Seek(data.location, SeekOrigin.Begin);
                if (data.itemType == 1)
                    temp = ItemConvert(stream.ReadByte(), stream.ReadByte());
                else
                    temp = stream.ReadByte();
                if (temp >= 0x30 && temp <= 0x93 || (temp == 0xA7 || temp == 0xAB || temp == 0xAD) || (temp >= 0xF8 && temp <= 0xFE))
                {
                    hints.Add(new Hint((byte)temp, spoilerLocationArray.Find(x => x.location == data.location).name, spoilerItemArray.Find(x => x.item == temp).name));
                    spoilerArray.Add(new Spoiler(spoilerLocationArray.Find(x => x.location == data.location).name, spoilerItemArray.Find(x => x.item == temp).name, data.location.ToString("X")));
                }
            }
            spoilerArray.Sort((x, y) => string.Compare(x.itemName, y.itemName));
        }

        public void Test()
        {
            List<(uint, int)> count = new System.Collections.Generic.List<(uint, int)>();
            foreach(LocationData data in freshLocationArray.Where(c => c.itemType < 4).ToList())
            {
                try
                {
                    (uint, int) temp = count.Where(c => c.Item1 == data.item).ToList()[0];
                    (uint, int) n = (temp.Item1, temp.Item2 + 1);
                    count[count.FindIndex(c => c == temp)] = n;
                }
                catch(Exception e)
                {
                    count.Add((data.item, 1));
                }
            }
            count.Sort(Comparer<(uint, int)>.Default);
            long total = 0;
            for(int i = 0; i < count.Count; i++)
                total += count[i].Item2;
            Console.WriteLine("Done.");
        }

        public void HintWrite()
        {
            List<(int, uint)> temp = new List<(int, uint)>();
            string[] arr = StreamInitialize(Environment.CurrentDirectory + "/items/Hint.txt");
            for (int i = 0; i < arr.Length; i += 2)
            {
                temp.Add((Convert.ToInt32(arr[i], 16), Convert.ToUInt32(arr[i + 1], 16)));
            }

            foreach (Hint hint in hints)
            {
                int hammers = 0;
                if (temp.Where(c => c.Item1 == hint.id).ToList()[0].Item2 != 0)
                {
                    stream.Seek(temp.Where(c => c.Item1 == hint.id).ToList()[0].Item2, SeekOrigin.Begin);
                    if (hint.id == 0x38)
                    {
                        int tempInt = stream.ReadByte();
                        if (tempInt != 0)
                        {
                            stream.Seek(0x4F, SeekOrigin.Current);
                            tempInt = stream.ReadByte();
                            if (tempInt != 0)
                            {
                                stream.Seek(0x4F, SeekOrigin.Current);
                                hammers = 2;
                            }
                            else
                            {
                                stream.Seek(-1, SeekOrigin.Current);
                                hammers = 1;
                            }
                        }
                        else
                            stream.Seek(-1, SeekOrigin.Current);
                    }
                    byte[] writeArr = new byte[] { 0x16, 0xA, 0xFF, 0xB, 0x1 };
                    byte[] tempArr = ASCIIToHex("The ");
                    writeArr = writeArr.Concat(tempArr).ToArray();
                    tempArr = new byte[] { 0xFF, 0x2B };
                    writeArr = writeArr.Concat(tempArr).ToArray();
                    if (hammers == 1)
                    {
                        tempArr = ASCIIToHex("Super ");
                        writeArr = writeArr.Concat(tempArr).ToArray();
                    }
                    if (hammers == 2)
                    {
                        tempArr = ASCIIToHex("Ultra ");
                        writeArr = writeArr.Concat(tempArr).ToArray();
                    }
                    tempArr = ASCIIToHex(hint.itemName);
                    writeArr = writeArr.Concat(tempArr).ToArray();
                    tempArr = new byte[] { 0xFF, 0x20 };
                    writeArr = writeArr.Concat(tempArr).ToArray();
                    tempArr = ASCIIToHex(" is in ");
                    writeArr = writeArr.Concat(tempArr).ToArray();
                    tempArr = new byte[] { 0xFF, 0x0, 0xFF, 0x2B };
                    writeArr = writeArr.Concat(tempArr).ToArray();
                    tempArr = ASCIIToHex(hint.location);
                    writeArr = writeArr.Concat(tempArr).ToArray();
                    tempArr = new byte[] { 0xFF, 0x20 };
                    writeArr = writeArr.Concat(tempArr).ToArray();
                    tempArr = new byte[] { 0x2E, 0xFF, 0x11, 0x1, 0xFF, 0xA };
                    writeArr = writeArr.Concat(tempArr).ToArray();
                    stream.Write(writeArr, 0, writeArr.Length);
                }
            }
        }

        public void SpoilerGen()
        {
            List<string> fileString = SeedInfo();
            foreach (Spoiler spoiler in spoilerArray.ToList())
            {
                fileString.Add(spoiler.itemName + " - " + spoiler.locationName + " - " + spoiler.locationHex);
            }
            File.WriteAllLines(Environment.CurrentDirectory + "/spoilers/" + hash + " Spoiler.txt", fileString);
        }

        public List<string> SeedInfo()
        {
            List<string> list = new List<string>();
            list.Add("Seed: " + hash);
            ConfigInfo(list);
            return list;
        }
        public static void ConfigInfo(List<string> list)
        {
            if (gameId == 1)
            {
                list.Add("Randomizer Version: " + Form1.progVersion);
                list.Add("Seed Type: " + Form1.seedType.ToString());
                list.Add("Chuckle: " + Form1.chuckle.ToString());
                list.Add("Item Blocks / Moles: " + Form1.items.ToString());
                list.Add("Coins: " + Form1.coins.ToString());
                list.Add("Hidden Blocks Visible: " + Form1.visible.ToString());
                list.Add("Item Blocks Invisible: " + Form1.invisible.ToString());
                list.Add("Remove Hidden Blocks: " + Form1.removeHidden.ToString());
                list.Add("Harhall's Pants: " + Form1.harhall.ToString());
                list.Add("Rose: " + Form1.rose.ToString());
                list.Add("Brooch: " + Form1.brooch.ToString());
                list.Add("Chuckola Fruit: " + Form1.chuckola.ToString());
                list.Add("Membership Card: " + Form1.membership.ToString());
                list.Add("Winkle Card: " + Form1.winkle.ToString());
                list.Add("Extra Dress: " + Form1.dress.ToString());
                list.Add("Fake Beanstar: " + Form1.beanstar.ToString());
                list.Add("Secret Scrolls: " + Form1.scrolls.ToString());
                list.Add("Beanfruit: " + Form1.fruit.ToString());
                list.Add("Neon Eggs: " + Form1.eggs.ToString());
                list.Add("Beanstones: " + Form1.beanstone.ToString());
                list.Add("Beanlets: " + Form1.beanlet.ToString());
                list.Add("Spangle: " + Form1.spangle.ToString());
                list.Add("Beanstar Pieces: " + Form1.pieces.ToString());
                list.Add("Hammers: " + Form1.hammers.ToString());
                list.Add("Hammer Moves: " + Form1.goblets.ToString());
                list.Add("Hands: " + Form1.hands.ToString());
                list.Add("Hand Moves: " + Form1.pearls.ToString());
                list.Add("Item Shops: " + Form1.shops.ToString());
                list.Add("Badges: " + Form1.badges.ToString());
                list.Add("Pants: " + Form1.pants.ToString());
                list.Add("Espresso: " + Form1.espresso.ToString());
                list.Add("EspressoKey: " + Form1.espressoKey.ToString());
                list.Add("BP Costs: " + Form1.brosBp.ToString());
                list.Add("Item Heal: " + Form1.itemHeal.ToString());
                list.Add("Espresso Stats: " + Form1.coffeeValue.ToString());
                list.Add("Disable Mush: " + Form1.mush.ToString());
                list.Add("Disable Surf: " + Form1.surf.ToString());
                list.Add("Skip Minecart: " + Form1.minecart.ToString());
                list.Add("Skip Bowsers: " + Form1.castle.ToString());
                list.Add("Skip intro: " + Form1.intro.ToString());
                list.Add("Start Castle: " + Form1.castletown.ToString());
                list.Add("Minigame Spoilers: " + Form1.minigame.ToString());
                list.Add("Random Enemies: " + Form1.enemy.ToString());
                list.Add("Random Bosses: " + Form1.bosses.ToString());
                list.Add("Scale HP: " + Form1.scale.ToString());
                list.Add("Tattle HP: " + Form1.tattle.ToString());
                list.Add(" ");
            }
        }



        public bool CheckValidity(List<dynamic> data)
        {
            if (gameId == 1)
            {
                byte temp;
                validityArray = new List<dynamic>(freshLocationArray);
                vBegin:
                if (!Form1.goblets)
                {
                    if (gameState.hammerState >= 1 && gameState.brooch)
                    {
                        gameState.mini = true;
                        gameState.under = true;
                    }
                }
                UpdateList();
                if (validLocations.Count > 0)
                {
                    for (int i = validLocations.Count - 1; i >= 0; i--)
                    {
                        if (i <= validLocations.Count - 1)
                        {
                            List<dynamic> read = data.Where(c => c.location == validLocations[i].location).ToList();
                            if (read.Count != 0)
                            {
                                dynamic tempData = read[0];
                                if (validLocations[i].location > 0x3C0000 && tempData.item == 0x38)
                                    return false;
                                UpdateState((byte)tempData.item);
                            }
                            else
                            {
                                stream.Seek(Convert.ToUInt32(validLocations[i].location), SeekOrigin.Begin);
                                if (validLocations[i].itemType == 1 || validLocations[i].itemType == 5)
                                    temp = (byte)ItemConvert(stream.ReadByte(), stream.ReadByte());
                                else
                                    temp = (byte)stream.ReadByte();
                                if (validLocations[i].location > 0x3C0000 && temp == 0x38)
                                    return false;
                                UpdateState(temp);
                            }
                            validLocations.RemoveAll(d => d.location == validLocations[i].location);
                        }
                    }
                    goto vBegin;
                }
                else
                {
                    if (Form1.seedType == 1 && gameState.hammerState == 3 && gameState.rose && gameState.fire && gameState.thunder && gameState.beanstar && gameState.dress && gameState.mini && gameState.under && gameState.dash && gameState.crash && gameState.mario && gameState.luigi)
                    {
                        if (Form1.pieces)
                        {
                            if (gameState.pieces == 4 && gameState.brooch && gameState.fruitState == 3)
                                return true;
                            else
                                return false;
                        }
                        else
                            return true;
                    }
                    Console.WriteLine(gameState.hammerState + " " + gameState.rose + " " + gameState.brooch + " " + gameState.fire + " " + gameState.thunder + " " + gameState.fruitState + " " + gameState.membership + " " + gameState.winkle + " " + gameState.dress + " " + gameState.beanstar + " " + gameState.mini + " " + gameState.under + " " + gameState.dash + " " + gameState.crash + " " + gameState.totalBeanfruit + " " + gameState.neon + " " + gameState.spangle + " " + gameState.pieces); ;
                    if (Form1.seedType == 2 && gameState.hammerState == 3 && gameState.rose && gameState.brooch && gameState.fire && gameState.thunder && gameState.fruitState == 3 && gameState.membership && gameState.winkle && gameState.beanstar && gameState.dress && gameState.mini && gameState.under && gameState.dash && gameState.crash && gameState.neon == 7 && gameState.totalBeanfruit == 7 && gameState.spangle && gameState.pieces == 4 && gameState.mario && gameState.luigi)
                        return true;
                }
            }

            if (gameId == 3)
            {
                return true;
            }
            return false;
        }

        public void ValidArrayAdd(dynamic data)
        {
            if (gameId == 1)
            {
                if (data.item == 0x1E)
                    Console.WriteLine('a');
                validLocationArray.Add(data);
                freshItemArray.Add((byte)data.item);
            }

            if (gameId == 3)
            {
                validLocationArray.Add(data);
                freshItemArray.Add(data.item);
            }
        }

        public void CheckOptions()
        {
            if (gameId == 1)
            {
                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/AllAddresses.txt"));
                if(!Form1.castle)
                {
                    ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/Bowser.txt"));
                }
                bool placedBro = false;
                LocationData tempData = new LocationData();
                foreach (LocationData data in optionsArray.ToList().Where(d => d.itemType != 4 && d.itemType != 5))
                {
                    if (!Form1.items && data.item != 0x1E && data.item != 0x1D)
                    {
                        if (Form1.invisible && data.itemType == 0)
                        {
                            stream.Seek(data.location - 6, SeekOrigin.Begin);
                            if (stream.ReadByte() == 0)
                            {
                                stream.Seek(-1, SeekOrigin.Current);
                                stream.WriteByte(0x10);
                            }
                        }
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                    else if (data.location == 0x39DB0F)
                    {
                        if (Form1.minecart || Form1.chuckle != 3)
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                            continue;
                        }
                        else
                        {
                            ValidArrayAdd(data);
                            continue;
                        }
                    }
                    else 
                    { 


                    if (Form1.removeHidden)
                    {
                        if (data.itemType == 0 && data.item != 0x1E)
                        {
                            stream.Seek(data.location - 6, SeekOrigin.Begin);
                            if (stream.ReadByte() == 0x10)
                            {
                                ItemInject(data.location, data.itemType, (byte)data.item);
                                if (Form1.visible)
                                {
                                    stream.Seek(data.location - 6, SeekOrigin.Begin);
                                    stream.WriteByte(0x0);
                                }
                                continue;
                            }
                            else
                            {
                                ValidArrayAdd(data);
                                if (Form1.visible)
                                {
                                    stream.Seek(data.location - 6, SeekOrigin.Begin);
                                    stream.WriteByte(0x0);
                                }
                                continue;
                            }
                        }
                    }
                    else
                    {
                        if (data.itemType == 0 && data.item != 0x1E)
                        {
                            stream.Seek(data.location - 6, SeekOrigin.Begin);
                            if (stream.ReadByte() == 0x10)
                            {
                                if (Form1.visible)
                                {
                                    stream.Seek(data.location - 6, SeekOrigin.Begin);
                                    stream.WriteByte(0x0);
                                }
                            }
                        }
                    }

                    if (data.item == 0x1E)
                    {
                        if (Form1.chuckle == 3)
                        {
                            ValidArrayAdd(data);
                        }
                        else if (Form1.chuckle == 2)
                        {
                            stream.Seek(data.location - 6, SeekOrigin.Begin);
                            if (stream.ReadByte() == 0xC0)
                            {
                                ItemInject(data.location, data.itemType, (byte)data.item);
                            }
                            else
                            {
                                ValidArrayAdd(data);
                            }
                        }
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }
                    else
                    {
                        if (tempData.item == 0x3B)
                            ValidArrayAdd(tempData);
                        else
                            ValidArrayAdd(data);
                    }

                    if (Form1.invisible)
                    {
                        if (data.itemType == 0)
                        {
                            stream.Seek(data.location - 6, SeekOrigin.Begin);
                            if (stream.ReadByte() == 0x0)
                            {
                                stream.Seek(-1, SeekOrigin.Current);
                                stream.WriteByte(0x10);
                            }
                        }
                    }
                }

                }
                optionsArray = new List<dynamic>();
                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/Espresso.txt"));
                foreach (LocationData data in optionsArray.ToList().Where(d => d.itemType != 4 && d.itemType != 5))
                {
                    if (Form1.espresso)
                    {
                        if(Form1.espressoKey)
                            ValidArrayAdd(new LocationData(data.location, data.item, data.itemType, 3, true, true, true, true, 3, true, true, true, true, true, true, true, true, 7, 0, true, 4, true, true));
                        else
                            ValidArrayAdd(data);
                    }
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                }
                optionsArray = new List<dynamic>();
                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/Shops.txt"));
                foreach (LocationData data in optionsArray.ToList().Where(d => d.itemType != 4 && d.itemType != 5))
                {
                    if (Form1.shops)
                    {
                        ValidArrayAdd(data);
                    }
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                }
                optionsArray = new List<dynamic>();
                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/Pants.txt"));
                foreach (LocationData data in optionsArray.ToList().Where(d => d.itemType != 4 && d.itemType != 5))
                {
                    if (Form1.surf && data.item == 0xEB)
                    {
                        ItemInject(data.location, data.itemType, 0xEB);
                        continue;
                    }

                    if (data.item == 0xF1)
                    {
                        if (Form1.harhall)
                        {
                            ValidArrayAdd(data);
                            continue;
                        }
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                            continue;
                        }
                    }

                    if (Form1.pants)
                    {
                        ValidArrayAdd(data);
                    }
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                }
                optionsArray = new List<dynamic>();
                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/Badges.txt"));
                foreach (LocationData data in optionsArray.ToList().Where(d => d.itemType != 4 && d.itemType != 5))
                {
                    if (Form1.mush && (data.item == 0xAB || data.item == 0xAD || data.item == 0xA7))
                    {
                        ItemInject(data.location, data.itemType, 0xA);
                        goto mushSkip;
                    }

                    if (data.item == 0x9E)
                    {
                        ItemInject(data.location, data.itemType, 0x9E);
                        goto mushSkip;
                    }

                    if (Form1.badges)
                    {
                        ValidArrayAdd(data);
                    }
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                    mushSkip:;
                }
                optionsArray = new List<dynamic>();
                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/Coins.txt"));
                foreach (LocationData data in optionsArray.ToList().Where(d => d.itemType != 4 && d.itemType != 5))
                {
                    if (Form1.coins)
                    {
                        ValidArrayAdd(data);
                    }
                    if (Form1.invisible)
                    {
                        stream.Position = data.location - 6;
                        stream.WriteByte(0x10);
                    }

                }
                optionsArray = new List<dynamic>();
                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/BrosItems.txt"));
                foreach (LocationData data in optionsArray.ToList().Where(d => d.itemType != 4 && d.itemType != 5))
                {
                    if (data.item == 0x38)
                    {
                        if (Form1.hammers)
                        {
                            ValidArrayAdd(data);
                        }
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }

                    if (data.item == 0x39 || data.item == 0x3A)
                    {
                        if (Form1.hands)
                        {
                            ValidArrayAdd(data);
                        }
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                            stream.Seek(0x1e9411, SeekOrigin.Begin);
                            stream.WriteByte(0x1);
                        }
                    }
                }
                optionsArray = new List<dynamic>();
                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/KeyItems.txt"));
                foreach (LocationData data in optionsArray.ToList().Where(d => d.itemType != 4 && d.itemType != 5))
                {
                    if ((byte)data.item == 0x31)
                    {
                        if (Form1.rose)
                            ValidArrayAdd(data);
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }

                    if (data.item == 0x32)
                    {
                        if (Form1.brooch)
                            ValidArrayAdd(data);
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }

                    if (data.item == 0x33 || data.item == 0x34)
                    {
                        if (Form1.goblets)
                            ValidArrayAdd(data);
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                            stream.Seek(0xD00005, SeekOrigin.Begin);
                            stream.WriteByte(0x1);
                        }
                    }

                    if (data.item >= 0x35 && data.item <= 0x37)
                    {
                        if (Form1.chuckola)
                            ValidArrayAdd(data);
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }

                    if (data.item == 0x40)
                    {
                        if (Form1.membership)
                            ValidArrayAdd(data);
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }

                    if (data.item == 0x41)
                    {
                        if (Form1.winkle)
                            ValidArrayAdd(data);
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }

                    if (data.item == 0x43)
                    {
                        if (Form1.beanstar)
                            ValidArrayAdd(data);
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }

                    if (data.item == 0x42)
                    {
                        if (Form1.dress)
                            ValidArrayAdd(data);
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }

                    if (data.item == 0x45 || data.item == 0x46)
                    {
                        if (Form1.pearls)
                            ValidArrayAdd(data);
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                            stream.Seek(0xD00006, SeekOrigin.Begin);
                            stream.WriteByte(0x1);
                        }
                    }

                    if (data.item >= 0x47 && data.item <= 0x55)
                    {
                        if (Form1.fruit)
                            ValidArrayAdd(data);
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }

                    if (data.item >= 0x56 && data.item <= 0x64)
                    {
                        if (Form1.eggs)
                            ValidArrayAdd(data);
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }

                    if (data.item >= 0x65 && data.item <= 0x70)
                    {
                        if (Form1.pieces)
                        {
                            ValidArrayAdd(data);
                            stream.Seek(0xD00004, SeekOrigin.Begin);
                            stream.WriteByte(0x1);
                        }
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }

                    if (data.item >= 0x92 && data.item <= 0x93)
                    {
                        if (Form1.scrolls)
                            ValidArrayAdd(data);
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }

                    if (data.item >= 0x80 && data.item <= 0x91)
                    {
                        if (Form1.beanstone)
                            ValidArrayAdd(data);
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }

                    if (data.item >= 0x73 && data.item <= 0x77)
                    {
                        if (Form1.beanlet)
                            ValidArrayAdd(data);
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }

                    if (data.item == 0x72)
                    {
                        if (Form1.spangle)
                            ValidArrayAdd(data);
                        else
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                    }

                }
                optionsArray = new List<dynamic>();      
            }
            if (gameId == 3)
            {
                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/bis/items/AllAddresses.txt"));
                foreach (BiSLocationData data in optionsArray.ToArray())
                {
                    ValidArrayAdd(data);
                    optionsArray.Remove(data);
                }

                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/bis/items/Shops.txt"));
                foreach (BiSLocationData data in optionsArray.ToArray())
                {
                    ValidArrayAdd(data);
                    optionsArray.Remove(data);
                }
            }
        }

        public void SpoilerArrayInitialize(int array, string[] data)
        {
            for (int i = 0; i < data.Length; i += 2)
            {
                if (array == 0)
                {
                    spoilerItemArray.Add(new SpoilerItem(Convert.ToUInt32(data[i], 16), data[i + 1]));
                }

                if (array == 1)
                {
                    spoilerLocationArray.Add(new SpoilerLocation(Convert.ToUInt32(data[i], 16), data[i + 1]));
                }
            }
        }

        public void ColorSwap(string color, int bro, string pants)
        {
            if (pants != "" && (color == "Vanilla" || (bro == 0 && (Form1.mColor == "TrueChaos" || Form1.mColor == "Silhouette")) || (bro == 1 && (Form1.lColor == "TrueChaos" || Form1.lColor == "Silhouette"))))
                return;
            string tempcolor;
            string[] temp;
            Palette palette;
            if (color.Contains(','))
            {
                palette = new Palette(color);
                temp = StreamInitialize(Environment.CurrentDirectory + "/colors/" + pants + "Custom.txt");
                tempcolor = "Custom";
            }
            else
            {
                palette = new Palette();
                tempcolor = color;
                temp = StreamInitialize(Environment.CurrentDirectory + "/colors/" + pants + tempcolor + ".txt");
            }
            List<Color> colors = new List<Color>();
            if (tempcolor == "Chaos" || tempcolor == "TrueChaos")
            {
                for (int i = 0; i < temp.Length; i += 2)
                {
                    colors.Add(new Color(Convert.ToUInt32(temp[i], 16), (byte)random.Next(0x0, 0x100), (byte)random.Next(0x0, 0x80), Convert.ToInt32(temp[i + 1], 16)));
                }
            }
            else if (tempcolor == "Custom")
            {
                for (int i = 0; i < temp.Length; i += 3)
                {
                    int shade = Convert.ToInt32(temp[i + 1], 16);
                    colors.Add(new Color(Convert.ToUInt32(temp[i], 16), palette.shades[shade].byte1, palette.shades[shade].byte2, Convert.ToInt32(temp[i + 2], 16)));
                }
            }
            else
            {
                for (int i = 0; i < temp.Length; i += 4)
                {
                    colors.Add(new Color(Convert.ToUInt32(temp[i], 16), (byte)Convert.ToInt32(temp[i + 1], 16), (byte)Convert.ToInt32(temp[i + 2], 16), Convert.ToInt32(temp[i + 3], 16)));
                }
            }

            colors.RemoveAll(s => s.bro != bro);

            foreach (Color c in colors)
            {
                stream.Seek(c.location, SeekOrigin.Begin);
                stream.Write(new byte[] { c.byte1, c.byte2 }, 0, 2);
            }
        }

        public static string GenColor(string color, bool pants)
        {
            string[] colors = new string[] { "Red", "Green", "Purple", "Yellow", "Black", "Pink", "Cyan", "Blue", "Orange", "White", "Silhouette" };
            string[] pColors = new string[] { "Red", "Green", "Purple", "Yellow", "Black", "Pink", "Cyan", "Blue", "Orange", "White" };
            string temp = color;
            switch (temp)
            {

                case "Random":
                    if (!pants)
                        temp = colors[random.Next(0, colors.Length)];
                    else
                        temp = pColors[random.Next(0, pColors.Length)];
                    return temp;

                default:
                    return temp;
            }
        }

        public void NewSound()
        {
            if(Form1.sounds)
            {
                List<int> pointers = new List<int>();
                List<byte[]> sounds = new List<byte[]>();
                stream.Position = 0x21CC44;
                for(int i = 0; i < 353; i++)
                {
                    byte[] pArr = new byte[4];
                    stream.Read(pArr, 0, 4);
                    pointers.Add(pArr[0] | pArr[1] << 8 | pArr[2] << 16);
                    pointers.Sort();
                }

                for(int i = 0; i < pointers.Count; i++)
                {
                    stream.Position = pointers[i];
                    byte read = 0;
                    while(read != 0xFF)
                    {
                        read = (byte)stream.ReadByte();
                        if(read == 0xFF && (pointers[i + 1] - stream.Position) > 4)
                        {
                            read = 0;
                        }
                    }
                    if(stream.ReadByte() == 0xFF)
                    {
                        pointers.RemoveAt(i);
                    }
                    else
                    {
                        stream.Position = pointers[i];
                        byte[] temp = new byte[4];
                        stream.Read(temp, 0, 4);
                        sounds.Add(temp);
                    }
                }
                sounds.Shuffle(random);
                for (int i = 0; i < pointers.Count; i++)
                {
                    stream.Position = pointers[i];
                    stream.Write(sounds[random.Next(sounds.Count)], 0, 4);
                }
            }
        }


        public void MusicRandomize()
        {
            if (Form1.sounds)
            {
                List<int> pointers = new List<int>();
                List<byte[]> sounds = new List<byte[]>();
                stream.Position = 0x21CC44;
                for (int i = 0; i < 353; i++)
                {
                    byte[] pArr = new byte[4];
                    stream.Read(pArr, 0, 4);
                    pointers.Add(pArr[0] | pArr[1] << 8 | pArr[2] << 16);
                    pointers.Sort();
                    pointers.Reverse();
                }

                for (int i = pointers.Count - 1; i >= 0; i--)
                {
                    if (i == 0)
                        goto skip;
                    int j = 1;
                    byte read = 0;
                    while (true)
                    {
                        stream.Position = pointers[i - 1] - j;
                        read = (byte)stream.ReadByte();
                        if (read != 0xFF)
                        {
                            j++;
                            continue;
                        }
                        else
                            break;
                    }
                    stream.Position = stream.Position = pointers[i - 1] - (j + 1);
                    skip:
                    if (stream.ReadByte() >= 0xFE && i != 0)
                    {
                        pointers.RemoveAt(i);
                    }
                    else
                    {
                        byte[] temp = { (byte)(pointers[i] & 0xFF), (byte)(pointers[i] >> 8 & 0xFF), (byte)(pointers[i] >> 16 & 0xFF), 0x8 };
                        sounds.Add(temp);
                    }
                }
                sounds.Shuffle(random);
                stream.Position = 0x21CC44;
                for (int i = 0; i < pointers.Count; i++)
                {
                    long currentPos = stream.Position;
                    byte[] pArr = new byte[4];
                    stream.Read(pArr, 0, 4);
                    if (!pointers.Contains(pArr[0] | pArr[1] << 8 | pArr[2] << 16))
                        continue;
                    stream.Position = currentPos;
                    stream.Write(sounds[random.Next(sounds.Count)], 0, 4);
                }
            }

            if (Form1.mDisable)
            {
                stream.Seek(0x19B118, SeekOrigin.Begin);
                stream.Write(new byte[] { 0x0, 0x25 }, 0, 2);
                return;
            }

            if (!Form1.music)
                return;

            List<byte[]> songs = new List<byte[]>();
            stream.Seek(0x21cb74, SeekOrigin.Begin);
            while (true)
            {
                if (stream.Position == 0x21cbd8)
                {
                    stream.Seek(4, SeekOrigin.Current);
                    continue;
                }
                if (stream.Position == 0x21cc3c)
                    break;
                byte[] temp = new byte[4];
                stream.Read(temp, 0, 4);
                songs.Add(temp);
            }
            songs.Shuffle(random);
            stream.Seek(0x21cb74, SeekOrigin.Begin);
            for (int i = songs.Count - 1; i >= 0; i--)
            {
                if (stream.Position == 0x21cbd8)
                {
                    stream.Seek(4, SeekOrigin.Current);
                    i++;
                    continue;
                }
                stream.Write(songs[i], 0, 4);
            }
        }

        public void BackgroundRandomize()
        {
            if (Form1.background)
            {
                string[] location = StreamInitialize(Environment.CurrentDirectory + "/items/Enemies/Encounters.txt");
                string[] boss = StreamInitialize(Environment.CurrentDirectory + "/items/Enemies/BossEncounters.txt");
                location = location.Concat(boss).ToArray();
                foreach (string str in location)
                {
                    stream.Seek(Convert.ToUInt32(str, 16) + 3, SeekOrigin.Begin);
                    stream.WriteByte((byte)random.Next(0, 0x27));
                }
            }
        }

        public void SeedInject()
        {
            stream.Seek(0x400c5d, SeekOrigin.Begin);
            byte[] arr = ASCIIToHex("Version: " + FileVersionInfo.GetVersionInfo(Assembly.GetExecutingAssembly().Location).ProductVersion);
            stream.Write(arr, 0, arr.Length);
            arr = new byte[] { 0xff, 0x0 };
            stream.Write(arr, 0, 2);
            stream.Write(arr, 0, 2);
            arr = ASCIIToHex("Seed: " + hash);
            stream.Write(arr, 0, arr.Length);
            arr = new byte[] { 0xFF, 0x11, 0x1, 0xFF, 0xA, 0x00, 0x00 };
            stream.Write(arr, 0, arr.Length);
        }

        public void EnemyRandomize()
        {
            if (Form1.enemy || Form1.bosses != 1)
            {
                //Write byte for stat scale execution
                if (Form1.scale)
                {
                    stream.Seek(0xD00002, SeekOrigin.Begin);
                    stream.WriteByte(0x1);
                }
            }
            if (Form1.enemy)
            {
                PopulateEnemyArray();
                GenerateGroups();
            }
            else if (Form1.bosses == 1)
                return;

            if (Form1.bosses != 1)
                GenerateBossGroups();
            InsertGroups();
        }

        public void InsertGroups()
        {
            if (Form1.bosses == 3)
                groups.AddRange(bossGroups);
            groups.Shuffle(random);
            groups = stardustGroups.Concat(groups).ToList();
            string[] location = StreamInitialize(Environment.CurrentDirectory + "/items/Enemies/Encounters.txt");
            string[] boss = StreamInitialize(Environment.CurrentDirectory + "/items/Enemies/BossEncounters.txt");
            if (Form1.bosses == 3)
                location = location.Concat(boss).ToArray();
            Array.Sort(location);
            int count = 0;
            if (!Form1.enemy)
                goto eSkip;
            foreach (string str in location)
            {
                if (groups.Count > 0)
                {
                    if (Form1.castle && Convert.ToUInt32(str, 16) > 0x50402C && Convert.ToUInt32(str, 16) < 0x50434C)
                        continue;
                    count++;
                    EnemyGroup tempgroup = groups[0];
                    groups.RemoveAt(0);
                    stream.Seek(Convert.ToUInt32(str, 16), SeekOrigin.Begin);
                    stream.WriteByte(tempgroup.groupType);
                    for (int i = 0; i < 6; i++)
                    {
                        if (i < tempgroup.id.Count)
                        {
                            stream.Seek(Convert.ToUInt32(str, 16) + 8 + (i * 4), SeekOrigin.Begin);
                            stream.WriteByte(tempgroup.id[i]);
                            stream.Seek(1, SeekOrigin.Current);
                            stream.WriteByte(tempgroup.type[i]);
                            stream.Seek(Convert.ToUInt32(str, 16) + 1, SeekOrigin.Begin);
                            stream.WriteByte((byte)tempgroup.position);
                        }
                        else
                        {
                            stream.Seek(Convert.ToUInt32(str, 16) + 8 + (i * 4), SeekOrigin.Begin);
                            stream.WriteByte(0);
                            stream.Seek(1, SeekOrigin.Current);
                            stream.WriteByte(7);
                        }
                    }

                    stream.Seek(Convert.ToUInt32(str, 16) + 2, SeekOrigin.Begin);
                    stream.WriteByte((byte)tempgroup.boss);

                    if (tempgroup.data.Length > 0)
                    {
                        stream.Seek(Convert.ToUInt32(str, 16) + 4, SeekOrigin.Begin);
                        stream.Write(tempgroup.data, 0, 4);
                    }
                }
            }
            eSkip:
            if (Form1.bosses == 2)
            {
                foreach (string str in boss)
                {
                    if (Form1.castle && Convert.ToUInt32(str, 16) > 0x50402C && Convert.ToUInt32(str, 16) < 0x50434C)
                        continue;
                    bossGroups.Shuffle(random);
                    count++;
                    EnemyGroup tempgroup = bossGroups[0];
                    bossGroups.RemoveAt(0);
                    stream.Seek(Convert.ToUInt32(str, 16), SeekOrigin.Begin);
                    stream.WriteByte(tempgroup.groupType);
                    for (int i = 0; i < 6; i++)
                    {
                        if (i < tempgroup.id.Count)
                        {
                            stream.Seek(Convert.ToUInt32(str, 16) + 8 + (i * 4), SeekOrigin.Begin);
                            stream.WriteByte(tempgroup.id[i]);
                            stream.Seek(1, SeekOrigin.Current);
                            stream.WriteByte(tempgroup.type[i]);
                            stream.Seek(Convert.ToUInt32(str, 16) + 1, SeekOrigin.Begin);
                            stream.WriteByte((byte)tempgroup.position);
                        }
                        else
                        {
                            stream.Seek(Convert.ToUInt32(str, 16) + 8 + (i * 4), SeekOrigin.Begin);
                            stream.WriteByte(0);
                            stream.Seek(1, SeekOrigin.Current);
                            stream.WriteByte(7);
                        }
                    }

                    stream.Seek(Convert.ToUInt32(str, 16) + 2, SeekOrigin.Begin);
                    stream.WriteByte((byte)tempgroup.boss);

                    if (tempgroup.data.Length > 0)
                    {
                        stream.Seek(Convert.ToUInt32(str, 16) + 4, SeekOrigin.Begin);
                        stream.Write(tempgroup.data, 0, 4);
                    }
                }
            }
        }

        public void GenerateGroups()
        {
            bool noSpike = false;
            enemies.Shuffle(random);
            spikedEnemies.Shuffle(random);
            foreach (int size in groupSizes)
            {
                int tempsize;
                if (size > 4)
                    tempsize = 4;
                else
                    tempsize = size;
                if (tempsize == 0)
                    continue;
                List<byte> id = new List<byte>();
                List<byte> type = new List<byte>();
                List<Enemy> pestnuts = new List<Enemy>();
                List<Enemy> tempEnemies = new List<Enemy>();
                byte[] script = { 0xEE, 0x2C, 0x28, 0x8 };
                int nut = 0;
                int special = 0;
                for (int i = 0; i < tempsize; i++)
                {
                    if (enemies[0].id == 0x20 || enemies[0].id == 0x34)
                    {
                        nut++;
                        pestnuts.Add(enemies[0]);
                    }
                    else
                    {
                        tempEnemies.Add(enemies[0]);
                    }
                    if (enemies[0].id == 0x52 || enemies[0].id == 0x2C || enemies[0].id == 0x4A)
                        special = 1;
                    if (enemies[0].id == 0x52)
                        script = new byte[] { 0x67, 0xAB, 0x28, 0x8 };
                    enemies.RemoveAt(0);
                }

                if (pestnuts.Count == 3 && size == 4)
                {
                    foreach (Enemy enemy in pestnuts)
                    {
                        id.Add(enemy.id);
                        type.Add(enemy.type);
                    }
                    for (int i = 0; i < 3; i++)
                    {
                        id.Add(0xF);
                        type.Add(0x3);
                    }
                }
                else
                {
                    if (size == 1 && pestnuts.Count > 0)
                    {
                        id.Add(pestnuts[0].id);
                        type.Add(pestnuts[0].type);
                    }
                    for (int i = 0; i < tempEnemies.Count; i++)
                    {
                        if (i == 1)
                        {
                            foreach (Enemy enemy in pestnuts)
                            {
                                id.Add(enemy.id);
                                type.Add(enemy.type);
                            }
                        }
                        id.Add(tempEnemies[i].id);
                        type.Add(tempEnemies[i].type);
                    }

                    if (size == 4)
                    {
                        for (int i = 0; i < nut; i++)
                        {
                            id.Add(0xF);
                            type.Add(0x3);
                        }
                    }
                    else
                    {
                        if (pestnuts.Count > 0)
                        {
                            for (int i = 0; i < (4 - (pestnuts.Count + tempEnemies.Count)); i++)
                            {
                                id.Add(0x0);
                                type.Add(0x7);
                            }
                            for (int i = 0; i < nut; i++)
                            {
                                id.Add(0xF);
                                type.Add(0x3);
                            }
                        }
                    }
                }
                if (stardustGroups.Count < 3)
                    stardustGroups.Add(new EnemyGroup(id, type, size, script, special));
                else
                    groups.Add(new EnemyGroup(id, type, size, script, special));
                if (stardustGroups.Count == 3 && !noSpike)
                {
                    enemies = enemies.Concat(spikedEnemies).ToList();
                    enemies.Shuffle(random);
                    noSpike = true;
                }
            }
        }

        public void GenerateBossGroups()
        {
            string[] groupStr = StreamInitialize(Environment.CurrentDirectory + "/items/Enemies/BossEncounters.txt");

            foreach (string str in groupStr)
            {
                if (Convert.ToUInt32(str, 16) > 0x50402C && Convert.ToUInt32(str, 16) < 0x50434C && Form1.castle)
                    continue;
                stream.Seek(Convert.ToUInt32(str, 16) + 2, SeekOrigin.Begin);
                int boss = stream.ReadByte();
                stream.Seek(Convert.ToUInt32(str, 16) + 4, SeekOrigin.Begin);
                byte[] data = new byte[4];
                stream.Read(data, 0, 4);
                List<byte> id = new List<byte>();
                List<byte> types = new List<byte>();
                bool iterate = true;
                int i = 0;
                while (iterate)
                {
                    stream.Seek(Convert.ToUInt32(str, 16) + 10 + (i * 4), SeekOrigin.Begin);
                    byte type = (byte)stream.ReadByte();
                    types.Add(type);
                    stream.Seek(-3, SeekOrigin.Current);
                    id.Add((byte)stream.ReadByte());
                    i++;
                    if (i == 6)
                        break;
                }
                stream.Seek(Convert.ToUInt32(str, 16) + 1, SeekOrigin.Begin);
                bossGroups.Add(new EnemyGroup(0xE4, id, types, stream.ReadByte(), data, boss));
            }
        }

        public void PopulateEnemyArray()
        {
            string[] tempString = StreamInitialize(Environment.CurrentDirectory + "/items/Enemies/Encounters.txt");
            foreach (string str in tempString)
            {
                int i = 0;
                int count = 0;
                while (true)
                {
                    if(Convert.ToUInt32(str, 16) > 0x50402C && Convert.ToUInt32(str, 16) < 0x50434C && Form1.castle)
                        break;
                    stream.Seek(Convert.ToUInt32(str, 16) + 10 + (i * 4), SeekOrigin.Begin);
                    byte type = (byte)stream.ReadByte();
                    if (type == 0x0)
                        type = 0x4;
                    int id = 0;
                    if (type == 0x7)
                        break;
                    stream.Seek(-3, SeekOrigin.Current);
                    id = stream.ReadByte();
                    if (id == 0x18 || id == 0x53 || id == 0x4B || (id >= 0x2D && id <= 0x30) || id == 0x3C)
                        type = 0x4;
                    if (id == 0xF && type == 0x3)
                        goto skipAdd;

                    if (id == 0x16 || id == 0x1E || id == 0x20 || id == 0x34 || id == 0x35 || id == 0x36 || id == 0x37 || id == 0x38 || id == 0x46)
                        spikedEnemies.Add(new Enemy((byte)id, type));
                    else
                        enemies.Add(new Enemy((byte)id, type));
                    count++;
                    skipAdd:
                    i++;
                    if (i == 6)
                        break;
                }
                if (count > 4)
                    count = 4;
                if(count != 0)
                    groupSizes.Add(count);
            }
        }

        public void RandomizeStats()
        {
            if (Form1.brosBp)
            {
                string[] str = StreamInitialize(Environment.CurrentDirectory + "/items/Stats/BrosBP.txt");
                int i = 0;
                foreach (string location in str)
                {
                    stream.Seek(Convert.ToUInt32(location, 16), SeekOrigin.Begin);
                    if (i == 0 || i == 4)
                    {
                        stream.WriteByte((byte)random.Next(1, 10));
                        stream.WriteByte((byte)random.Next(1, 10));
                    }
                    else
                    {
                        stream.WriteByte((byte)random.Next(1, 15));
                        stream.WriteByte((byte)random.Next(1, 15));
                    }
                    i++;
                }
            }

            if (Form1.itemHeal)
            {
                ItemValueInject(StreamInitialize(Environment.CurrentDirectory + "/items/Stats/HealValues.txt"));
            }

            if (Form1.coffeeValue)
            {
                ItemValueInject(StreamInitialize(Environment.CurrentDirectory + "/items/Stats/EspressoValues.txt"));
            }
        }

        public void ItemValueInject(string[] str)
        {
            for (int i = 0; i < str.Length; i += 4)
            {
                int value = random.Next(1, Convert.ToInt32(str[i + 1], 16));
                int length = Convert.ToInt32(str[i + 2], 16);
                byte[] arr = Encoding.ASCII.GetBytes(Convert.ToString(value));
                if (arr.Length < length)
                {
                    length -= arr.Length;
                    for (int j = 0; j < length; j++)
                    {
                        arr = arr.Concat(new byte[] { 0x20 }).ToArray();
                    }
                }
                stream.Seek(Convert.ToUInt32(str[i], 16), SeekOrigin.Begin);
                stream.WriteByte((byte)value);
                stream.Seek(Convert.ToUInt32(str[i + 3], 16), SeekOrigin.Begin);
                stream.Write(arr, 0, arr.Length);
            }
        }

        public void ArrayInitialize(int array, string[] data)
        {
            if (gameId == 1)
            {
                for (int i = 0; i < data.Length; i += 23)
                {
                    if (array == 1)
                    {
                        optionsArray.Add(new LocationData(Convert.ToUInt32(data[i], 16),
                                                           Convert.ToUInt32(data[i + 1], 16),
                                                           Convert.ToInt32(data[i + 2], 16),
                                                           Convert.ToInt32(data[i + 3], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 4], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 5], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 6], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 7], 16)),
                                                           Convert.ToInt32(data[i + 8], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 9], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 10], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 11], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 12], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 13], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 14], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 15], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 16], 16)),
                                                           Convert.ToInt32(data[i + 17], 16),
                                                           Convert.ToInt32(data[i + 18], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 19], 16)),
                                                           Convert.ToInt32(data[i + 20], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 21], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 22], 16))));
                    }

                    if (array == 2)
                    {
                        freshLocationArray.Add(new LocationData(Convert.ToUInt32(data[i], 16),
                                                           Convert.ToUInt32(data[i + 1], 16),
                                                           Convert.ToInt32(data[i + 2], 16),
                                                           Convert.ToInt32(data[i + 3], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 4], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 5], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 6], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 7], 16)),
                                                           Convert.ToInt32(data[i + 8], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 9], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 10], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 11], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 12], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 13], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 14], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 15], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 16], 16)),
                                                           Convert.ToInt32(data[i + 17], 16),
                                                           Convert.ToInt32(data[i + 18], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 19], 16)),
                                                           Convert.ToInt32(data[i + 20], 16),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 21], 16)),
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 22], 16))));
                    }
                }
            }

            if (gameId == 3)
            {
                for (int i = 0; i < data.Length; i += 5)
                {
                    if (array == 0)
                        freshLocationArray.Add(new BiSLocationData(Convert.ToUInt32(data[i], 16), new bisitem((byte)Convert.ToUInt32(data[i + 1], 16), (byte)Convert.ToUInt32(data[i + 2], 16), (byte)Convert.ToUInt32(data[i + 3], 16), Convert.ToInt32(data[i + 4], 16))));
                    if (array == 1)
                        optionsArray.Add(new BiSLocationData(Convert.ToUInt32(data[i], 16), new bisitem((byte)Convert.ToUInt32(data[i + 1], 16), (byte)Convert.ToUInt32(data[i + 2], 16), (byte)Convert.ToUInt32(data[i + 3], 16), Convert.ToInt32(data[i + 4], 16))));
                }

            }
        }

        public static string[] StreamInitialize(string path)
        {
            var str = new StreamReader(path).ReadToEnd();
            string[] lines = str.Split(new char[] { ',' });
            for (int i = 0; i < lines.Length; i++)
            {
                lines[i] = lines[i].Trim('\n', '\r', ' ');
            }
            return lines;
        }

        public void SeedInitialize(string seed)
        {
            hash = AllNumbers(seed);
            if (seed != null && seed != "0" && hash == 0)
                hash = seed.GetHashCode();
            else if (hash != 0)
                Console.WriteLine(hash);
            else
                hash = Guid.NewGuid().GetHashCode();
            random = new Random(hash);
        }

        public void Randomize()
        {
            if (gameId == 1)
            {
                List<dynamic> itemArray = new List<dynamic>(freshItemArray);
                List<dynamic> locationArray = new List<dynamic>(validLocationArray);
                locationArray.Reverse();

                int iterationCount = 0;
                const int maxRetries = 50;
                List<dynamic> fakeLocationsArray;

                while (true)
                {
                    List<dynamic> tempItemArray = new List<dynamic>(itemArray);
                    tempItemArray.Shuffle(random);
                    List<dynamic> tempLocationArray = new List<dynamic>(locationArray);
                    tempLocationArray.Shuffle(random);
                    fakeLocationsArray = new List<dynamic>();

                    int retryCount = 0;

                    while (tempItemArray.Any())
                    {
                        if (retryCount > maxRetries || !tempLocationArray.Any())
                            break;

                        if (CheckValidSpot(tempLocationArray[0], tempItemArray[0]))
                        {
                            retryCount++;
                            tempItemArray.Shuffle(random);
                            continue;
                        }

                        var temp = tempLocationArray[0];
                        tempLocationArray.RemoveAt(0);
                        temp.item = tempItemArray[0];
                        tempItemArray.RemoveAt(0);
                        fakeLocationsArray.Add(temp);
                    }

                    gameState = new LocationData(0);

                    if (!CheckValidity(fakeLocationsArray))
                    {
                        validLocations = new List<dynamic>();
                        Console.WriteLine(++iterationCount);
                    }
                    else
                    {
                        break; // Exit loop if validity check passes
                    }
                }
                foreach (dynamic data in fakeLocationsArray)
                {
                    //Inject intems in pre-verified positions
                    ItemInject(data.location, data.itemType, (byte)data.item);
                }
                if (Form1.intro)
                {
                    //Enable Skip Intro in ROM
                    stream.Seek(0x244D08, SeekOrigin.Begin);
                    stream.Write(new byte[] { 0x88, 0x0, 0x19, 0x91, 0x1, 0x20, 0x58, 0x1, 0xF, 0xA0, 0x3, 0x15, 0x27, 0x8 }, 0, 14);
                }
                if(Form1.castletown)
                {
                    //Extra Pipes
                    stream.Seek(0xD00001, SeekOrigin.Begin);
                    stream.WriteByte(0x1);
                }
                if (Form1.castle)
                {
                    //Enable bowsers castle skip in ROM
                    stream.Seek(0x3AEAB0, SeekOrigin.Begin);
                    stream.Write(new byte[] { 0xC1, 0x67, 0x0, 0x6, 0x1C, 0x08, 0x3 }, 0, 7);
                    stream.Seek(0x3AEC18, SeekOrigin.Begin);
                    stream.Write(new byte[] { 0x89, 0x65, 0x0, 0xE, 0xA, 0x08, 0x1 }, 0, 7);

                }
                if (Form1.minecart)
                {
                    //Enable minecart skip in ROM
                    stream.Seek(0x3AC728, SeekOrigin.Begin);
                    stream.Write(new byte[] { 0x89, 0x13, 0x0, 0x10, 0xF, 0x08, 0x1 }, 0, 7);
                    stream.Seek(0x3AC56C, SeekOrigin.Begin);
                    stream.Write(new byte[] { 0x49, 0x16, 0x0, 0x8, 0x8, 0x08, 0x1 }, 0, 7);
                }
                if (Form1.minigame)
                {
                    //Enable minigame spoilers in ROM
                    stream.Seek(0x1E1EEF, SeekOrigin.Begin);
                    stream.WriteByte(0x1);
                }
                if(!Form1.doors)
                {
                    //Sink ship with no barrel minigame stuff
                    stream.Seek(0x25FD4E, SeekOrigin.Begin);
                    stream.Write(new byte[] { 0x48, 0x30, 0x80, 0x60, 0x50, 0x2, 0xF }, 0, 7);
                    stream.Seek(0x25FD83, SeekOrigin.Begin);
                    stream.Write(new byte[] { 0x48, 0x30, 0x80, 0x60, 0xC0, 0x2, 0xF }, 0, 7);
                    stream.Seek(0x25FDB8, SeekOrigin.Begin);
                    stream.Write(new byte[] { 0x48, 0x30, 0x05, 0x80, 0xE4, 0x0, 0xF }, 0, 7);
                    stream.Seek(0x25FDED, SeekOrigin.Begin);
                    stream.Write(new byte[] { 0x48, 0x30, 0x06, 0x80, 0xE4, 0x0, 0xF }, 0, 7);
                    stream.Seek(0x25FE22, SeekOrigin.Begin);
                    stream.Write(new byte[] { 0x48, 0x30, 0x07, 0x80, 0xE4, 0x0, 0xF }, 0, 7);
                    stream.Seek(0x25FE57, SeekOrigin.Begin);
                    stream.Write(new byte[] { 0x48, 0x30, 0x08, 0x80, 0xE4, 0x0, 0xF }, 0, 7);
                }
                if(Form1.tattle)
                {
                    stream.Position = 0xD00000;
                    stream.WriteByte(0x1);
                }
            }

            if (gameId == 3)
            {
                List<dynamic> itemArray = new List<dynamic>(freshItemArray);
                itemArray.Shuffle(random);
                locationArray = new List<dynamic>(validLocationArray);
                locationArray.Shuffle(random);
                for (int i = freshItemArray.Count - 1; i >= 0; i--)
                {
                    int retryCount = 0;
                    reInsert:
                    if (locationArray[i].item.itemType == 1 && itemArray[i].byte2 == 0xFF)
                    {
                        if (retryCount > 100)
                            break;
                        retryCount++;
                        itemArray.Shuffle(random);
                        goto reInsert;
                    }
                    ItemInject(locationArray[i], locationArray[i].item.itemType, itemArray[i]);
                    itemArray.RemoveAt(i);
                }
                gameState = new LocationData(0);
               /* if (!CheckValidity())
                {
                    validLocations = new List<dynamic>();
                    Console.WriteLine(++iterationCount);
                    goto rBegin;
                } */
            }
        }


        public void BISRead()
        {
            List<string> strings = new List<string>();
            stream.Seek(0x5944a01, SeekOrigin.Begin);
            while (true)
            {
                byte[] arr = new byte[3];
                string position = "0x" + string.Format("{0:X}", stream.Position);
                stream.Read(arr, 0, 3);
                if (arr[0] == 0 && arr[1] == 0 && arr[2] == 0 && stream.Position >= 0x5946a1A)
                    break;
                strings.Add(position + ",0x" + Convert.ToString(arr[1], 16) + ",0x" + Convert.ToString(arr[2], 16) + ",0x" + Convert.ToString(arr[0], 16) + ",");
                stream.Seek(9, SeekOrigin.Current);
            }
            File.WriteAllLines(Environment.CurrentDirectory + "/bis/items/AllAddresses2.txt", strings);
        }

        public bool CheckValidSpot(LocationData data, byte item)
        {

            /* if (item >= 47 && item <= 0x55)
            {
                if (data.totalBeanfruit > 0)
                    return true;
                else
                    return false;
            } */

            if(item < 0xA && data.itemType != 0)
                return true;

            switch (item)
            {

                case 0x31:
                    if (data.rose == true)
                        return true;
                    return false;

                case 0x32:
                    if (data.brooch == true)
                        return true;
                    return false;

                case 0x39:
                    if (data.fire == true)
                        return true;
                    return false;

                case 0x3A:
                    if (data.thunder == true)
                        return true;
                    return false;

                case 0x40:
                    if (data.membership == true)
                        return true;
                    return false;

                case 0x41:
                    if (data.winkle == true)
                        return true;
                    return false;


                case 0x42:
                    if (data.beanstar == true)
                        return true;
                    return false;

                case 0x43:
                    if (data.dress == true)
                        return true;
                    return false;

                case 0x35:
                    if (data.fruitState == 3)
                        return true;
                    return false;

                case 0x36:
                    if (data.fruitState == 3)
                        return true;
                    return false;

                case 0x37:
                    if (data.fruitState == 3)
                        return true;
                    return false;

                case 0x33:
                    if (data.mini == true)
                        return true;
                    return false;

                case 0x34:
                    if (data.under == true)
                        return true;
                    return false;

                case 0x45:
                    if (data.dash == true)
                        return true;
                    return false;

                case 0x46:
                    if (data.crash == true)
                        return true;
                    return false;

                case 0x65:
                    if (data.pieces != 0)
                        return true;
                    return false;

                case 0x66:
                    if (data.pieces != 0)
                        return true;
                    return false;

                case 0x67:
                    if (data.pieces != 0)
                        return true;
                    return false;

                case 0x70:
                    if (data.pieces != 0)
                        return true;
                    return false;

                case 0x72:
                    if (data.spangle == true)
                        return true;
                    return false;

                default:
                    return false;

            }
        }


        public int ItemConvert(int b1, int b2)
        {
            b1 -= 0x20;
            b1 *= 0x10;
            b2 /= 0x10;

            return b1 + b2;
        }


        public void ItemInject(dynamic location, int itemType, dynamic item)
        {
            if (gameId == 1)
            {
                switch (itemType)
                {

                    case 0:
                        stream.Seek(location, SeekOrigin.Begin);
                        stream.WriteByte(item);
                        break;

                    case 1:
                        if (item == 0x1D || item == 0x1E)
                            item += 0xE;
                        if (item >= 0x20 && item <= 0x26)
                            item -= 0x4;
                        int insert = Convert.ToInt32(item);
                        int insert2 = insert % 0x10;
                        insert2 *= 0x10;
                        insert /= 0x10;
                        insert += 0x20;
                        stream.Seek(location, SeekOrigin.Begin);
                        stream.WriteByte(Convert.ToByte(insert));
                        stream.WriteByte(Convert.ToByte(insert2));
                        break;

                    case 3:
                        if (item == 0x1D || item == 0x1E)
                            item += 0xE;
                        if (item < 0x1D)
                            item -= 0xA;
                        if (item >= 0x20 && item <= 0x26)
                            item -= 0xE;
                        stream.Seek(location, SeekOrigin.Begin);
                        stream.WriteByte((byte)item);
                        break;

                    case 2:
                        if (item == 0x1D || item == 0x1E)
                            item += 0xE;
                        if (item >= 0x20 && item <= 0x26)
                            item -= 0x4;
                        stream.Seek(location, SeekOrigin.Begin);
                        stream.WriteByte((byte)item);
                        break;


                    default:
                        stream.Seek(location, SeekOrigin.Begin);
                        stream.WriteByte(Convert.ToByte(0x18));
                        break;
                }
            }

            if (gameId == 3)
            {
                switch (itemType)
                {
                    case 0:
                        stream.Seek(location.location - 0x5944A00, SeekOrigin.Begin);
                        stream.Write(new byte[] { item.quantity, item.byte1, item.byte2 }, 0, 3);
                        break;

                    case 1:
                        break;
                        stream.Seek(location.location, SeekOrigin.Begin);
                        byte replace = location.item.byte1;
                        while (true)
                        {
                            byte[] arr = new byte[2];
                            stream.Read(arr, 0, 2);
                            if (arr[0] + arr[1] == 0)
                                break;
                            if (arr[0] == replace)
                            {
                                stream.Seek(-2, SeekOrigin.Current);
                                stream.Write(new byte[] { item.byte1, item.byte2 }, 0, 2);
                            }
                        }
                        break;

                    default:
                        break;
                }
            }

        }

        public int AllNumbers(string seed)
        {
            int.TryParse(seed, out int i);
            return i;
        }

        public void Inject()
        {
            Process process = new Process();
            ProcessStartInfo startInfo = new ProcessStartInfo();
            startInfo.WindowStyle = ProcessWindowStyle.Hidden;
            string domain = @Environment.CurrentDirectory + @"/asm/";
            startInfo.WorkingDirectory = domain;
            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                startInfo.FileName = "cmd.exe";
                startInfo.Arguments = "/C armips.exe Logic.asm";
            }
            else
            { // Linux
                startInfo.FileName = "sh";
                startInfo.Arguments = "-c './armips Logic.asm'";
            }
            process.StartInfo = startInfo;
            process.Start();
            process.WaitForExit();
            File.Delete(Environment.CurrentDirectory + "/asm/mlss.gba");
        }

        public byte[] ASCIIToHex(string strValue)
        {
            return Encoding.UTF8.GetBytes(strValue);
        }

        public static System.Drawing.Color HexToColor(string hex)
        {
            string[] indiv = hex.Split(',');
            string r = indiv[0].Length > 1 ? indiv[0] : "0" + indiv[0];
            string g = indiv[1].Length > 1 ? indiv[1] : "0" + indiv[1];
            string b = indiv[2].Length > 1 ? indiv[2] : "0" + indiv[2];
            return System.Drawing.ColorTranslator.FromHtml("#" + r + g + b);
        }

        public static GbaColor HexTo15Bit(byte r, byte g, byte b)
        {
            string rs = Convert.ToString(r, 16);
            string gs = Convert.ToString(g, 16);
            string bs = Convert.ToString(b, 16);
            rs = Convert.ToString(Convert.ToInt32(rs, 16), 2).PadLeft(8, '0').Substring(0, 5);
            gs = Convert.ToString(Convert.ToInt32(gs, 16), 2).PadLeft(8, '0').Substring(0, 5);
            bs = Convert.ToString(Convert.ToInt32(bs, 16), 2).PadLeft(8, '0').Substring(0, 5);
            StringBuilder sb = new StringBuilder();
            sb.Append(bs);
            sb.Append(gs);
            sb.Append(rs);
            uint byte1 = Convert.ToUInt32(sb.ToString().Substring(7), 2);
            uint byte2 = Convert.ToUInt32(sb.ToString().Substring(0, 7), 2);

            return new GbaColor((byte)byte1, (byte)byte2);
        }
    }

}