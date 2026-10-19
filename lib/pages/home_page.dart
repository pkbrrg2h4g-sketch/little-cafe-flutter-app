import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/product_service.dart';
import '../widgets/product_card.dart';
import 'product_detail_page.dart';

class HomePage extends StatelessWidget {
  final Function(Product product) onAddToCart;

  const HomePage({
    super.key,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    final products = ProductService.getProducts();
    final featured = products.where((p) => p.isFeatured).toList();
    final newProducts = products.where((p) => p.isNew).toList();

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: const Color(0xFFB66B6B),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.local_cafe_rounded, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Little Café',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF4B2E2C),
                      ),
                    ),
                    Text(
                      'Gününü tatlı tut',
                      style: TextStyle(fontSize: 13, color: Color(0xFF7B5A52)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: const LinearGradient(
                  colors: [Color(0xFFEFC9C7), Color(0xFFF7EEE4)],
                ),
              ),
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Özel kampanya',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF7A4B3A),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Kahvenin sıcak\niletişimi burada başlar.',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF4D2F2A),
                          ),
                        ),
                        const Spacer(),
                        TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFFB66B6B),
                            foregroundColor: Colors.white,
                          ),
                          icon: const Icon(Icons.arrow_forward_rounded),
                          label: const Text('Keşfet'),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?auto=format&fit=crop&w=900&q=80',
                      width: 170,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 26),
            const Text(
              'Kategoriler',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF4D2F2A),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 48,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _CategoryChip(label: 'Tümü'),
                  _CategoryChip(label: 'Kahve'),
                  _CategoryChip(label: 'Bardak'),
                  _CategoryChip(label: 'Termos'),
                  _CategoryChip(label: 'Ekipman'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Öne çıkan ürünler',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF4D2F2A),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 260,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: featured.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final product = featured[index];
                  return SizedBox(
                    width: 190,
                    child: ProductCard(
                      product: product,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailPage(
                              product: product,
                              onAddToCart: () => onAddToCart(product),
                            ),
                          ),
                        );
                      },
                      onAddToCart: () => onAddToCart(product),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Yeni gelenler',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF4D2F2A),
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.74,
              children: newProducts.map((product) {
                return ProductCard(
                  product: product,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailPage(
                          product: product,
                          onAddToCart: () => onAddToCart(product),
                        ),
                      ),
                    );
                  },
                  onAddToCart: () => onAddToCart(product),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;

  const _CategoryChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF7EFEF),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF5A3B35),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
