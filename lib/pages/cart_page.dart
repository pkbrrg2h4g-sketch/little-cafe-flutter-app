import 'package:flutter/material.dart';
import '../models/product.dart';

class CartPage extends StatelessWidget {
  final Map<int, int> cartItems;
  final List<Product> products;
  final Function(Product product) onIncrease;
  final Function(Product product) onDecrease;
  final Function(Product product) onRemove;

  const CartPage({
    super.key,
    required this.cartItems,
    required this.products,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  double get totalAmount {
    double total = 0;
    for (final entry in cartItems.entries) {
      final product = products.firstWhere((item) => item.id == entry.key);
      total += product.price * entry.value;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final cartEntries = cartItems.entries.toList();

    if (cartEntries.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_outlined, size: 70, color: Color(0xFFB66B6B)),
            SizedBox(height: 16),
            Text(
              'Sepet boş',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Color(0xFF4D2F2A),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Koleksiyonundan ürünleri eklemeyi unutma.',
              style: TextStyle(color: Color(0xFF7A5B55)),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Sepetim',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF4D2F2A),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: ListView.separated(
                itemCount: cartEntries.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final entry = cartEntries[index];
                  final product = products.firstWhere((item) => item.id == entry.key);
                  final quantity = entry.value;

                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.network(
                            product.imageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF4D2F2A),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                '${product.price.toStringAsFixed(0)} ₺',
                                style: const TextStyle(
                                  color: Color(0xFF7A4B3A),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () => onDecrease(product),
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFF3E5E5),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(Icons.remove, size: 18),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    '$quantity',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () => onIncrease(product),
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFB66B6B),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => onRemove(product),
                          icon: const Icon(Icons.delete_outline_rounded),
                          color: const Color(0xFFB66B6B),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Toplam',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF4D2F2A),
                        ),
                      ),
                      Text(
                        '${totalAmount.toStringAsFixed(0)} ₺',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF6A372F),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('Sipariş simülasyonu'),
                            content: const Text('Siparişiniz başarıyla oluşturuldu!'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Tamam'),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFB66B6B),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        'Siparişi Tamamla',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
