import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Map<String, dynamic>> products = [
    {'name': 'Laptop', 'price': 1000},
    {'name': 'Tablet', 'price': 500},
    {'name': 'Telefon', 'price': 300},
    {'name': 'Saat', 'price': 150},
    {'name': 'Kulaklık', 'price': 80},
    {'name': 'Kamera', 'price': 600},
  ];

  int selectedProductIndex = -1;

  void onProductSelected(int index) {
    setState(() {
      selectedProductIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Listesi'),
      ),
      body: Column(
        children: [
          // Horizontal ListView
          Container(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onProductSelected(index),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: selectedProductIndex == index ? Colors.blue : Colors.grey[300]!,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        products[index]['name'],
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          // GridView
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => onProductSelected(index),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedProductIndex == index ? Colors.blue[100]! : Colors.grey[100]!,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: selectedProductIndex == index ? Colors.blue : Colors.grey[300]!,
                        width: 2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          products[index]['name'],
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$${products[index]['price']}',
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
