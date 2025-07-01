import 'package:flutter/material.dart';

class Ordernow extends StatefulWidget {
  const Ordernow({super.key});

  @override
  State<Ordernow> createState() => _OrdernowState();
}

class _OrdernowState extends State<Ordernow> {
  String selectedCategory = 'Bilao';
  final Map<String, int> quantities = {
    'Pancit Bilao': 0,
    'Spaghetti Bilao': 0,
    'Palabok Bilao': 0,
    'Chami Bilao': 0,
  };

  final List<Map<String, String>> bilao = [
    {
      'name': 'Pancit Bilao',
      'price': '₱250.00',
      'image': 'lib/assets/images/pancit_bilao.jpg',
      'description': 'A classic Filipino noodle dish with vegetables and meat.'
    },
    {
      'name': 'Spaghetti Bilao',
      'price': '₱280.00',
      'image': 'lib/assets/images/spaghetti_bilao.jpg',
      'description': 'Filipino-style sweet spaghetti, served in a bilao.'
    },
    {
      'name': 'Palabok Bilao',
      'price': '₱300.00',
      'image': 'lib/assets/images/palabok_bilao.jpg',
      'description': 'A flavorful rice noodle dish with shrimp and pork toppings.'
    },
    {
      'name': 'Chami Bilao',
      'price': '₱270.00',
      'image': 'lib/assets/images/chami_bilao.jpg',
      'description': 'A delicious stir-fried noodle dish with a savory sauce.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      // AppBar removed here

      endDrawer: Drawer(
        backgroundColor: const Color(0xFFEFCA6C),
        width: 200,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            const SizedBox(height: 85),
            _drawerItem(context, 'Home', '/landingpage'),
            _drawerItem(context, 'Order Now', '/ordernow'),
            _drawerItem(context, 'Contact Us', '/contactus'),
            _iconItem(context, 'Notifications', Icons.notifications, '/notifications'),
            _iconItem(context, 'Account', Icons.account_circle, '/profile'),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context);
                _showLogoutModal(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(  // Wrap the body in a SingleChildScrollView
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Category Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: ['Bilao'].map((category) {
                  final isSelected = selectedCategory == category;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedCategory = category),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFEFCA6C) : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black26),
                        ),
                        child: Center(
                          child: Text(
                            category,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.black : Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),

            // Bilao Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,  // Ensures the grid only takes as much space as it needs
                physics: NeverScrollableScrollPhysics(),  // Prevents the grid from scrolling separately
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 2 : 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemCount: bilao.length,
                itemBuilder: (context, index) {
                  final dish = bilao[index];
                  final name = dish['name']!;
                  final description = dish['description']!;
                  final price = dish['price']!;
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        Image.asset(dish['image']!, height: 105, fit: BoxFit.cover),
                        const SizedBox(height: 10),
                        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text(description, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black54)),
                        const SizedBox(height: 10),
                        Text(price, style: const TextStyle(color: Colors.black54)),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                setState(() {
                                  if (quantities[name]! > 1) {
                                    quantities[name] = quantities[name]! - 1;
                                  }
                                });
                              },
                            ),
                            Text('${quantities[name]}'),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () {
                                setState(() {
                                  quantities[name] = quantities[name]! + 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }

  Widget _iconItem(BuildContext context, String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }

  void _showLogoutModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFFEFCA6C),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Are you sure you want to log out?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Colors.black),
                ),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Logout'),
            ),
            const SizedBox(height: 10),
            OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
