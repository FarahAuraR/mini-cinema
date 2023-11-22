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