# mini_cinema

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

<details>
<summary>TUGAS 7</summary>

<h1>Perbedaan Stateless dan Stateful Widget dalam Pengembangan Aplikasi Flutter</h1>

Perbedaan utama antara stateless dan stateful widget di Flutter adalah `Stateless Widget` merupakan widget yang tidak akan pernah berubah (widget statis). Stateless Widget merupakan widget yang di-build hanya dengan konfigurasi yang telah diinisiasi sejak awal. Sebaliknya, `Stateful Widget` merupakan widget yang dapat berubah-ubah secara dinamis. Ini berarti widget ini dapat merubah tampilannya sesuai response dari events yang dipicu baik dari interaksi user maupun adanya variabel atau nilai baru yang didapat.

<h1>Widget yang Digunakan untuk Menyelesaikan Tugas 7 serta Fungsi</h1>

- `MyApp`: Widget yang merupakan root dari aplikasi Flutter. Widget ini mengembalikan sebuah `MaterialApp` yang menyediakan fitur-fitur dasar dari Material Design, seperti tema, navigasi, dan gesture.
- `MyHomePage`: Widget yang merupakan halaman utama dari aplikasi. Widget ini mengembalikan sebuah `Scaffold` yang menyediakan struktur layout dasar untuk aplikasi, seperti app bar, body, dan floating action button.
- `SingleChildScrollView`: Widget yang menyediakan kemampuan untuk melakukan scroll pada konten yang melebihi ukuran layar. Widget ini membungkus `Padding` yang berisi `Column`.
- `Padding`: Widget yang memberikan jarak antara widget dengan widget lainnya. Widget ini digunakan untuk memberikan jarak antara tepi layar dengan konten, serta antara judul dengan grid layout.
- `Column`: Widget yang menampilkan widget-widget lainnya secara vertikal. Widget ini digunakan untuk menampilkan judul dan grid layout.
- `Text`: Widget yang menampilkan teks dengan berbagai atribut, seperti alignment, style, dan font. Widget ini digunakan untuk menampilkan judul "Pony Pocket".
- `GridView.count`: Widget yang menampilkan widget-widget lainnya dalam bentuk grid dengan jumlah kolom yang ditentukan. Widget ini digunakan untuk menampilkan tiga tombol sederhana dengan ikon dan teks.
- `ShopCard`: Widget yang menampilkan sebuah `Material` dengan `InkWell` dan `Container`. Widget ini digunakan untuk menampilkan setiap item pada grid layout dengan warna, ikon, dan teks yang sesuai.
- `Material`: Widget yang memberikan efek visual Material Design pada widget lainnya, seperti elevasi, warna, dan bentuk. Widget ini digunakan untuk memberikan warna pada setiap item pada grid layout.
- `InkWell`: Widget yang memberikan efek visual dan gesture pada widget lainnya, seperti splash dan highlight. Widget ini digunakan untuk memberikan respons ketika setiap item pada grid layout ditekan.
- `Container`: Widget yang menyediakan berbagai kemampuan untuk mengatur widget lainnya, seperti padding, alignment, dan decoration. Widget ini digunakan untuk menampilkan ikon dan teks pada setiap item pada grid layout.
- `Center`: Widget yang menempatkan widget lainnya di tengah-tengah. Widget ini digunakan untuk menempatkan `Column` yang berisi ikon dan teks pada setiap item pada grid layout.
- `Icon`: Widget yang menampilkan ikon dengan berbagai atribut, seperti warna, ukuran, dan jenis. Widget ini digunakan untuk menampilkan ikon pada setiap item pada grid layout.

<h1>Step-by-Step Mengimplementasikan Tugas</h1>

Langkah pertama, saya membuat direktori `mini_cinema` untuk menyimpan proyek flutter. Selanjutnya, saya generate proyek flutter baru dengan command `flutter create mini_cinema`. Setelah itu, saya membuat file baru bernama `menu.dart` pada `mini_cinema/lib` dan melakukan import package `import 'package:flutter/material.dart';`. Dari file `main.dart` saya memindahkan `class MyHomePage` dan `class _MyHomePageState` ke file `menu.dart`. Selanjutnya, saya menambahkan import `import 'package:mini_cinema/menu.dart';`.

Setelah itu, saya mengubah sifat widget halaman menu menjadi stateless. Pada file `main.dart`, saya mengganti `home: const MyHomePage(title: 'Flutter Demo Home Page')` menjadi `home: MyHomePage()`. Selanjutnya, pada `menu.dart` saya mengubah sifat widget halaman dari stateful menjadi stateless dan menambahkan widget-widget seperti teks dan card sebagai berikut.

```dart
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);
    final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist, Color.fromARGB(255, 246, 141, 134)),
    ShopItem("Tambah Item", Icons.add_shopping_cart, Color.fromARGB(255, 229, 126, 103)),
    ShopItem("Logout", Icons.logout, Color.fromARGB(255, 184, 121, 113)),
];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Mini Cinema',
              ),
            ),
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
                        'Mini Cinema', // Text yang menandakan toko
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

      class ShopItem {
        final String name;
        final IconData icon;
        final Color color;
        ShopItem(this.name, this.icon, this.color);
      }

      class ShopCard extends StatelessWidget {
        final ShopItem item;

        const ShopCard(this.item, {super.key}); // Constructor

        @override
        Widget build(BuildContext context) {
          return Material(
            color: item.color,
            child: InkWell(
              // Area responsive terhadap sentuhan
              onTap: () {
                // Memunculkan SnackBar ketika diklik
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(SnackBar(
                      content: Text("Kamu telah menekan tombol ${item.name}!")));
              },
              child: Container(
                // Container untuk menyimpan Icon dan Text
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      const Padding(padding: EdgeInsets.all(3)),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }
```

<h2>Bonus</h2>
Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (Lihat Item, Tambah Item, dan Logout).

[![Screenshot-2023-11-08-at-09-13-15.png](https://i.ibb.co/zPwpZWB/Screenshot-2023-11-08-at-09-13-15.png)](https://ibb.co/KVHdWcf)

</details>

