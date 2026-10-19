class Product {
  final int id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;
  final String description;
  final String brand;
  final double rating;
  final bool isFeatured;
  final bool isNew;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.brand,
    required this.rating,
    required this.isFeatured,
    required this.isNew,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Ürün',
      category: json['category'] as String? ?? 'Kategorisiz',
      price: (json['price'] is num) ? (json['price'] as num).toDouble() : 0.0,
      imageUrl: json['imageUrl'] as String? ??
          'https://images.unsplash.com/photo-1509042239860-f550ce710b93?auto=format&fit=crop&w=900&q=80',
      description: json['description'] as String? ??
          'Bu ürün Little Cafe koleksiyonundan seçilmiştir.',
      brand: json['brand'] as String? ?? 'Little Cafe',
      rating: (json['rating'] is num) ? (json['rating'] as num).toDouble() : 4.8,
      isFeatured: json['isFeatured'] as bool? ?? false,
      isNew: json['isNew'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
      'brand': brand,
      'rating': rating,
      'isFeatured': isFeatured,
      'isNew': isNew,
    };
  }
}
