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


<details>
<summary>TUGAS 9</summary>

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
  * Single-child layout widgets
- Align : Mengatur posisi dan ukuran child dalam parent widget, cocok untuk menempatkan widget dengan parameter seperti alignment.
- Center : Memusatkan child di tengah parent widget, digunakan untuk memusatkan widget child.
- Container : Menyatukan widget-widget untuk penempatan dan penentuan ukuran, ideal untuk mengelola ukuran, dekorasi, dan penataan widget.
- Padding : Menambahkan jarak tepi pada child sesuai dengan padding yang diberikan, berguna untuk memberikan ruang kosong di sekitar child widget.
- Baseline : Menempatkan child berdasarkan garis dasar (baseline) dari child tersebut, berguna untuk mengatur posisi elemen berdasarkan baseline.

  * Multi-child layout widgets
- Column : Menyusun daftar child widget secara vertikal, digunakan untuk menyusun widget dalam kolom.
- Row : Menyusun daftar child widget secara horizontal, berguna untuk menyusun widget dalam baris.
= Stack : Menumpuk beberapa child di atas satu sama lain, digunakan untuk menata widget secara tumpukan.
- ListView : Daftar linier yang dapat di-scroll, ideal untuk menampilkan daftar item panjang.
- Table : Menampilkan widget dalam bentuk baris dan kolom, berguna untuk menyusun widget dalam tata letak tabel.

  * Sliver widgets
- CupertinoSliverNavigationBar : Navigation bar gaya iOS dengan judul besar, digunakan untuk membuat navigation bar iOS khusus.
- CustomScrollView : ScrollView dengan efek scroll kustom, ideal untuk menciptakan efek scroll yang disesuaikan dan kompleks.
- SliverAppBar : App bar desain material yang terintegrasi dengan CustomScrollView, digunakan untuk membuat app bar berinteraksi dengan efek scroll kustom.

<h1>Elemen Input pada Form yang dipakai pada Tugas 7</h1>
Pada tugas ini, saya menggunakan elemen input berupa `TextFormField` untuk nama item (String), jumlah (int), dan deskripsi (String). Setiap elemen input memiliki fungsi onChanged untuk meng-update variabel terkait saat terjadi perubahan, serta validator untuk memastikan input tidak kosong dan sesuai dengan format yang diinginkan. Selain itu, saya juga menggunakan widget `Form`  sebagai wadah bagi beberapa input field widget.

<h1>Penerapan clean architecture pada aplikasi Flutter</h1>
Penerapan Clean Architecture pada aplikasi Flutter melibatkan organisasi proyek menjadi beberapa modul yang sesuai dengan prinsip Clean Architecture. Berikut adalah langkah-langkah umum untuk menerapkan Clean Architecture pada aplikasi Flutter :
- Modularisasi : Membagi proyek menjadi modul terpisah untuk Lapisan Data, Lapisan Presentasi, dan Lapisan Domain guna mempermudah pemeliharaan dan pengembangan.
- Lapisan Data : Implementasikan sumber data dan gunakan pola Repository untuk mengelola akses data tanpa ketergantungan pada lapisan presentasi atau domain.
- Lapisan Domain : Definisikan entities dan use cases yang mencakup logika bisnis inti aplikasi, tanpa tergantung pada lapisan presentasi atau data.
- Lapisan Presentasi : Terapkan state management dan UI di lapisan presentasi, yang hanya bergantung pada lapisan domain untuk menjembatani antara UI dan logika bisnis.
- Dependency Injection : Gunakan Dependency Injection untuk mengelola ketergantungan antar modul dan menyediakan fleksibilitas dalam penggantian implementasi.
- Unit Test : Implementasikan unit test untuk setiap use case di lapisan domain untuk memastikan kestabilan dan kebenaran logika bisnis.
- Integrasi dengan Framework: Hubungkan lapisan presentasi dengan Flutter, fokus pada tampilan dan interaksi pengguna, tanpa mencampuradukkan logika bisnis.
- Penggunaan Libraries: Pertimbangkan penggunaan library eksternal yang mendukung prinsip Clean Architecture, seperti Dio untuk akses HTTP atau Moor untuk database lokal, untuk memperkuat implementasi tanpa mengorbankan struktur modular.

<h1>Step-by-Step Mengimplementasikan Tugas</h1>
<h2></h2>

 Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:
 Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat.
 Memiliki sebuah tombol Save.
 Setiap elemen input di formulir juga harus divalidasi dengan ketentuan sebagai berikut:
 Setiap elemen input tidak boleh kosong.
 Setiap elemen input harus berisi data dengan tipe data atribut modelnya.
 Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
 Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
 Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
 Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
 Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
 Ketika memiih opsi (Tambah Item), maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru.
</details>


<details>
<summary>TUGAS 8</summary>

<h1>Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?</h1>
Iya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu, hal ini disebut dynamic parsing. Namun, membuat model sebelumnya memberikan keamanan tipe, meningkatkan pemahaman, dan memudahkan pemeliharaan kode, sementara parsing dinamis bisa lebih fleksibel tetapi rentan terhadap kesalahan dan sulit dipelihara pada proyek yang berkembang.

<h1>Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter</h1>
CookieRequest merupakan sebuah kelas dalam Flutter yang berperan dalam manajemen cookies dalam aplikasi. Fungsinya mencakup penyimpanan dan pengambilan cookies yang digunakan dalam interaksi dengan server web. Penting untuk berbagi instance CookieRequest ke semua komponen dalam aplikasi Flutter karena cookies sering digunakan untuk keperluan otentikasi pengguna, pelacakan sesi, dan penyimpanan preferensi pengguna. Dengan menggunakan instance yang sama, dapat dipastikan bahwa setiap komponen dalam aplikasi memiliki akses yang konsisten ke informasi cookies.

<h1>Mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter</h1>

  * Ambil Data dari Sumber Eksternal: Dapatkan data JSON, biasanya dari API web, menggunakan metode HTTP GET atau POST.
  * Parsel JSON: Parse data JSON menjadi objek atau struktur data yang dapat digunakan oleh Flutter. Fungsi jsonDecode() dari paket dart:convert dapat digunakan untuk ini.
  * Gunakan Data untuk Membangun Widget: Gunakan objek atau struktur data yang telah di-parse untuk membangun widget Flutter, seperti ListView, Card, atau widget kustom, yang kemudian ditampilkan kepada pengguna.

<h1>Mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter</h1>

  * Formulir di Flutter: Buat formulir di Flutter untuk masukan akun pengguna.
  * Kirim Data ke Django: Gunakan metode HTTP (biasanya POST) untuk mengirim data ke endpoint autentikasi Django.
  * Autentikasi di Django: Implementasikan autentikasi di Django dan berikan respons, misalnya token akses.
  * Respon ke Flutter: Tangani respons dari Django di Flutter, simpan token jika diperlukan.
  * Navigasi ke Halaman Menu: Setelah autentikasi berhasil, navigasikan ke halaman menu di Flutter.

<h1>Widget yang dipakai pada tugas 8 dan jelaskan fungsinya</h1>

  * Scaffold: Kerangka dasar untuk tata letak berbasis material design.
  * AppBar: Menampilkan judul dan tindakan di bagian atas.
  * Padding: Memberikan jarak pada widget anak.
  * Column: Menyusun anak-anak secara vertikal.
  * Text: Menampilkan teks dengan konfigurasi tertentu.
  * SizedBox: Memberikan ruang kosong dengan ukuran tertentu.
  * FloatingActionButton: Tombol aksi mengambang di atas konten.
  * Icon: Menampilkan ikon untuk representasi visual.
  * Drawer: Panel yang dapat ditarik dari tepi layar.
  * FutureBuilder: Membuat widget berdasarkan hasil Future.
  * GestureDetector: Mendeteksi gestur pengguna.
  * ListView.builder: Membuat daftar gulir efisien.
  * MaterialPageRoute: Transisi antar halaman berbasis material design.
  * Navigator: Mengelola tumpukan navigasi.
  * Container: Kotak untuk menampung widget lainnya.

<h1>Step-by-Step Mengimplementasikan Tugas</h1>
<h2>Membuat halaman login pada proyek tugas Flutter dan Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter</h2>

Langkat pertama, yaitu saya membuat django-app bernama `authentication` pada project Django dengan menjalankan perintah `python3 manage.py startapp authentication` pada terminal. Lalu, saya juga menjalankan perintah `pip install django-cors-headers` untuk menginstal library yang dibutuhkan. Kemudian, saya menambahkan `authentication` dan `corsheaders` ke INSTALLED_APPS pada main project `settings.py` aplikasi Django. Saya juga menambahkan `corsheaders.middleware.CorsMiddleware` pada main project `settings.py` aplikasi Django dan menambahkan beberapa variabel berikut.

```python
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'`
```

Langkah selanjutnya, saya membuka `authentication/views.py` dan membuat fungsi loginnya.
```python
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import logout as auth_logout

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```

Selanjutnya, saya membuat file `urls.py` pada folder `authentication` dan menambahkan URL routing terhadap fungsi yang sudah dibuat dengan endpoint `login/` dan menambahkan `path('auth/', include('authentication.urls')),` pada file `mini_cinema/urls.py`.

```python
from django.urls import path
from authentication.views import login

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
]
```

Untuk melakukan integrasi sistem autentikasi pada Flutter, saya menjalankan perintah `flutter pub add provider`
`flutter pub add pbp_django_auth` pada terminal. Kemudian untuk menggunakan package tersebut, saya memodifikasi root widget untuk menyediakan CookieRequest library ke semua child widgets dengan menggunakan Provider. Hal ini akan membuat objek Provider baru yang akan membagikan instance CookieRequest dengan semua komponen yang ada di aplikasi. Jadi, saya mengubah main.dart menjadi seperti berikut.
```dart
class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Flutter App',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 182, 82, 82)),
                    useMaterial3: true,
                ),
                home: LoginPage()),
        );
    }
}
```

Selanjutnya, saya membuat file baru pada folder screens dengan nama `login.dart` dan isi file tersebut dengan kode berikut.

```dart
import 'package:mini_cinema/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
const LoginApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const LoginPage(),
    );
    }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;
                                final response = await request.login("https://farah-aura-tugas.pbp.cs.ui.ac.id/auth/login/", {
                                'username': username, 
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                }
                            },
                            child: const Text('Login'),
                        ),
                    ],
                ),
            ),
        );
    }
}
```

Terakhir, di file main.dart, pada Widget MaterialApp(...), saya mengubah `home: MyHomePage()` menjadi `home: LoginPage()`

<h2>Membuat model kustom sesuai dengan proyek aplikasi Django.</h2>

Dalam membuat model yang menyesuaikan dengan data JSON, saya menggunakan website Quicktype. Pertama, saya mengubah setup name menjadi Item, source type menjadi JSON, dan language menjadi Dart pada website Quickype. Kemudian, saya membuka endpoint JSON yang sudah saya buat sebelumnya, lalu copy data JSON dan paste ke dalam textbox yang tersedia pada Quicktype. Selanjutnya, saya pilih `Copy Code` dan paste di file baru yang saya buat pada folder `lib/models` dengan nama `item.dart`

<h2>Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah di deploy dan menampilkan name, amount, dan description dari masing-masing item pada halaman ini.</h2>

Pertama, saya menjalankan `flutter pub add http` pada terminal proyek Flutter untuk menambahkan package http. Kemudian, pada file 	`android/app/src/main/AndroidManifest.xml`, saya menambahkan kode `<uses-permission android:name="android.permission.INTERNET" />` di bawah `</application>` untuk memperbolehkan akses Internet pada aplikasi Flutter yang sedang dibuat. Lalu, saya melakukan Fetch Data dari Django dengan membuat file baru pada folder `lib/screens` dengan nama `list_item.dart`. Kemudian, isi file  tersebut dengan kode berikut.

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mini_cinema/models/item.dart';
import 'package:mini_cinema/widgets/left_drawer.dart';
import 'package:mini_cinema/screens/detail_item.dart';

class ItemPage extends StatefulWidget {
    const ItemPage({Key? key}) : super(key: key);

    @override
    _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
Future<List<Item>> fetchItem() async {
    var url = Uri.parse(
        'https://farah-aura-tugas.pbp.cs.ui.ac.id/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    var data = jsonDecode(utf8.decode(response.bodyBytes));
    
    List<Item> list_item = [];
    for (var d in data) {
        if (d != null) {
            list_item.add(Item.fromJson(d));
        }
    }
    return list_item;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Item'),
          backgroundColor: const Color.fromARGB(255, 170, 71, 68),
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchItem(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "No data item.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailItemPage(
                              item: snapshot.data![index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].fields.name}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // const SizedBox(height: 10),
                            // Text("${snapshot.data![index].fields.price}"),
                            // const SizedBox(height: 10),
                            // Text("${snapshot.data![index].fields.description}")
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
            }
	)
	);
  }
}
```

<h2>Membuat Halaman Detail Item, diakses dengan menekan salah satu item pada halaman daftar Item dan tampilkan seluruh atribut pada model item</h2>

Saya membuat file baru dengan nama `detail_item.dart` dan isi file tersebut dengan kode berikut.
```dart
import 'package:flutter/material.dart';
import 'package:mini_cinema/models/item.dart';

class DetailItemPage extends StatelessWidget {
    final Item item;

    const DetailItemPage({Key? key, required this.item}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(item.fields.name),
                backgroundColor: const Color.fromARGB(255, 170, 71, 68),
                foregroundColor: Colors.white,
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text(
                            item.fields.name,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                        SizedBox(height: 20),
                        Text('Amount: ${item.fields.amount}'),
                        SizedBox(height: 20),
                        Text('Price: ${item.fields.price}'),
                        SizedBox(height: 20),
                        Text('Description: ${item.fields.description}'),
                    ],
                ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 170, 71, 68),
              foregroundColor: Colors.white,
                onPressed: () {
                    Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
            ),
        );
    }
}
```

Kemudian, saya menambahkan routing dengan kode berikut pada file `list_item.dart`
```dart
itemBuilder: (_, index) => GestureDetector(
      onTap: () {
	Navigator.push(
	  context,
	  MaterialPageRoute(
	    builder: (context) => DetailItemPage(
	      item: snapshot.data![index],
	    ),
	  ),
	);
      },
```

<h2>Tambahkan tombol untuk kembali ke halaman daftar item.</h2>
Untuk menambahkan tombol kembali, saya menambahkan kode berikut.

```dart
floatingActionButton: FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 170, 71, 68),
      foregroundColor: Colors.white,
	onPressed: () {
	    Navigator.pop(context);
	},
	child: Icon(Icons.arrow_back),
    ),
```

</details>