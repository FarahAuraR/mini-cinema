import 'package:flutter/material.dart';
import 'package:mini_cinema/widgets/left_drawer.dart';
import 'package:mini_cinema/widgets/minicinema_card.dart';


class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);
    final List<ShopItem> items = [
    ShopItem("Show Item", Icons.checklist, const Color.fromARGB(255, 246, 141, 134)),
    ShopItem("Add Item", Icons.add_shopping_cart, const Color.fromARGB(255, 229, 126, 103)),
    ShopItem("Logout", Icons.logout,const Color.fromARGB(255, 184, 121, 113)),
];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Mini Cinema',
              ),
                backgroundColor: const Color.fromARGB(255, 181, 63, 63),
            foregroundColor: Colors.white,
            ),
              
            drawer: const LeftDrawer(),
            
            body: SingleChildScrollView(
              // Widget wrapper yang dapat discroll
              child: Padding(
                padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                child: Column(
                  // Widget untuk menampilkan children secara vertikal
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                      child: Text(
                        'Welcome to Mini Cinema', // Text yang menandakan toko
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Grid layout
                    GridView.count(
                      // Container pada card kita.
                      primary: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: items.map((ShopItem item) {
                        // Iterasi untuk setiap item
                        return ShopCard(item);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }