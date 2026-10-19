# Little Café

Little Café, Flutter ile hazırlanan modern ve estetik bir mini katalog uygulamasıdır. Eğitim amaçlı tasarlanan bu proje, temel Flutter kavramlarını örnekleyen bir katalog uygulamasıdır.

## Özellikler
- Ana sayfa
- Katalog ekranı
- Ürün detay sayfası
- Arama ve kategori filtreleme
- Sepet ekranı
- Ürün ekleme/çıkarma ve toplam hesaplama
- Material Design tasarımı

## Gereksinimler
- Flutter SDK
- Dart SDK
- VS Code
- Android Studio
- Android Emulator veya fiziksel cihaz

## Kurulum
1. Projeyi klonlayın:
   ```bash
   git clone https://github.com/pkbrrg2h4g-sketch/little-cafe-flutter-app.git
   cd little-cafe-flutter-app
   ```
2. Bağımlılıkları indirin:
   ```bash
   flutter pub get
   ```
3. Çalıştırın:
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
Bu proje, demo amaçlı örnek ürün verileri ve internet üzerinden yüklenecek görseller kullanmaktadır. Görsellerin erişilebilir olması gerekir.
