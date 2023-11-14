import 'package:flutter/material.dart';
import 'package:mini_cinema/widgets/left_drawer.dart';
import 'package:mini_cinema/screens/minicinema_form.dart';

class ShowItem extends StatefulWidget {
  const ShowItem({super.key});

  @override
  State<StatefulWidget> createState() => _ShowItemPage();
}

class _ShowItemPage extends State<ShowItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
        backgroundColor: const Color.fromARGB(255, 191, 52, 52),
        foregroundColor: Colors.white,
      ),

      drawer: const LeftDrawer(),

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].name),
            subtitle: Text(
                "Amount: ${items[index].amount} \nDescription: ${items[index].description}"),
            onTap: () {
              //when a list item is pressed (belum ada)
            },
          );
        },
      ),
    );
  }
}