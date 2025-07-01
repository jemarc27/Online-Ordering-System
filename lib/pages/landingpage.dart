import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFFEFCA6C),
        elevation: 2,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('assets/images/logo.jpg', height: 50),
          ],
        ),
        actions: isMobile
            ? [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(FontAwesomeIcons.bars, color: Colors.black),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ]
            : null,
      ),
      endDrawer: Drawer(
        backgroundColor: const Color(0xFFEFCA6C),
        width: 200,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            const SizedBox(height: 85),
            _drawerItem(context, 'Home', '/landingpage', FontAwesomeIcons.house),
            _drawerItem(context, 'Order Now', '/OrderNow', FontAwesomeIcons.cartPlus),
            _drawerItem(context, 'Contact Us', '/contactus', FontAwesomeIcons.phone),
            _drawerItem(context, 'Notifications', '/notifications', FontAwesomeIcons.bell),
            _drawerItem(context, 'Account', '/profile', FontAwesomeIcons.user),
            ListTile(
              leading: const Icon(FontAwesomeIcons.arrowRightFromBracket, color: Colors.black),
              title: const Text('Logout', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              onTap: () {
                Navigator.pop(context);
                _showLogoutModal(context);
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(  // Make the entire body scrollable
          child: Column(
            children: [
              // Hero Section with food cards
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
                color: Color(0xFFF1F9F5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Satisfy your cravings',
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Feel the warmth.\nTaste the flavor.\nLomi at your doorstep.',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFD766),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Order Now',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 320,
                      child: PageView(
                        controller: PageController(viewportFraction: 0.75),
                        children: [
                          _buildPageCard(
                            'assets/images/maja.jpg',
                            'Maja Blanca is a creamy Filipino dessert made from coconut milk, cornstarch, and sweet corn.',
                          ),
                          _buildPageCard(
                            'assets/images/lomi.jpg',
                            'Lomi is a thick, savory noodle soup made with egg noodles, rich broth, and hearty toppings.',
                          ),
                          _buildPageCard(
                            'assets/images/chami.jpg',
                            'Chami Lomi is a thick noodle dish made with sautéed egg noodles, rich sauce, and savory toppings.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // "You Might Also Like" Section
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'You Might Also Like',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    // Horizontal list of food items
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FoodItem(image: 'assets/images/Dessert.png', title: 'Grahams'),
                          FoodItem(image: 'assets/images/Pancit_Canton_Bihon_Guisado.png', title: 'Bihon'),
                          FoodItem(image: 'assets/images/sweet_and_spicy.png', title: 'Sweet & Spicy'),
                          FoodItem(image: 'assets/images/Spaghetti.png', title: 'Spaghetti'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Footer Section
              Container(
                padding: EdgeInsets.only(left: 25, top: 18, right: 25, bottom: 14),
                color: Color(0xFF131615),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'CONTACT US',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          constraints: BoxConstraints(maxWidth: 150),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Purok 2,', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 13)),
                              SizedBox(height: 3),
                              Text('Puting Bato East', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 13)),
                              SizedBox(height: 3),
                              Text('Calaca City Batangas', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 13)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('PHONE NO.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
                                SizedBox(height: 1),
                                Text('09123456789', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 13)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 9),
                            Text('FOLLOW US', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                            SizedBox(height: 7),
                            Row(
                              children: [
                                IconButton(icon: Icon(FontAwesomeIcons.facebook, size: 30, color: Colors.white), onPressed: () {}),
                                SizedBox(width: 7),
                                IconButton(icon: Icon(FontAwesomeIcons.instagram, size: 30, color: Colors.white), onPressed: () {}),
                                SizedBox(width: 7),
                                IconButton(icon: Icon(FontAwesomeIcons.twitter, size: 30, color: Colors.white), onPressed: () {}),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to create PageView cards
  Widget _buildPageCard(String image, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 120),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Georgia',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String title, String route, IconData icon) {
    return ListTile(
      leading: FaIcon(icon, color: Colors.black, size: 23),
      title: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }

  void _showLogoutModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Logout'),
            onPressed: () {
              // Handle logout logic
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

// FoodItem Widget
class FoodItem extends StatelessWidget {
  final String image;
  final String title;

  const FoodItem({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Image.asset(image, width: 130, height: 130, fit: BoxFit.cover),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text('Order Now'),
          ),
        ],
      ),
    );
  }
}

