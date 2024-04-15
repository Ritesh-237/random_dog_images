import 'package:dog_api_project/Pages/home_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // List<int> numbers =
  //     List.generate(ImageData.instance.data.length, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: ImageData.instance.cartButtonData.length,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                (index + 1).toString(),
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Card(
              shadowColor: Colors.black,
              // color: Colors.white,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.network(ImageData.instance.cartButtonData[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
