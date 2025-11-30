import 'package:flutter/material.dart';

class Assignment4 extends StatelessWidget {
  Assignment4({super.key});

  // 9 items (repeat Apple/Banana/Orange like in the example)
  final List<Map<String, dynamic>> fruit = [
    {'name': 'Apple', 'price': 9, 'image': 'apple.png'},
    {'name': 'Banana', 'price': 3, 'image': 'banana.png'},
    {'name': 'Orange', 'price': 5, 'image': 'orange.png'},
    {'name': 'Apple', 'price': 9, 'image': 'apple.png'},
    {'name': 'Banana', 'price': 3, 'image': 'banana.png'},
    {'name': 'Orange', 'price': 5, 'image': 'orange.png'},
    {'name': 'Apple', 'price': 9, 'image': 'apple.png'},
    {'name': 'Banana', 'price': 3, 'image': 'banana.png'},
    {'name': 'Orange', 'price': 5, 'image': 'orange.png'},
  ];

  // show detail dialog when tapping an item
  void _showDetailDialog(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: 260,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item['name'],
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Image.asset(
                      'assets1/images/MD09-images/${item['image']}',
                      height: 120,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${item['price']} baht',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // navigate to page with full vertical list
  void _goToAllProducts(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AllProductsPage(fruit: fruit),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // we want to show only first 5 items + 1 "See more" card
    final int maxItemsToShow = 5;
    final int itemCount =
        (fruit.length >= maxItemsToShow ? maxItemsToShow : fruit.length) + 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Demo'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                // last item = "See more" card
                if (index == itemCount - 1) {
                  return GestureDetector(
                    onTap: () => _goToAllProducts(context),
                    child: Card(
                      margin: const EdgeInsets.all(8),
                      child: SizedBox(
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.play_circle_fill, size: 40),
                            SizedBox(height: 8),
                            Text(
                              'See more',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                final item = fruit[index];

                // normal fruit card
                return GestureDetector(
                  onTap: () => _showDetailDialog(context, item),
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets1/images/MD09-images/${item['image']}',
                            height: 90,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            item['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('${item['price']} baht'),
                        ],
                      ),
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

// ========= Page with ALL products (vertical list) =========

class AllProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> fruit;

  const AllProductsPage({super.key, required this.fruit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product'),
      ),
      body: ListView.builder(
        itemCount: fruit.length,
        itemBuilder: (context, index) {
          final item = fruit[index];
          return Card(
            child: ListTile(
              title: Text(item['name']),
              subtitle: Text('${item['price']} baht'),
              trailing: Image.asset(
                'assets1/images/MD09-images/${item['image']}',
                height: 60,
              ),
            ),
          );
        },
      ),
    );
  }
}
