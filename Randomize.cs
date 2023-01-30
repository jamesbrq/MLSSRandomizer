using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Security.Cryptography;
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
                rom.EnemyRandomize();
                rom.RandomizeStats();
                rom.MusicRandomize();
                rom.ColorSwap(Rom.GenColor(Form1.mColor), 0, "");
                rom.ColorSwap(Rom.GenColor(Form1.lColor), 1, "");
                rom.ColorSwap(Rom.GenColor(Form1.mPants), 0, "pants/");
                rom.ColorSwap(Rom.GenColor(Form1.lPants), 1, "pants/");
                rom.stream.Close();
                rom.Inject();
                return (Environment.CurrentDirectory + "/asm/mlss_loop.gba", rom.hash);
            }
            if (gameId == 3)
            {
                rom = new Rom(path, seed, gameId);
                rom.Randomize();
                rom.stream.Close();
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
        List<dynamic> optionsArray = new List<dynamic>();
        List<dynamic> locationArray = new List<dynamic>();
        List<dynamic> validLocations = new List<dynamic>();
        List<Spoiler> spoilerArray = new List<Spoiler>();
        List<SpoilerItem> spoilerItemArray = new List<SpoilerItem>();
        List<SpoilerLocation> spoilerLocationArray = new List<SpoilerLocation>();
        List<dynamic> itemArray = new List<dynamic>();
        public LocationData gameState = new LocationData(0);
        public int iterationCount = 0;
        public List<Enemy> enemies = new List<Enemy>();
        public List<int> groupSizes = new List<int>();
        public List<EnemyGroup> groups = new List<EnemyGroup>();
        public List<StatCount> enemyCount = new List<StatCount>();


        public Rom(string path, string seed, int id)
        {
            gameId = id;
            if (gameId == 1)
            {
                if (!File.Exists(Environment.CurrentDirectory + "/asm/mlss.gba"))
                    File.Copy(path, Environment.CurrentDirectory + "/asm/mlss.gba");
                stream = new FileStream(Environment.CurrentDirectory + "/asm/mlss.gba", FileMode.Open);
                FreshArrayPopulate();
                SeedInitialize(seed);
                CheckOptions();
            }
            if(gameId == 3)
            {
                if (!File.Exists(Environment.CurrentDirectory + "/bis/bis.nds"))
                    File.Copy(path, Environment.CurrentDirectory + "/bis/bis.nds");
                stream = new FileStream(Environment.CurrentDirectory + "/bis/bis.nds", FileMode.Open);
                FreshArrayPopulate();
                SeedInitialize(seed);
                CheckOptions();
            }
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
            public LocationData(uint location, uint item, int itemType, int hammerState, bool rose, bool brooch, bool fire, bool thunder, int fruitState, bool membership, bool winkle, bool beanstar, bool dress, bool mini, bool under, bool dash, bool crash, int neon, int beanfruit, bool spangle)
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
            public bisitem(byte byte1, byte byte2, byte quantity)
            {
                this.byte1 = byte1;
                this.byte2 = byte2;
                this.quantity = quantity;
            }

            public byte byte1;
            public byte byte2;
            public byte quantity;
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
            }

            if(gameId == 3)
            {
                ArrayInitialize(0, StreamInitialize(Environment.CurrentDirectory + "/bis/items/AllAddresses.txt"));
            }
        }

        public void UpdateList()
        {
            if (gameId == 1)
            {
                int i = locationArray.Count - 1;
                foreach (LocationData data in locationArray.Reverse<dynamic>())
                {
                    if (gameState.hammerState >= data.hammerState && Convert.ToInt32(gameState.rose) >= Convert.ToInt32(data.rose) && Convert.ToInt32(gameState.brooch) >= Convert.ToInt32(data.brooch) && Convert.ToInt32(gameState.fire) >= Convert.ToInt32(data.fire) && Convert.ToInt32(gameState.thunder) >= Convert.ToInt32(data.thunder) && gameState.fruitState >= data.fruitState && Convert.ToInt32(gameState.membership) >= Convert.ToInt32(data.membership) && Convert.ToInt32(gameState.winkle) >= Convert.ToInt32(data.winkle) && Convert.ToInt32(gameState.beanstar) >= Convert.ToInt32(data.beanstar) && Convert.ToInt32(gameState.dress) >= Convert.ToInt32(data.dress) && Convert.ToInt32(gameState.mini) >= Convert.ToInt32(data.mini) && Convert.ToInt32(gameState.under) >= Convert.ToInt32(data.under) && Convert.ToInt32(gameState.dash) >= Convert.ToInt32(data.dash) && Convert.ToInt32(gameState.crash) >= Convert.ToInt32(data.crash) && gameState.neon >= data.neon && gameState.currentBeanfruit >= data.totalBeanfruit && Convert.ToInt32(gameState.spangle) >= Convert.ToInt32(data.spangle))
                    {
                        if (data.totalBeanfruit >= 1)
                            gameState.currentBeanfruit -= 1;
                        validLocations.Add(data);
                        locationArray.RemoveAt(i);
                    }
                    i--;
                }
            }

            if(gameId == 3)
            {
                int i = locationArray.Count - 1;
                foreach (LocationData data in locationArray.Reverse<dynamic>())
                {
                    validLocations.Add(data);
                    locationArray.RemoveAt(i);
                    i--;
                }
            }
        }

        public void SpoilerFill()
        {
            SpoilerArrayInitialize(0, StreamInitialize(Environment.CurrentDirectory + "/items/SpoilerNames.txt"));
            SpoilerArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/LocationNames.txt"));
            foreach (LocationData data in freshLocationArray.ToList())
            {
                int temp = 0;
                stream.Seek(data.location, SeekOrigin.Begin);
                if (data.itemType == 1)
                    temp = ItemConvert(stream.ReadByte(), stream.ReadByte());
                else
                    temp = stream.ReadByte();
                if (temp >= 0x30 && temp <= 0x93 || (temp == 0xA7 || temp == 0xAB || temp == 0xAD) || (temp >= 0xF8 && temp <= 0xFE))
                {
                    spoilerArray.Add(new Spoiler(spoilerLocationArray.Find(x => x.location == data.location).name, spoilerItemArray.Find(x => x.item == temp).name, data.location.ToString("X")));
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
                list.Add("Chuckle: " + Form1.chuckle);
                list.Add("Rose: " + Form1.rose);
                list.Add("Brooch: " + Form1.brooch);
                list.Add("Chuckola Fruit: " + Form1.chuckola);
                list.Add("Membership Card: " + Form1.membership);
                list.Add("Winkle Card: " + Form1.winkle);
                list.Add("Extra Dress: " + Form1.dress);
                list.Add("Fake Beanstar: " + Form1.beanstar);
                list.Add("Secret Scrolls: " + Form1.scrolls);
                list.Add("Beanfruit: " + Form1.fruit);
                list.Add("Neon Eggs: " + Form1.eggs);
                list.Add("Beanstones: " + Form1.beanstone);
                list.Add("Beanlets: " + Form1.beanlet);
                list.Add("Hammers: " + Form1.hammers);
                list.Add("Hammer Moves: " + Form1.goblets);
                list.Add("Hands: " + Form1.hands);
                list.Add("Hand Moves: " + Form1.pearls);
                list.Add("Item Shops: " + Form1.shops);
                list.Add("Badges: " + Form1.badges);
                list.Add("Pants: " + Form1.pants);
                list.Add("Espresso: " + Form1.espresso);
                list.Add("BP Costs: " + Form1.brosBp);
                list.Add("Item Heal: " + Form1.itemHeal);
                list.Add("Espresso Stats: " + Form1.coffeeValue);
                list.Add("Music: " + Form1.music);
                list.Add("Enemies: " + Form1.enemy);
                list.Add("Enemy Stats: " + Form1.scale);
                list.Add("Battle Backgrounds: " + Form1.background);
                list.Add("Disable Mush: " + Form1.mush);
                list.Add("Disable Surf: " + Form1.surf);
                list.Add("Skip Minecart: " + Form1.minecart);
                list.Add("Skip Bowsers: " + Form1.castle);
                list.Add("Skip intro: " + Form1.intro);
                list.Add("Mario Color: " + Form1.mColor);
                list.Add("Luigi Color: " + Form1.lColor);
                list.Add(" ");
            }
        }

        public bool CheckValidity()
        {
            if (gameId == 1)
            {
                byte temp;
                locationArray = new List<dynamic>(freshLocationArray);
                vBegin:
                if (validLocations.Count >= 1)
                    Console.WriteLine(validLocations.Count);
                if (!Form1.goblets)
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
                    foreach (LocationData data in validLocations.Reverse<dynamic>())
                    {
                        stream.Seek(Convert.ToUInt32(data.location), SeekOrigin.Begin);
                        if (data.itemType != 1)
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
                    if (locationArray.Count < 100)
                        Console.WriteLine("a");
                    if (Form1.seedType == 1 && gameState.hammerState == 3 && gameState.rose && gameState.fire && gameState.thunder && gameState.beanstar && gameState.dress && gameState.mini && gameState.under && gameState.dash && gameState.crash)
                        return true;
                    if (Form1.seedType == 2 && gameState.hammerState == 3 && gameState.rose && gameState.brooch && gameState.fire && gameState.thunder && gameState.fruitState == 3 && gameState.membership && gameState.winkle && gameState.beanstar && gameState.dress && gameState.mini && gameState.under && gameState.dash && gameState.crash && gameState.neon == 7 && gameState.totalBeanfruit == 7 && gameState.winkle)
                        return true;
                }
            }

            if(gameId == 3)
            {
                return true;
            }
            return false;
        }

        public void ValidArrayAdd(dynamic data)
        {
            if (gameId == 1)
            {
                validLocationArray.Add(data);
                itemArray.Add((byte)data.item);
            }

            if (gameId == 3)
            {
                validLocationArray.Add(data);
                itemArray.Add(data.item);
            }
        }

        public void CheckOptions()
        {
            if (gameId == 1)
            {
                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/KeyItems.txt"));
                foreach (LocationData data in optionsArray.ToList())
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
                            stream.Seek(0x1e9412, SeekOrigin.Begin);
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
                            stream.Seek(0x1e9413, SeekOrigin.Begin);
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

                    optionsArray.Remove(data);
                }
                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/BrosItems.txt"));
                foreach (LocationData data in optionsArray.ToList())
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
                    optionsArray.Remove(data);
                }
                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/Espresso.txt"));
                foreach (LocationData data in optionsArray.ToList())
                {
                    if (Form1.espresso)
                    {
                        ValidArrayAdd(data);
                    }
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                    optionsArray.Remove(data);
                }
                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/Shops.txt"));
                foreach (LocationData data in optionsArray.ToList())
                {
                    if (Form1.shops)
                    {
                        ValidArrayAdd(data);
                    }
                    else
                    {
                        ItemInject(data.location, data.itemType, (byte)data.item);
                    }
                    optionsArray.Remove(data);
                }
                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/Pants.txt"));
                foreach (LocationData data in optionsArray.ToList())
                {
                    if (Form1.surf && data.item == 0xEB)
                    {
                        ItemInject(data.location, data.itemType, 0xEB);
                        goto surfSkip;
                    }

                    if (Form1.pants)
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

                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/Badges.txt"));
                foreach (LocationData data in optionsArray.ToList())
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
                    mushSkip:
                    optionsArray.Remove(data);
                }

                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/items/AllAddresses.txt"));
                foreach (LocationData data in optionsArray.ToList())
                {
                    if (data.location == 0x39DB0F)
                    {
                        if (Form1.minecart)
                        {
                            ItemInject(data.location, data.itemType, (byte)data.item);
                        }
                        else
                        {
                            ValidArrayAdd(data);
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
                        ValidArrayAdd(data);
                    }
                    optionsArray.Remove(data);
                }
            }
            if(gameId == 3)
            {
                ArrayInitialize(1, StreamInitialize(Environment.CurrentDirectory + "/bis/items/AllAddresses.txt"));
                foreach(BiSLocationData data in optionsArray)
                {
                    ValidArrayAdd(data);
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
            if (pants != "" && color == "Vanilla")
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
                tempcolor = GenColor(color);
                temp = StreamInitialize(Environment.CurrentDirectory + "/colors/" + pants + tempcolor + ".txt");
            }
            List<Color> colors = new List<Color>();
            if (tempcolor == "Chaos" || tempcolor == "TrueChaos")
            {
                for (int i = 0; i < temp.Length; i += 2)
                {
                    colors.Add(new Color(Convert.ToUInt32(temp[i], 16), (byte)random.Next(0x0, 0x7F), (byte)random.Next(0x0, 0xFF), Convert.ToInt32(temp[i + 1], 16)));
                }
            }
            else if(tempcolor == "Custom")
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

        public static string GenColor(string color)
        {
            string[] colors = new string[] { "Red", "Green", "Purple", "Yellow", "Black", "Pink", "Cyan", "Blue", "Orange", "White", "Chaos" };
            string temp = color;
            switch (temp)
            {

                case "Random":
                    temp = colors[random.Next(0, colors.Length - 1)];
                    return temp;

                case "Chaos":
                    if (Form1.trueChaos)
                        return "TrueChaos";
                    return temp;

                default:
                    return temp;
            }
        }


        public void MusicRandomize()
        {
            if (!Form1.music)
                return;

            List<int> changed = new List<int>();
            for (int i = 0; i < 0x32; i++)
            {
                int j = 0;
                stream.Seek(0x3a78E8, SeekOrigin.Begin);
                bool iterate = true;
                retry:
                byte rand = (byte)random.Next(0x0, 0x32);
                if (rand == 0x1A || rand == i)
                    goto retry;
                while (iterate)
                {
                    int temp = stream.ReadByte();
                    if (temp == i)
                        stream.Seek(-1, SeekOrigin.Current);
                    else
                        goto skip;
                    foreach (int k in changed)
                    {
                        if (k == j)
                            goto skip;
                    }
                    stream.WriteByte(rand);
                    changed.Add(j);
                    skip:
                    if (stream.Position >= 0x3AA8D0)
                        iterate = false;
                    stream.Seek(0x17, SeekOrigin.Current);
                    j++;
                }
            }
        }

        public void EnemyRandomize()
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

            if (!Form1.enemy)
                return;
            //Write byte for stat scale execution
            if (Form1.scale)
            {
                stream.Seek(0x1E9418, SeekOrigin.Begin);
                stream.WriteByte(0x1);
            }
            PopulateEnemyArray();
            GenerateGroups();
            GenerateBossGroups();
            InsertGroups();
        }

        public void InsertGroups()
        {
            groups.Shuffle(random);
            string[] location = StreamInitialize(Environment.CurrentDirectory + "/items/Enemies/Encounters.txt");
            string[] boss = StreamInitialize(Environment.CurrentDirectory + "/items/Enemies/BossEncounters.txt");
            location = location.Concat(boss).ToArray();
            Array.Sort(location);
            int count = 0;
            foreach (string str in location)
            {
                count++;
                EnemyGroup tempgroup = groups[0];
                groups.RemoveAt(0);
                stream.Seek(Convert.ToUInt32(str, 16), SeekOrigin.Begin);
                stream.WriteByte(tempgroup.groupType);
                for (int i = 0; i < 6; i++)
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
            foreach (int size in groupSizes)
            {
                int tempsize;
                if (size > 4)
                    tempsize = 4;
                else
                    tempsize = size;
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
                groups.Add(new EnemyGroup(id, type, size, script, special));
            }
        }

        public void GenerateBossGroups()
        {
            string[] groupStr = StreamInitialize(Environment.CurrentDirectory + "/items/Enemies/BossEncounters.txt");

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
                    types.Add(type);
                    stream.Seek(-3, SeekOrigin.Current);
                    id.Add((byte)stream.ReadByte());
                    i++;
                    if (i == 6)
                        break;
                }
                stream.Seek(Convert.ToUInt32(str, 16) + 1, SeekOrigin.Begin);
                groups.Add(new EnemyGroup(0xE4, id, types, stream.ReadByte(), data, boss));
            }
        }

        public void PopulateEnemyArray()
        {
            string[] tempString = StreamInitialize(Environment.CurrentDirectory + "/items/Enemies/Encounters.txt");
            foreach (string str in tempString)
            {
                bool iterate = true;
                int i = 0;
                int count = 0;
                while (iterate)
                {
                    stream.Seek(Convert.ToUInt32(str, 16) + 10 + (i * 4), SeekOrigin.Begin);
                    byte type = (byte)stream.ReadByte();
                    if (type == 0x0)
                        type = 0x4;
                    int id = 0;
                    if (type == 0x7)
                        break;
                    stream.Seek(-3, SeekOrigin.Current);
                    id = stream.ReadByte();
                    if (id == 0x18 || id == 0x53 || id == 0x4B)
                        type = 0x4;
                    if (enemyCount.Count == 0)
                        enemyCount.Add(new StatCount(id));
                    else
                    {
                        for (int j = 0; j < enemyCount.Count; j++)
                        {
                            if (id == enemyCount[j].id)
                            {
                                StatCount temp = enemyCount[j];
                                temp.count++;
                                enemyCount[j] = temp;
                                break;
                            }
                            else if (j == enemyCount.Count - 1)
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
                if (count > 4)
                    count = 4;
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
                int value = random.Next(0, Convert.ToInt32(str[i + 1], 16));
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
                for (int i = 0; i < data.Length; i += 20)
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
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 19], 16))));
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
                                                           Convert.ToBoolean(Convert.ToInt32(data[i + 19], 16))));
                    }
                }
            }

            if(gameId == 3)
            {
                for(int i = 0; i < data.Length; i += 4)
                {
                    if(array == 2)
                        freshLocationArray.Add(new BiSLocationData(Convert.ToUInt32(data[i], 16), new bisitem((byte)Convert.ToUInt32(data[i + 1], 16), (byte)Convert.ToUInt32(data[i + 2], 16), (byte)Convert.ToUInt32(data[i + 3], 16))));
                    if(array == 1)
                        optionsArray.Add(new BiSLocationData(Convert.ToUInt32(data[i], 16), new bisitem((byte)Convert.ToUInt32(data[i + 1], 16), (byte)Convert.ToUInt32(data[i + 2], 16), (byte)Convert.ToUInt32(data[i + 3], 16))));
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
            if (gameId == 1)
            {
                rBegin:
                itemArray.Shuffle(random);
                locationArray = new List<dynamic>(validLocationArray);
                locationArray.Shuffle(random);
                for (int i = 0; i < itemArray.Count; i++)
                {
                    reInsert:
                    if (CheckValidSpot(locationArray[i], itemArray[i]))
                    {
                        itemArray.Shuffle(random);
                        goto reInsert;
                    }
                    ItemInject(locationArray[i].location, locationArray[i].itemType, itemArray[i]);
                }
                gameState = new LocationData(0);
                if (!CheckValidity())
                {
                    validLocations = new List<dynamic>();
                    Console.WriteLine(++iterationCount);
                    goto rBegin;
                }
                if (Form1.intro)
                {
                    stream.Seek(0x244F64, SeekOrigin.Begin);
                    stream.WriteByte(0x0);
                    stream.WriteByte(0x0);
                    stream.WriteByte(0x0);
                    stream.WriteByte(0x0);
                }
                if (Form1.castle)
                {
                    stream.Seek(0x3AEAB0, SeekOrigin.Begin);
                    stream.Write(new byte[] { 0xC1, 0x67, 0x0, 0x6, 0x1C, 0x08, 0x3 }, 0, 7);
                    stream.Seek(0x3AEC18, SeekOrigin.Begin);
                    stream.Write(new byte[] { 0x89, 0x65, 0x0, 0xE, 0xA, 0x08, 0x1 }, 0, 7);

                }
                if (Form1.minecart)
                {
                    stream.Seek(0x3AC728, SeekOrigin.Begin);
                    stream.Write(new byte[] { 0x89, 0x13, 0x0, 0x10, 0xF, 0x08, 0x1 }, 0, 7);
                    stream.Seek(0x3AC56C, SeekOrigin.Begin);
                    stream.Write(new byte[] { 0x49, 0x16, 0x0, 0x8, 0x8, 0x08, 0x1 }, 0, 7);
                }
                if(Form1.minigame)
                {
                    stream.Seek(0x1E940F, SeekOrigin.Begin);
                    stream.WriteByte(0x1);
                }
            }

            if(gameId == 3)
            {
                rBegin:
                itemArray.Shuffle(random);
                locationArray = new List<dynamic>(validLocationArray);
                locationArray.Shuffle(random);
                for (int i = 0; i < itemArray.Count; i++)
                {
                    ItemInject(locationArray[i].location, 0, itemArray[i]);
                }
                gameState = new LocationData(0);
                if (!CheckValidity())
                {
                    validLocations = new List<dynamic>();
                    Console.WriteLine(++iterationCount);
                    goto rBegin;
                }
            }
        }

        public bool CheckValidSpot(LocationData data, byte item)
        {
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


        public void ItemInject(uint location, int itemType, dynamic item)
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

            if(gameId == 3)
            {
                stream.Seek(location, SeekOrigin.Begin);
                stream.Write(new byte[] { item.quantity, item.byte1, item.byte2 }, 0, 3);
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
            string r = indiv[0];
            string g = indiv[1];
            string b = indiv[2];
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