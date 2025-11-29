import 'package:flutter/material.dart';

class TabCartAssignment extends StatefulWidget {
  const TabCartAssignment({super.key});

  @override
  State<TabCartAssignment> createState() => _TabCartAssignmentState();
}

class _TabCartAssignmentState extends State<TabCartAssignment> {
  // shared variables (same file)
  int suitQty = 0;
  int shoeQty = 0;

  final int suitPrice = 820;
  final int shoePrice = 1290;

  int get cartCount => suitQty + shoeQty;
  int get totalPrice => suitQty * suitPrice + shoeQty * shoePrice;

  void addSuit() => setState(() => suitQty++);
  void addShoe() => setState(() => shoeQty++);
  void deleteAll() => setState(() {
        suitQty = 0;
        shoeQty = 0;
      });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5EFF8), // light purple like example
        appBar: AppBar(
          backgroundColor: const Color(0xFFF5EFF8),
          elevation: 0,
          bottom: TabBar(
            indicatorColor: Colors.deepPurple,
            labelColor: Colors.deepPurple,
            unselectedLabelColor: Colors.black87,
            tabs: [
              const Tab(text: "Suit"),
              const Tab(text: "Shoe"),

              // Cart tab with Badge
              Tab(
                child: cartCount == 0
                    ? const Text("Cart")
                    : Badge(
                        label: Text(
                          cartCount.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.redAccent,
                        child: const Text("Cart"),
                      ),
              ),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            // TAB 1: Suit
            _productTab(
              title: "Suit $suitPrice baht",
              icon: Icons.business_center, // use any image you want
              onAdd: addSuit,
            ),

            // TAB 2: Shoe
            _productTab(
              title: "Shoe $shoePrice baht",
              icon: Icons.shopping_bag, // use any image you want
              onAdd: addShoe,
            ),

            // TAB 3: Cart Summary
            _cartTab(),
          ],
        ),
      ),
    );
  }

  // ---------- UI for product tabs ----------
  Widget _productTab({
    required String title,
    required IconData icon,
    required VoidCallback onAdd,
  }) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF9F4FF),
          border: Border.all(color: Colors.black, width: 1.2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            Icon(icon, size: 120, color: Colors.black54),
            const SizedBox(height: 25),

            SizedBox(
              width: 220,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: const StadiumBorder(),
                ),
                onPressed: onAdd,
                child: const Text(
                  "ADD TO CART",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------- UI for cart tab ----------
  Widget _cartTab() {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF9F4FF),
          border: Border.all(color: Colors.black, width: 1.2),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Suit $suitPrice x $suitQty = ${suitPrice * suitQty} baht",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              "Shoe $shoePrice x $shoeQty = ${shoePrice * shoeQty} baht",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 18),
            Text(
              "Total = $totalPrice baht",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 28),

            SizedBox(
              width: 220,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  shape: const StadiumBorder(),
                ),
                onPressed: deleteAll,
                child: const Text(
                  "DELETE ALL",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
