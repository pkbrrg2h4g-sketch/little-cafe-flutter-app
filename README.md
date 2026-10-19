# Little Café

Little Café, Flutter ile hazırlanan modern ve estetik bir mini katalog uygulamasıdır. Eğitim amaçlı tasarlanmış bu proje, ürün listesi, ürün detay ekranı, arama ve kategori filtreleme, sepet yönetimi ve sayfa geçişlerini örnekler.

## Özellikler
- Ana sayfa
- Katalog ekranı
- Ürün detay sayfası
- Arama ve kategori filtreleme
- Sepet ekranı
- Ürün ekleme/çıkarma ve toplam hesaplama
- Material Design ile modern düzen

## Kurulum

1. Flutter SDK kurulu olmalıdır.
2. Projeyi klonlayın:
   ```bash
   git clone https://github.com/pkbrrg2h4g-sketch/little-cafe-flutter-app.git
   cd little-cafe-flutter-app
   ```
3. Bağımlılıkları yükleyin:
   ```bash
   flutter pub get
   ```
4. Uygulamayı çalıştırın:
   ```bash
   flutter run
   ```

## Proje yapısı

```text
lib/
├─ main.dart
├─ models/
│  └─ product.dart
├─ pages/
│  ├─ home_page.dart
│  ├─ catalog_page.dart
│  ├─ product_detail_page.dart
│  └─ cart_page.dart
├─ services/
│  └─ product_service.dart
└─ widgets/
   └─ product_card.dart
```

## Not
Bu proje, eğitim amaçlı örnek ürün verileri ve internet üzerinden resimler kullanmaktadır. Görseller açıksa uygulama sorunsuz çalışır.
