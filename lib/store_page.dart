import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  // Kampanya bilgileri
  List<Map<String, String>> campaigns = [
    {
      "image": "https://lh4.googleusercontent.com/7kgMaRGf5UpcM7-tADmWOZlm9VE-6R45p8DRqVkPM7Tro9U6oL8hYj8EjLu7qXt8Xvi9hN18iB5i1bvwb7RVuBw9smQcKV2x_WcGuesu7TKpsfh1I8YbQ8-pzE9DIr3JAJoNksGJi_uaMRJGcQ",
      "title": "Kampanya 1",
      "description": "Bu kampanya ile %20 indirim fırsatını kaçırmayın!"
    },
    {
      "image": "https://lh4.googleusercontent.com/7kgMaRGf5UpcM7-tADmWOZlm9VE-6R45p8DRqVkPM7Tro9U6oL8hYj8EjLu7qXt8Xvi9hN18iB5i1bvwb7RVuBw9smQcKV2x_WcGuesu7TKpsfh1I8YbQ8-pzE9DIr3JAJoNksGJi_uaMRJGcQ",
      "title": "Kampanya 2",
      "description": "Üç al, bir bedava! Yalnızca sınırlı bir süre!"
    },
    {
      "image": "https://lh4.googleusercontent.com/7kgMaRGf5UpcM7-tADmWOZlm9VE-6R45p8DRqVkPM7Tro9U6oL8hYj8EjLu7qXt8Xvi9hN18iB5i1bvwb7RVuBw9smQcKV2x_WcGuesu7TKpsfh1I8YbQ8-pzE9DIr3JAJoNksGJi_uaMRJGcQ",
      "title": "Kampanya 3",
      "description": "Büyük sezon sonu indirimi! Tüm ürünlerde %30'a varan indirim!"
    },
  ];

  List<Map<String, String>> products = [
    {"name": "VDS Server", "description": "Yüksek performanslı VDS sunucu", "price": "\$50", "image": "https://lh4.googleusercontent.com/7kgMaRGf5UpcM7-tADmWOZlm9VE-6R45p8DRqVkPM7Tro9U6oL8hYj8EjLu7qXt8Xvi9hN18iB5i1bvwb7RVuBw9smQcKV2x_WcGuesu7TKpsfh1I8YbQ8-pzE9DIr3JAJoNksGJi_uaMRJGcQ"},
    {"name": "VPS Server", "description": "Orta düzey VPS sunucu", "price": "\$80", "image": "https://lh4.googleusercontent.com/7kgMaRGf5UpcM7-tADmWOZlm9VE-6R45p8DRqVkPM7Tro9U6oL8hYj8EjLu7qXt8Xvi9hN18iB5i1bvwb7RVuBw9smQcKV2x_WcGuesu7TKpsfh1I8YbQ8-pzE9DIr3JAJoNksGJi_uaMRJGcQ"},
    {"name": "Dedicated Server", "description": "Dedicated sunucu çözümü", "price": "\$150", "image": "https://lh4.googleusercontent.com/7kgMaRGf5UpcM7-tADmWOZlm9VE-6R45p8DRqVkPM7Tro9U6oL8hYj8EjLu7qXt8Xvi9hN18iB5i1bvwb7RVuBw9smQcKV2x_WcGuesu7TKpsfh1I8YbQ8-pzE9DIr3JAJoNksGJi_uaMRJGcQ"},
    {"name": "Nested Server", "description": "Nested sunucu yönetim hizmeti", "price": "\$200", "image": "https://lh4.googleusercontent.com/7kgMaRGf5UpcM7-tADmWOZlm9VE-6R45p8DRqVkPM7Tro9U6oL8hYj8EjLu7qXt8Xvi9hN18iB5i1bvwb7RVuBw9smQcKV2x_WcGuesu7TKpsfh1I8YbQ8-pzE9DIr3JAJoNksGJi_uaMRJGcQ"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Store'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              // Arama işlevi burada olacak
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Kampanya Slider
          CarouselSlider.builder(
            itemCount: campaigns.length,
            itemBuilder: (context, index, realIndex) {
              var campaign = campaigns[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(children: [Image.network(campaign['image']!, fit: BoxFit.cover ,height: 200,),
                  
                  Column(
                    children: [
                      Text(
                    campaign['title']!,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    campaign['description']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                    ],
                  )
                  ]
                  
                  ),
                  
                  
                ],
              );
            },
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 1,
            ),
          ),

          // Ürünler Listesi
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                var product = products[index];
                return ProductCard(
                  productName: product['name']!,
                  productDescription: product['description']!,
                  productPrice: product['price']!,
                  productImage: product['image']!,
                );
              },
            ),
          ),
        ],
      ),
      
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productImage;

  ProductCard({
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('$productName Paket Seçenekleri'),
              content: Text('Burada detaylı paket seçenekleri gösterilecek.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Kapat'),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(productImage, fit: BoxFit.fitWidth),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(productName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(productDescription, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
