using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.IO;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.CodeDom.Compiler;
using System.Threading;


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
        public static string[] Random(string path, string seed)
        {
            rom = new Rom(path, seed);
            rom.Randomize();
            rom.SpoilerFill();
            rom.SpoilerGen();
            rom.EnemyRandomize();
            rom.RandomizeStats();
            rom.stream.Close();
            rom.Inject();
            return new string[2] { Environment.CurrentDirectory + "\\asm\\mlss_loop.gba", Convert.ToString(rom.hash) };
        }
    }

    class Rom
    {
        public FileStream stream;
        static Random random;
        public int hash;
        List<LocationData> freshLocationArray = new List<LocationData>();
        List<LocationData> validLocationArray = new List<LocationData>();
        List<LocationData> optionsArray = new List<LocationData>();
        List<LocationData> locationArray = new List<LocationData>();
        List<LocationData> validLocations = new List<LocationData>();
        List<Spoiler> spoilerArray = new List<Spoiler>();
        List<SpoilerItem> spoilerItemArray = new List<SpoilerItem>();
        List<SpoilerLocation> spoilerLocationArray = new List<SpoilerLocation>();
        List<byte> itemArray = new List<byte>();
        public LocationData gameState = new LocationData(0);
        public int iterationCount = 0;
        public List<Enemy> enemies = new List<Enemy>();
        public List<int> groupSizes = new List<int>();
        public List<EnemyGroup> groups = new List<EnemyGroup>();
        public List<StatCount> enemyCount = new List<StatCount>();

        public int healthMax = 155;
        public int defenceMax = 130;
        public int speedMax = 100;
        public float fightCeil = 200.0f;


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
            public EnemyGroup(List<byte> id, List<byte> type, int position, byte[] data)
            {
                this.id = id;
                this.type = type;
                this.position = position;
                this.data = data;
                boss = 0;
            }

            public EnemyGroup(List<byte> id, List<byte> type, int position, byte[] data, int boss)
            {
                this.id = id;
                this.type = type;
                this.position = position;
                this.data = data;
                this.boss = boss;
            }

            public int size { get { return id.Count; } set { } }
            public List<byte> id;
            public List<byte> type;
            public byte[] data;
            public int position;
            public int boss;
        }

        public struct StatCount
        {
            public StatCount(int id)
            {
                this.id = id;
                count = 1;
                total = 0;
            }

            public int id;
            public int count;
            public int total;
        }

        public struct LocationData
        {
            public LocationData(uint location, uint item, int itemType, int hammerState, bool rose, bool brooch, bool fire, bool thunder, int fruitState, bool membership, bool winkle, bool beanstar, bool dress, bool mini, bool under, bool dash, bool crash)
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
        }

        public void UpdateState(byte item)
        {
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

                default:
                    break;

            }
        }

        public Rom(string path, string seed)
        {
            if (!File.Exists(Environment.CurrentDirectory + "\\asm\\mlss.gba"))
                File.Copy(path, Environment.CurrentDirectory + "\\asm\\mlss.gba");
            stream = new FileStream(Environment.CurrentDirectory + "\\asm\\mlss.gba", FileMode.Open);
            FreshArrayPopulate();
            SeedInitialize(seed);
            CheckOptions();
            ArrayInitialize(0, StreamInitialize(Environment.CurrentDirectory + "\\items\\AllAddresses.txt"));
        }

        public void FreshArrayPopulate()
        {
            ArrayInitialize(2, StreamInitialize(Environment.CurrentDirectory + "\\items\\AllAddresses.txt"));
            ArrayInitialize(2, StreamInitialize(Environment.CurrentDirectory + "\\items\\BrosItems.txt"));
            ArrayInitialize(2, StreamInitialize(Environment.CurrentDirectory + "\\items\\KeyItems.txt"));
            ArrayInitialize(2, StreamInitialize(Environment.CurrentDirectory + "\\items\\Shops.txt"));
            ArrayInitialize(2, StreamInitialize(Environment.CurrentDirectory + "\\items\\Espresso.txt"));
            ArrayInitialize(2, StreamInitialize(Environment.CurrentDirectory + "\\items\\Pants.txt"));
            ArrayInitialize(2, StreamInitialize(Environment.CurrentDirectory + "\\items\\Badges.txt"));
        }

        public void UpdateList()
        {
            int i = locationArray.Count - 1;
            foreach (LocationData data in locationArray.Reverse<LocationData>())
            {
                if (gameState.hammerState >= data.hammerState && Convert.ToInt32(gameState.rose) >= Convert.ToInt32(data.rose) && Convert.ToInt32(gameState.brooch) >= Convert.ToInt32(data.brooch) && Convert.ToInt32(gameState.fire) >= Convert.ToInt32(data.fire) && Convert.ToInt32(gameState.thunder) >= Convert.ToInt32(data.thunder) && gameState.fruitState >= data.fruitState && Convert.ToInt32(gameState.membership) >= Convert.ToInt32(data.membership) && Convert.ToInt32(gameState.winkle) >= Convert.ToInt32(data.winkle) && Convert.ToInt32(gameState.beanstar) >= Convert.ToInt32(data.beanstar) && Convert.ToInt32(gameState.dress) >= Convert.ToInt32(data.dress) && Convert.ToInt32(gameState.mini) >= Convert.ToInt32(data.mini) && Convert.ToInt32(gameState.under) >= Convert.ToInt32(data.under) && Convert.ToInt32(gameState.dash) >= Convert.ToInt32(data.dash) && Convert.ToInt32(gameState.crash) >= Convert.ToInt32(data.crash))
                {
                    validLocations.Add(data);
                    locationArray.RemoveAt(i);
                }
                i--;
            }
            
        }

        public void SpoilerFill()
        {
            SpoilerArrayInitialize(0, StreamInitialize(Environment.CurrentDirectory + "\\items\\SpoilerNames.txt"));
            SpoilerArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "\\items\\LocationNames.txt"));
            foreach (LocationData data in freshLocationArray.ToList())
            {
                int temp = 0;
                stream.Seek(data.location, SeekOrigin.Begin);
                if (data.itemType == 1)
                    temp = ItemConvert(stream.ReadByte(), stream.ReadByte());
                else
                    temp = stream.ReadByte();
                if (temp >= 0x30 && temp <= 0x93 || (temp == 0xA7 || temp == 0xAB || temp == 0xAD))
                {
                    spoilerArray.Add(new Spoiler(spoilerLocationArray.Find(x => x.location == data.location).name, spoilerItemArray.Find(x => x.item == temp).name, data.location.ToString("X")));
                }
            }
        }

        public void SpoilerGen()
        {
            List<string> fileString = new List<string>();
            foreach (Spoiler spoiler in spoilerArray.ToList())
            {
                fileString.Add(spoiler.itemName + " - " + spoiler.locationName + " - " + spoiler.locationHex);
            }
            File.WriteAllLines(Environment.CurrentDirectory + "\\spoilers\\" + hash + " Spoiler.txt", fileString);
        }

        public bool CheckValidity()
        {
            byte temp;
            if (Form1.Hands())
            {
                stream.Seek(0x1e9408, SeekOrigin.Begin);
                if (stream.ReadByte() == 0x39)
                    return false;


                stream.Seek(0x1e9409, SeekOrigin.Begin);
                if (stream.ReadByte() == 0x3A)
                    return false;
            }

            if (Form1.Hammers())
            {
                stream.Seek(0x39d731, SeekOrigin.Begin);
                if (stream.ReadByte() == 0x38)
                    return false;

                stream.Seek(0x1E9403, SeekOrigin.Begin);
                if (stream.ReadByte() == 0x38)
                    return false;

                stream.Seek(0x1E9404, SeekOrigin.Begin);
                if (stream.ReadByte() == 0x38)
                    return false;

                stream.Seek(0x1E9405, SeekOrigin.Begin);
                if (stream.ReadByte() == 0x38)
                    return false;
            }


            locationArray = new List<LocationData>(freshLocationArray);
            vBegin:
            if (validLocations.Count >= 1)
                Console.WriteLine(validLocations.Count);
            if (!Form1.Goblets())
            {
                if (gameState.hammerState >= 1 && gameState.brooch)
                {
                    gameState.mini = true;
                    gameState.under = true;
                }
            }
            UpdateList();
            int i = validLocations.Count - 1;
            if (validLocations.Count > 0)
            {
                foreach(LocationData data in validLocations.Reverse<LocationData>())
                {
                    stream.Seek(Convert.ToUInt32(data.location), SeekOrigin.Begin);
                    if(data.itemType != 1)
                        temp = (byte)stream.ReadByte();
                    else
                        temp = (byte)ItemConvert(stream.ReadByte(), stream.ReadByte());
                    if (temp == 0x34)
                    {
                        Console.WriteLine(data.location);
                    }
                    if (data.location > 0x3C0000 && temp == 0x38)
                        return false;
                    UpdateState(temp);
                    validLocations.RemoveAt(i);
                    i--;
                }
                goto vBegin;
            }
            else
            {
                //Console.WriteLine(gameState.fruitState);
               // Console.Write(gameState.hammerState + " " + gameState.brooch + " " + gameState.rose + " " + gameState.fire + " " + gameState.thunder + " " + gameState.beanstar + " " + gameState.dress);
                if (gameState.hammerState == 3 && gameState.fruitState == 3 && gameState.brooch && gameState.rose && gameState.fire && gameState.thunder && gameState.beanstar && gameState.dress && gameState.mini && gameState.under && gameState.dash && gameState.crash)
                    return true;
            }
            return false;
        }

        public void ValidArrayAdd(LocationData data)
        {
            validLocationArray.Add(data);
            itemArray.Add((byte)data.item);
        }

        public void CheckOptions()
        {
            ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "\\items\\KeyItems.txt"));
            foreach (LocationData data in optionsArray.ToList())
            {
                if ((byte)data.item == 0x31)
                {
                    if (Form1.Rose())
                        ValidArrayAdd(data);
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                }

                if (data.item == 0x32)
                {
                    if (Form1.Brooch())
                        ValidArrayAdd(data);
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                }

                if (data.item == 0x33 || data.item == 0x34)
                {
                    if (Form1.Goblets())
                        ValidArrayAdd(data);
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                        stream.Seek(0x1e9412, SeekOrigin.Begin);
                        stream.WriteByte(0x1);
                    }
                }

                if (data.item >= 0x35 && data.item <= 0x37)
                {
                    if (Form1.Chuckola())
                        ValidArrayAdd(data);
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                }

                if (data.item == 0x40)
                {
                    if (Form1.Membership())
                        ValidArrayAdd(data);
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                }

                if (data.item == 0x41)
                {
                    if (Form1.Winkle())
                        ValidArrayAdd(data);
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                }

                if (data.item == 0x43)
                {
                    if (Form1.Beanstar())
                        ValidArrayAdd(data);
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                }

                if (data.item == 0x42)
                {
                    if (Form1.Dress())
                        ValidArrayAdd(data);
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                }

                if (data.item == 0x45 || data.item == 0x46)
                {
                    if (Form1.Pearls())
                        ValidArrayAdd(data);
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                        stream.Seek(0x1e9413, SeekOrigin.Begin);
                        stream.WriteByte(0x1);
                    }
                }

                if (data.item >= 0x47 && data.item <= 0x55)
                {
                    if (Form1.Fruit())
                        ValidArrayAdd(data);
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                }

                if (data.item >= 0x56 && data.item <= 0x64)
                {
                    if (Form1.Eggs())
                        ValidArrayAdd(data);
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                }

                if (data.item >= 0x92 && data.item <= 0x93)
                {
                    if (Form1.Scrolls())
                        ValidArrayAdd(data);
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                }

                if (data.item >= 0x80 && data.item <= 0x91)
                {
                    if (Form1.Beanstone())
                        ValidArrayAdd(data);
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                }

                if (data.item >= 0x73 && data.item <= 0x77)
                {
                    if (Form1.Beanlet())
                        ValidArrayAdd(data);
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                }
                optionsArray.Remove(data);
            }
            ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "\\items\\BrosItems.txt"));
            foreach (LocationData data in optionsArray.ToList())
            {
                if (data.item == 0x38)
                {
                    if (Form1.Hammers())
                    {
                        ValidArrayAdd(data);
                    }
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                        stream.Seek(0x1e9410, SeekOrigin.Begin);
                        stream.WriteByte(0x1);
                    }
                }

                if (data.item == 0x39 || data.item == 0x3A)
                {
                    if (Form1.Hands())
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
                optionsArray.Remove(data);
            }
            ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "\\items\\Espresso.txt"));
            foreach (LocationData data in optionsArray.ToList())
            {
                if (Form1.Espresso())
                {
                    ValidArrayAdd(data);
                }
                else
                {
                    ItemInject(data.location, data.itemType, (byte)data.item);
                }
                optionsArray.Remove(data);
            }
            ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "\\items\\Shops.txt"));
            foreach (LocationData data in optionsArray.ToList())
            {
                if (Form1.Shops())
                {
                    ValidArrayAdd(data);
                }
                else
                {
                    ItemInject(data.location, data.itemType, (byte)data.item);
                }
                optionsArray.Remove(data);
            }
            ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "\\items\\Pants.txt"));
            foreach (LocationData data in optionsArray.ToList())
            {
                if (Form1.surf && data.item == 0xEB)
                {
                    ItemInject(data.location, data.itemType, 0xEB);
                    goto surfSkip;
                }

                if (Form1.Pants())
                {
                    ValidArrayAdd(data);
                }
                else
                {
                    ItemInject(data.location, data.itemType, (byte)data.item);
                }
                surfSkip:
                optionsArray.Remove(data);
            }

            ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "\\items\\Badges.txt"));
            foreach (LocationData data in optionsArray.ToList())
            {
                if (Form1.Mush() && (data.item == 0xAB || data.item == 0xAD || data.item == 0xA7))
                {
                    ItemInject(data.location, data.itemType, 0xA);
                    goto mushSkip;
                }

                if (Form1.Badges())
                {
                    ValidArrayAdd(data);
                }
                else
                {
                    ItemInject(data.location, data.itemType, (byte)data.item);
                }
                mushSkip:
                optionsArray.Remove(data);
            }

            ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "\\items\\AllAddresses.txt"));
            foreach (LocationData data in optionsArray.ToList())
            {
                if(data.item == 0x1E)
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
                    ValidArrayAdd(data);
                }
                optionsArray.Remove(data);
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

        public void EnemyRandomize()
        {
            if (!Form1.enemy)
                return;
            PopulateEnemyArray();
            GenerateGroups();
            GenerateBossGroups();
            InsertGroups();
            StatScale();
        }

        public void InsertGroups()
        {
            groups.Shuffle(random);
            groups.Shuffle(random);
            groups.Shuffle(random);
            groups.Shuffle(random);
            string[] location = StreamInitialize(Environment.CurrentDirectory + "\\items\\Enemies\\Encounters.txt");
            string[] boss = StreamInitialize(Environment.CurrentDirectory + "\\items\\Enemies\\BossEncounters.txt");
            location = location.Concat(boss).ToArray();
            Array.Sort(location);
            int count = 0;
            foreach(string str in location)
            {
                count++;
                EnemyGroup tempgroup = groups[0];
                groups.RemoveAt(0);
                stream.Seek(Convert.ToUInt32(str, 16) + 3, SeekOrigin.Begin);
                stream.WriteByte((byte)random.Next(0, 0x27));
                for(int i = 0; i < 6; i++)
                {
                    if (i < tempgroup.id.Count)
                    {
                        for (int j = 0; j < enemyCount.Count; j++)
                        {
                            if (tempgroup.id[i] == enemyCount[j].id)
                            {
                                StatCount temp = enemyCount[j];
                                temp.total += count;
                                enemyCount[j] = temp;
                                break;
                            }
                        }
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

        public void GenerateGroups()
        {
            enemies.Shuffle(random);
            enemies.Shuffle(random);
            enemies.Shuffle(random);
            enemies.Shuffle(random);
            foreach (int size in groupSizes)
            {
                List<byte> id = new List<byte>();
                List<byte> type = new List<byte>();
                int nut = 0;
                int special = 0;
                for (int i = 0; i < size; i++)
                {
                    if (enemies[0].id == 0x20 || enemies[0].id == 0x34)
                        nut++;
                    id.Add(enemies[0].id);
                    type.Add(enemies[0].type);
                    enemies.RemoveAt(0);
                }
                for(int i = 0; i < nut; i++)
                {
                    id.Add(0xF);
                    type.Add(0x3);
                }
                foreach(byte by in id)
                {
                    if (by == 4)
                    {
                        special = 1;
                        break;
                    }
                }
                groups.Add(new EnemyGroup(id, type, size, new byte[4] { 0xEE, 0x2C, 0x28, 0x8 }, special));
            }
        }

        public void StatScale()
        {
            string[] locations = StreamInitialize(Environment.CurrentDirectory + "\\items\\Enemies\\Stats.txt");
            for(int i = 0; i < enemyCount.Count; i++)
            {
                StatCount temp = enemyCount[i];
                temp.total /= temp.count;
                enemyCount[i] = temp;
            }

            foreach(StatCount sc in enemyCount)
            {
                for(int i = 0; i < locations.Length; i += 2)
                {
                    if(sc.id == Convert.ToInt32(locations[i + 1], 16))
                    {
                        float temp = sc.total / fightCeil;
                        stream.Seek(Convert.ToUInt32(locations[i], 16) + 6, SeekOrigin.Begin);
                        stream.WriteByte((byte)Math.Round(healthMax * temp));
                        stream.Seek(17, SeekOrigin.Current);
                        stream.WriteByte((byte)Math.Round(defenceMax * temp));
                        stream.Seek(1, SeekOrigin.Current);
                        stream.WriteByte((byte)Math.Round(speedMax * temp));
                        break;
                    }
                }
            }
        }

        public void GenerateBossGroups()
        {
            string[] groupStr = StreamInitialize(Environment.CurrentDirectory + "\\items\\Enemies\\BossEncounters.txt");

            foreach (string str in groupStr)
            {
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
                    if (type == 0x7)
                        break;
                    types.Add(type);
                    stream.Seek(-3, SeekOrigin.Current);
                    id.Add((byte)stream.ReadByte());
                    i++;
                    if (i == 6)
                        break;
                }
                stream.Seek(Convert.ToUInt32(str, 16) + 1, SeekOrigin.Begin);
                groups.Add(new EnemyGroup(id, types, stream.ReadByte(), data, boss));
            }
        }

        public void PopulateEnemyArray()
        {
            string[] tempString = StreamInitialize(Environment.CurrentDirectory + "\\items\\Enemies\\Encounters.txt");
            foreach(string str in tempString)
            {
                bool iterate = true;
                int i = 0;
                int count = 0;
                while(iterate)
                {
                    stream.Seek(Convert.ToUInt32(str, 16) + 10 + (i * 4), SeekOrigin.Begin);
                    byte type = (byte)stream.ReadByte();
                    int id = 0;
                    if(type == 0x7)
                        break;
                    stream.Seek(-3, SeekOrigin.Current);
                    id = stream.ReadByte();
                    if (enemyCount.Count == 0)
                        enemyCount.Add(new StatCount(id));
                    else
                    {
                        for(int j = 0; j < enemyCount.Count; j++)
                        {
                            if (id == enemyCount[j].id)
                            {
                                StatCount temp = enemyCount[j];
                                temp.count++;
                                enemyCount[j] = temp;
                                break;
                            }
                            else if(j == enemyCount.Count - 1)
                            {
                                enemyCount.Add(new StatCount(id));
                            }
                        }
                    }
                    if (id == 0xF && type == 0x3)
                        goto skipAdd;
                    enemies.Add(new Enemy((byte)id, type));
                    count++;
                    skipAdd:
                    i++;
                    if (i == 6)
                        break;
                }
                groupSizes.Add(count);
            }
        }

        public void RandomizeStats()
        {
            if(Form1.brosBp)
            {
                string[] str = StreamInitialize(Environment.CurrentDirectory + "\\items\\Stats\\BrosBP.txt");
                int i = 0;
                foreach(string location in str)
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

            if(Form1.itemHeal)
            {
                ItemValueInject(StreamInitialize(Environment.CurrentDirectory + "\\items\\Stats\\HealValues.txt"));
            }

            if (Form1.coffeeValue)
            {
                ItemValueInject(StreamInitialize(Environment.CurrentDirectory + "\\items\\Stats\\EspressoValues.txt"));
            }
        }

        public void ItemValueInject(string[] str)
        {
            for(int i = 0; i < str.Length; i += 4)
            {
                int value = random.Next(0, Convert.ToInt32(str[i + 1], 16));
                int length = Convert.ToInt32(str[i + 2], 16);
                byte[] arr = Encoding.ASCII.GetBytes(Convert.ToString(value));
                if (arr.Length < length)
                {
                    length -= arr.Length;
                    for(int j = 0; j < length; j++)
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
            for (int i = 0; i < data.Length; i += 17)
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
                                                       Convert.ToBoolean(Convert.ToInt32(data[i + 16], 16))));
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
                                                       Convert.ToBoolean(Convert.ToInt32(data[i + 16], 16))));
                }
            }
        }

        public string[] StreamInitialize(string path)
        {
            var str = new StreamReader(path).ReadToEnd();
            string[] lines = str.Split(new char[] { ',' });
            for (int i = 0; i < lines.Length; i++)
            {
                lines[i] = lines[i].Trim('\n', '\r');
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
            rBegin:
            itemArray.Shuffle(random);
            locationArray = new List<LocationData>(validLocationArray);
            locationArray.Shuffle(random);
            int beanCount = 0;
            for (int i = 0; i < itemArray.Count; i++)
            {
                if (itemArray[i] == 0x1E)
                    beanCount++;
                ItemInject(locationArray[i].location, locationArray[i].itemType, itemArray[i]);
            }
            Console.WriteLine(beanCount);
            gameState = new LocationData(0);
            if (!CheckValidity())
            {
                validLocations = new List<LocationData>();
                Console.WriteLine(++iterationCount);
                goto rBegin;
            }
            if (Form1.Intro())
            {
                stream.Seek(0x244F64, SeekOrigin.Begin);
                stream.WriteByte(0x0);
                stream.WriteByte(0x0);
                stream.WriteByte(0x0);
                stream.WriteByte(0x0);
            }
            if(Form1.castle)
            {
                stream.Seek(0x1E943F, SeekOrigin.Begin);
                stream.WriteByte(0x1);
            }
        }


        public int ItemConvert(int b1, int b2)
        {
            b1 -= 0x20;
            b1 *= 0x10;
            b2 /= 0x10;

            return b1 + b2;
        }


        public void ItemInject(uint location, int itemType, byte item)
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
                    stream.WriteByte(item);
                    break;


                default:
                    stream.Seek(location, SeekOrigin.Begin);
                    stream.WriteByte(Convert.ToByte(0x18));
                    break;
            }

        }

        public int AllNumbers(string seed)
        {
            int i;
            int.TryParse(seed, out i);
            return i;
        }

        public void Inject()
        {
            System.Diagnostics.Process process = new System.Diagnostics.Process();
            System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
            startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
            string domain = @Environment.CurrentDirectory + @"\\asm\\";
            startInfo.WorkingDirectory = domain;
            startInfo.FileName = "cmd.exe";
            startInfo.Arguments = "/C armips.exe Logic.asm";
            process.StartInfo = startInfo;
            process.Start();
            process.WaitForExit();
            File.Delete(Environment.CurrentDirectory + "\\asm\\mlss.gba");
        }

        public byte[] ASCIIToHex(string strValue)
        {
            return Encoding.UTF8.GetBytes(strValue);
        }
    }

}