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


<details>
<summary>TUGAS 8</summary>

<h1>Perbedaan Navigator.push() dan Navigator.pushReplacement() beserta Contoh</h1>

Perbedaan utama antara Navigator.push() dan Navigator.pushReplacement() terletak pada pengelolaan stack route yang dikelola oleh Navigator dalam Flutter. `Navigator.push()` menambahkan suatu route ke dalam stack route yang dikelola oleh Navigator. Route yang ditambahkan akan berada di atas stack, sehingga menjadi route yang sedang ditampilkan kepada pengguna. Stack akan terus bertambah seiring pengguna menavigasi ke route baru. Sementara, `Navigator.pushReplacement()` menghapus route yang sedang ditampilkan kepada pengguna dan menggantinya dengan suatu route baru. Aplikasi berpindah dari route yang sedang ditampilkan ke route yang diberikan. Route lama pada atas stack digantikan secara langsung oleh route baru tanpa mengubah kondisi elemen stack yang berada di bawahnya.

Contoh penggunaan bergantung pada kebutuhan aplikasi dan alur navigasi yang diinginkan.
Contoh `Navigator.push()` :
```java
    if (item.name == "Add Item") {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShopFormPage()));
    }
```
Contoh `Navigator.pushReplacement()` :
```java
    onTap: () {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePage(),
        ));
    },
```

<h1>Layout Widget pada Flutter dan Konteks Penggunaannya</h1>

`Single-child layout widgets`
- Align : Mengatur posisi dan ukuran child dalam parent widget, cocok untuk menempatkan widget dengan parameter seperti alignment.
- Center : Memusatkan child di tengah parent widget, digunakan untuk memusatkan widget child.
- Container : Menyatukan widget-widget untuk penempatan dan penentuan ukuran, ideal untuk mengelola ukuran, dekorasi, dan penataan widget.
- Padding : Menambahkan jarak tepi pada child sesuai dengan padding yang diberikan, berguna untuk memberikan ruang kosong di sekitar child widget.
- Baseline : Menempatkan child berdasarkan garis dasar (baseline) dari child tersebut, berguna untuk mengatur posisi elemen berdasarkan baseline.

`Multi-child layout widgets`
- Column : Menyusun daftar child widget secara vertikal, digunakan untuk menyusun widget dalam kolom.
- Row : Menyusun daftar child widget secara horizontal, berguna untuk menyusun widget dalam baris.
- Stack : Menumpuk beberapa child di atas satu sama lain, digunakan untuk menata widget secara tumpukan.
- ListView : Daftar linier yang dapat di-scroll, ideal untuk menampilkan daftar item panjang.
- Table : Menampilkan widget dalam bentuk baris dan kolom, berguna untuk menyusun widget dalam tata letak tabel.

` Sliver widgets`
- CupertinoSliverNavigationBar : Navigation bar gaya iOS dengan judul besar, digunakan untuk membuat navigation bar iOS khusus.
- CustomScrollView : ScrollView dengan efek scroll kustom, ideal untuk menciptakan efek scroll yang disesuaikan dan kompleks.
- SliverAppBar : App bar desain material yang terintegrasi dengan CustomScrollView, digunakan untuk membuat app bar berinteraksi dengan efek scroll kustom.

<h1>Elemen Input pada Form yang dipakai pada Tugas 7</h1>

Pada tugas ini, saya menggunakan elemen input berupa `TextFormField` untuk nama item (String), jumlah (int), dan deskripsi (String). Setiap elemen input memiliki fungsi onChanged untuk meng-update variabel terkait saat terjadi perubahan, serta validator untuk memastikan input tidak kosong dan sesuai dengan format yang diinginkan. Selain itu, saya juga menggunakan widget `Form`  sebagai wadah bagi beberapa input field widget.

<h1>Penerapan Clean Architecture pada Aplikasi Flutter</h1>

Penerapan `Clean Architecture` pada aplikasi Flutter melibatkan organisasi proyek menjadi beberapa modul yang sesuai dengan prinsip Clean Architecture. Berikut adalah langkah-langkah umum untuk menerapkan Clean Architecture pada aplikasi Flutter :
- Modularisasi : Membagi proyek menjadi modul terpisah untuk Lapisan Data, Lapisan Presentasi, dan Lapisan Domain guna mempermudah pemeliharaan dan pengembangan.
- Lapisan Data : Implementasikan sumber data dan gunakan pola Repository untuk mengelola akses data tanpa ketergantungan pada lapisan presentasi atau domain.
- Lapisan Domain : Definisikan entities dan use cases yang mencakup logika bisnis inti aplikasi, tanpa tergantung pada lapisan presentasi atau data.
- Lapisan Presentasi : Terapkan state management dan UI di lapisan presentasi, yang hanya bergantung pada lapisan domain untuk menjembatani antara UI dan logika bisnis.
- Dependency Injection : Gunakan Dependency Injection untuk mengelola ketergantungan antar modul dan menyediakan fleksibilitas dalam penggantian implementasi.
- Unit Test : Implementasikan unit test untuk setiap use case di lapisan domain untuk memastikan kestabilan dan kebenaran logika bisnis.
- Integrasi dengan Framework: Hubungkan lapisan presentasi dengan Flutter, fokus pada tampilan dan interaksi pengguna, tanpa mencampuradukkan logika bisnis.
- Penggunaan Libraries: Pertimbangkan penggunaan library eksternal yang mendukung prinsip Clean Architecture, seperti Dio untuk akses HTTP atau Moor untuk database lokal, untuk memperkuat implementasi tanpa mengorbankan struktur modular.

<h1>Step-by-Step Mengimplementasikan Tugas</h1>
<h2>Membuat Halaman Formulir Tambah Item Baru dan Elemen Input</h2>

Langkah pertama yang saya lakukan yaitu membuat berkas baru bernama `minicinema_form.dart` dalam direktori screens. Selanjutnya saya membuat variabel `_formKey` dan menambahkannya ke dalam atribut key milik widget Form yang akan berfungsi sebagai handler dari form state, validasi form, dan penyimpanan form. Kemudian, saya implementasikan elemen input berupa `TextFormField` untuk menerima input nama item, jumlah, dan deskripsi. Untuk mengatur tata letak elemen input dan validasi input serta tampilkan pesan kesalahan jika tidak valid, digunakan `Padding` dan `Column`.

```dart
import 'package:flutter/material.dart';
import 'package:mini_cinema/widgets/left_drawer.dart';
import 'package:mini_cinema/widgets/minicinema_card.dart';

List<Items> items = [];

class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Add Item Form',
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 170, 71, 68),
          foregroundColor: Colors.white,
        ),
        // TODO: Tambahkan drawer yang sudah dibuat di sini
        drawer: const LeftDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Item Name",
                      labelText: "Item Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        _name = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Name cannot be empty!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Amount",
                      labelText: "Amount",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // TODO: Tambahkan variabel yang sesuai
                    onChanged: (String? value) {
                      setState(() {
                        _amount = int.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Amount cannot be empty!";
                      }
                      if (int.tryParse(value) == null) {
                        return "Amount must be number!";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Description",
                      labelText: "Description",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        // TODO: Tambahkan variabel yang sesuai
                        _description = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Description cannot be empty!";
                      }
                      return null;
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color.fromARGB(255, 181, 65, 63)),
                      ),
                      onPressed: () {
                        
                        if (_formKey.currentState!.validate()) {

                        items.add(Items(
                          name: _name,
                          amount: _amount,
                          description: _description,
                        ));

                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Item successfully saved'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // TODO: Munculkan value-value lainnya
                                      Text('Name: $_name'),
                                      Text('Amount: $_amount'),
                                      Text('Description: $_description'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                           _formKey.currentState!.reset();
                        }
            
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ]      
            ),
          ),
        ),
      );
    }
}
```

Kemudian, untuk mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Add Item pada halaman utama, saya menggunakan `Navigator.push()` seperti kode berikut.

```dart
if (item.name == "Add Item") {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ShopFormPage(),
    ),
  );
}
```

<h2>Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up</h2>

Langkah yang saya lakukan yaitu menambahkan fungsi `showDialog()` pada bagian `onPressed()` dan munculkan widget `AlertDialog` pada fungsi tersebut. Kemudian, saya juga menambahkan fungsi untuk reset form dengan kode `_formKey.currentState!.reset();`
```dart
child: ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 181, 65, 63)),
  ),
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      items.add(
        Items(
          name: _name,
          amount: _amount,
          description: _description,
        ),
      );

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Item successfully saved'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // TODO: Munculkan value-value lainnya
                  Text('Name: $_name'),
                  Text('Amount: $_amount'),
                  Text('Description: $_description'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
      _formKey.currentState!.reset();
    }
  },
  child: const Text(
    "Save",
    style: TextStyle(color: Colors.white),
  ),
),
```
 
<h2>Membuat sebuah drawer pada aplikasi</h2>

Pertama, saya membuat berkas baru bernama `left_drawer.dart` dalam direktori widgets. Lalu saya menambahkan kode untuk membuat drawer menu dengan navigasi ke halaman `MyHomePage`, `ShopFormPage`, dan `ShowItem`
```dart
import 'package:flutter/material.dart';
import 'package:mini_cinema/screens/menu.dart';
import 'package:mini_cinema/screens/minicinema_form.dart';
import 'package:mini_cinema/screens/minicinema_show.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 199, 139, 107),
            ),
            child: Column(
              children: [
                Text(
                  'Mini Cinema',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Experience the magic of cinema, anytime, anywhere!",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Main page'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                )
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Item'),
            // Bagian redirection ke ShopFormPage (routing ke ShopFormPage)
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopFormPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Show Item'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShowItem(),
                )
              );
            },
          ),
        ],
      ),
    );
  }
}
```

<h2>Bonus</h2

Langkah pertama, saya membuat berkas `minicinema_show.dart` pada direktori screens. Kemudian, saya 
membuat kode yang menampilkan daftar item dalam bentuk `ListView`. Daftar item dibangun menggunakan `ListView.builder`. Setiap item direpresentasikan oleh `ListTile` yang menampilkan nama, jumlah, dan deskripsi item.

```dart
import 'package:flutter/material.dart';
import 'package:mini_cinema/widgets/left_drawer.dart';
import 'package:mini_cinema/screens/minicinema_form.dart';

class ShowItem extends StatefulWidget {
  const ShowItem({super.key});

  @override
  State<StatefulWidget> createState() => _ShowItemPage();
}

// The corresponding State class for the 'ShowItem' screen.
class _ShowItemPage extends State<ShowItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
        backgroundColor: const Color.fromARGB(255, 191, 52, 52),
        foregroundColor: Colors.white,
      ),

      // Including the LeftDrawer widget for navigation.
      drawer: const LeftDrawer(),

      // Building a ListView of items with a ListTile for each item.
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            subtitle: Text(
                "Amount: ${items[index].amount} \nDescription: ${items[index].description}"),
            onTap: () {
              // Action to be performed when a list item is tapped.
            },
          );
        },
      ),
    );
  }
}
```

Untuk mengarahkan pengguna ke halaman tersebut jika menekan tombol Show Item pada halaman utama atau drawer, saya menambahkan kode berikut pada `left_drawer.dart` dan `minicinema_card.dart`

Pada `left_drawer.dart` : 
```dart
ListTile(
  leading: const Icon(Icons.add_shopping_cart),
  title: const Text('Show Item'),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ShowItem(),
      ),
    );
  },
),
```

Pada `minicinema_card.dart` :
```dart
if (item.name == "Show Item") {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ShowItem(),
    ),
  );
}
```

</details>

