import 'package:babyhubproject/slider.dart';
import 'package:flutter/material.dart';
import 'CartWork.dart';
import 'RegisterScreen.dart';
import 'ShopPage.dart';


class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  int currentIndex = 0;

  void pageShifter(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> myscreens = [
    SliderScreen(),
    Product_Page(),
    CartPage(),
    RegisterScreen()

  ];

  void _onBottomNavBarTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => myscreens[index]),
    );
  }
  @override
  Widget build(BuildContext context) {
    final mqw = MediaQuery.of(context).size.width;
    final mqh = MediaQuery.of(context).size.height;

    // List of items
    final List<Item> items = [
      Item(
        imageUrl: "https://m.media-amazon.com/images/I/71gKEAsi9vL._AC_SL1500_.jpg",
        title: "Kids T-shirt & Short Set",
        price: "Rs.795",
      ),
      Item(
        imageUrl: "https://mamalove.pk/cdn/shop/files/954792_cf01d5bf13a54a6094769847a0545fa4_mv2_900x_c19f0dd7-d4c4-4c1d-a394-a4d710a2dc69.webp?v=1714722446",
        title: "Kids Towel Set",
        price: "Rs.999",
      ),
      Item(
        imageUrl: "images/babyelephant.png",
        title: "Baby Elephant Toy",
        price: "Rs.499",
      ),
      Item(
        imageUrl: "images/boots.png",
        title: "Baby White Boots",
        price: "Rs.1499",
      ),
      Item(
        imageUrl: "images/teddy.png",
        title: "Cute Teddy Bear",
        price: "Rs.1999",
      ),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 110,
                  height: 100,
                  child: Image(image: AssetImage("images/logobaby.png")),
                ),
              ],
            ),
          ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),
      drawer: DrawerScreen(
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            slider(),
            SizedBox(height: 20,),
            Container(
              height: mqh * 0.49,
              width: mqw * 0.96,
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  Text("Baby Products Online Shopping",style: TextStyle(color: Colors.purple,fontSize: 30),),
                  SizedBox(height: 10,),
                  Text("Before online shopping, it was a tedious and difficult job for parents to shop for their kids. With BabyShopHub, now you can get the best products available in the market from top brands at affordable prices. Apart from that, our seasonal promotions, sales, and discount offers will make your online shopping experience even better. Choose from our extensive range of baby products and pay cash on delivery. If in case you do not like our product(s), you can avail a full refund or replacement.All you have to do is to visit our online store.",style: TextStyle(fontSize: 19,color: Colors.grey),)
                ],
              ),
            ),
            SizedBox(height: 50,),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: mqw * 0.02, vertical: mqh * 0.01),
                  height: mqh * 0.4,
                  width: mqw * 0.457,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://babyplanet.pk/cdn/shop/files/09-hb150724.png?v=1721049869&width=400"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: mqw * 0.02, vertical: mqh * 0.01),
                  height: mqh * 0.4,
                  width: mqw * 0.457,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/1.png"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: mqw * 0.02, vertical: mqh * 0.01),
                  height: mqh * 0.4,
                  width: mqw * 0.457,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://babyplanet.pk/cdn/shop/files/10-hpn010624.jpg?v=1717246007&width=400"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: mqw * 0.02, vertical: mqh * 0.01),
                  height: mqh * 0.4,
                  width: mqw * 0.457,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://babyplanet.pk/cdn/shop/files/11-hpn010624.jpg?v=1717246009&width=400"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Best Sellers",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.purple,
                            fontFamily: AutofillHints.creditCardExpirationYear,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 300,
              child: ListView.builder(
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return StackItem(
                    imageUrl: item.imageUrl,
                    title: item.title,
                    price: item.price,
                  );
                },
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                minimumSize: Size(50, 50),
                side: BorderSide(color: Colors.purple, width: 2), // Border color and width
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "View all",
                    style: TextStyle(color: Colors.purple, fontSize: 25),
                  ),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.purple,
                    size: 30,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,width: 10,),
            Column(
            children: [
            Image(image: NetworkImage("https://babyplanet.pk/cdn/shop/files/36-mds030524.png?v=1714813249&width=400")),
            ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: mqh * 0.01),
              // height: mqh * 0.18,
              // width: mqw * 0.452,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width:  mqh * 0.2,
                    height: mqh * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage("https://babyplanet.pk/cdn/shop/files/35-mds030524.png?v=1714813250&width=400"))
                    ),
                  ),
                  Container(
                    width:  mqh * 0.2,
                    height: mqh * 0.2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("https://babyplanet.pk/cdn/shop/files/16-wcs250124.png?v=1706184026&width=400"))
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: mqh * 0.49,
              width: mqw * 0.94,
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  Text("Online Baby Store",style: TextStyle(color: Colors.purple,fontSize: 30),),
                  SizedBox(height: 10,),
                  Text("BabyShopyHub is the first online store of Pakistan. We offer a wide range of baby and kids (up to 12 years of age) products at market effective prices. Doesn’t matter if you are looking to buy diapers for your baby from popular brands like Pampers, Canbebe or want to buy baby skin care products you can find them at BabyShopHub. Before online shopping, it was a tedious and difficult job for parents to shop for their kids. With Baby Planet, now you can get the best products available in the market from top brands at affordable prices.",style: TextStyle(fontSize: 18,color: Colors.grey),)
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: mqh * 0.4,
              width: mqw * 0.9,
              child: Column(
                children: [
                  Image(image: NetworkImage("https://babyplanet.pk/cdn/shop/files/35-hp240223.jpg?v=1685713057&width=700")),
                  SizedBox(height: 10,),
                  Image(image: NetworkImage("https://babyplanet.pk/cdn/shop/files/36-hp240223.jpg?v=1685713056&width=700"))
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              height: 600,
              width: 500,
              color: Colors.purple,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text("Address",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("Gulshan-e-Hadeed,Karachi",style: TextStyle(fontSize: 16,color: Colors.white),),
                  SizedBox(height: 40,),
                  Text("Call Us",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text("03325688799",style: TextStyle(fontSize: 16,color: Colors.white),),
                  SizedBox(height: 40,),
                  Text("Whatsapp",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text("03325688799",style: TextStyle(fontSize: 16,color: Colors.white),),
                  SizedBox(height: 40,),
                  Text("Email",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text("info@babyhub.com",style: TextStyle(fontSize: 16,color: Colors.white),),
                  SizedBox(height: 40,),
                  Text("Working Hours",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text("10:00 to 07:00",style: TextStyle(fontSize: 16,color: Colors.white),),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(70),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image: AssetImage("images/instagram.png")
                          )
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(70),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjvzC_QRv6moAhgNb5C6e3yicKgFND1g2RwA&s'))
                        ),
                      ),
                      SizedBox(width: 10,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 2),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(70),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                              image: AssetImage("images/Linkedin_logo.png")
                            )
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          iconSize: 18,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.purple,
          showUnselectedLabels: true,
          currentIndex: currentIndex,
          onTap: pageShifter,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Home",),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Product"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          ],
        ),
      ),
    );
  }
}

class StackItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  const StackItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 190,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 4,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.purple,
                  ),
                  onPressed: () {},
                ),
              ),
              Positioned(
                bottom: 8,
                right: 10,
                child: Container(
                  height: 100,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              price,
                              style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 5),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Quick Shop",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Item {
  final String imageUrl;
  final String title;
  final String price;

  Item({
    required this.imageUrl,
    required this.title,
    required this.price,
  });
}

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  List<bool> _isExpanded = List<bool>.filled(5, false);

  @override
  Widget build(BuildContext context) {
    // Define your subitem titles here
    List<List<String>> subItemTitles = [
      ["Sippers & Cups", "Dishes & Utensils", "Teethers & Pacifiers", "Kids Food & Supplement"],
      ["Lotion Oils & Powders", "Creams", "Bath Tubs & Bathers", "Towels", "Bathing Accessories"],
      ["Wipes", "Rash Creams", "Potty Seats", "Diapers"],
      ["Musical Toys", "Bath Toys", "Playmats", "Soft Toys", "Rattles"],
      ["Swaddles", "Sleep Wear", "Caps & Hats", "Body Suits & Wrampers", "Blankets"],
    ];

    return Drawer(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "MENU",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context); // Close the drawer
                  },
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            ListTile(
              title: Row(
                children: [
                  Icon(Icons.home_outlined),
                  SizedBox(width: 12.0),
                  Text(
                    "HOME",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Row(
                          children: [
                            Icon(getCategoryIcon(index + 1)),
                            SizedBox(width: 12.0),
                            Text(
                              getCategoryTitle(index + 1),
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: Icon(_isExpanded[index] ? Icons.remove : Icons.add),
                          onPressed: () {
                            setState(() {
                              _isExpanded[index] = !_isExpanded[index];
                            });
                          },
                        ),
                      ),
                      if (_isExpanded[index])
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _buildSubItems(index, subItemTitles[index]),
                          ),
                        ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData getCategoryIcon(int index) {
    switch (index) {
      case 0:
        return Icons.home_outlined;
      case 1:
        return Icons.local_cafe_outlined;
      case 2:
        return Icons.bathtub_outlined;
      case 3:
        return Icons.baby_changing_station;
      case 4:
        return Icons.toys_outlined;
      default:
        return Icons.category;
    }
  }

  String getCategoryTitle(int index) {
    switch (index) {
      case 0:
        return "HOME";
      case 1:
        return "FEEDING";
      case 2:
        return "BATH";
      case 3:
        return "DIAPERING";
      case 4:
        return "TOYS";
      default:
        return "CATEGORY";
    }
  }

  List<Widget> _buildSubItems(int index, List<String> subItemTitles) {
    return List.generate(subItemTitles.length, (subIndex) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Row(
              children: [
                SizedBox(width: 12.0),
                SizedBox(
                  width: 120,
                  child: Text(
                    subItemTitles[subIndex],
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Text(subItemTitles[subIndex]),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      );
    });
  }
}