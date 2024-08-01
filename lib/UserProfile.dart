import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'CartWork.dart';
import 'RegisterScreen.dart';
import 'ShopPage.dart';
import 'SliderScreen.dart';
import 'UpdateScreen.dart';
import 'loginScreen.dart';

class ProfileScreen extends StatefulWidget {
  final String userId;

  ProfileScreen({required this.userId});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 0;

  void pageShifter(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  final List<Widget> myscreens = [
    const SliderScreen(),
    const Product_Page(),
    CartPage(),
    RegisterScreen(),
  ];

  void _onBottomNavBarTapped(int index) {
    setState(() {
      currentIndex = index;
    });
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => myscreens[index]),
          (Route<dynamic> route) => false,
    );
  }


  Future<Map<String, dynamic>?> fetchUserData() async {
    try {
      DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(widget.userId).get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }

  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } catch (e) {
      print('Failed to logout: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Billing Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            SizedBox(
              width: 110,
              height: 100,
              child: Image.asset('images/logobaby.png'),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade800, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users").where('email', isEqualTo: widget.userId).snapshots(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              var dataLength = snapshot.data!.docs.length;
              return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: dataLength,
                itemBuilder: (context, index) {
                  var userDoc = snapshot.data!.docs[index];
                  String userID = userDoc['id'];
                  String userName = userDoc['name'];
                  String userAddress = userDoc['address'];
                  String userAge = userDoc['age'];
                  String userGender = userDoc['gender'];
                  String userContact = userDoc['contact'];
                  String userEmail = userDoc['email'];

                  return Center(
                    child: Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[

                            SizedBox(height: 10,),

                            // Profile Section
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-NBM75ZQZZnw1LjpWznA06oYugMc2aPgGvMm9F_3XoeANFiUtQ5OZ_tq7ykNQCPrHoAE&usqp=CAU'),
                                ),
                                const SizedBox(width: 4,),
                                SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Username:",style: TextStyle(
                                        fontSize: 20,

                                    ),),
                                    Text(
                                      userName,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.purple,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Divider(height: 40, thickness: 2, color: Colors.deepPurple.shade100),
                            ListTile(
                              leading: const Icon(Icons.email, color: Colors.deepPurple),
                              title: const Text('Email', style: TextStyle(color: Colors.deepPurple)),
                              subtitle: Text(userEmail, style: const TextStyle(color: Colors.black87)),
                            ),
                            ListTile(
                              leading: const Icon(Icons.phone, color: Colors.deepPurple),
                              title: const Text('Contact', style: TextStyle(color: Colors.deepPurple)),
                              subtitle: Text(userContact, style: const TextStyle(color: Colors.black87)),
                            ),
                            ListTile(
                              leading: const Icon(Icons.location_on, color: Colors.deepPurple),
                              title: const Text('Address', style: TextStyle(color: Colors.deepPurple)),
                              subtitle: Text(userAddress, style: const TextStyle(color: Colors.black87)),
                            ),
                            ListTile(
                              leading: const Icon(Icons.transgender, color: Colors.deepPurple),
                              title: const Text('Gender', style: TextStyle(color: Colors.deepPurple)),
                              subtitle: Text(userGender, style: const TextStyle(color: Colors.black87)),
                            ),
                            ListTile(
                              leading: const Icon(Icons.cake, color: Colors.deepPurple),
                              title: const Text('Age', style: TextStyle(color: Colors.deepPurple)),
                              subtitle: Text(userAge, style: const TextStyle(color: Colors.black87)),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateScreen(
                                      userId: userID,
                                      userName: userName,
                                      userAge: userAge,
                                      userGender: userGender,
                                      userContact: userContact,
                                      userAddress: userAddress,
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Update Information',style: TextStyle(color: Colors.white),),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.purple,
                                padding: const EdgeInsets.symmetric(vertical: 14.0),
                                textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: Colors.white),
                                minimumSize: const Size(200, 70),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
                              ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: _logout,
                              child: const Text('Logout',style: TextStyle(color: Colors.white),),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                                minimumSize: const Size(100, 50),
                                padding: const EdgeInsets.symmetric(vertical: 14.0),
                                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(child: Icon(Icons.error_outline, color: Colors.red, size: 40));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            const BoxShadow(
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
          onTap: _onBottomNavBarTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Home"),
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
