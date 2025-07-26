# Crypto Listing

A cross-platform Flutter application that shows real-time cryptocurrency market data fetched from the public **CoinGecko** API.

![platform_badges](https://img.shields.io/badge/platform-android%20%7C%20ios%20%7C%20web%20%7C%20desktop-blue)
![license_badge](https://img.shields.io/badge/license-MIT-informational)

## ✨ Features

- Displays the top **20** cryptocurrencies ranked by market-cap.
- Shows name, icon, current price and 24 h price change (color-coded).
- Dark theme & responsive UI powered by [`sizer`](https://pub.dev/packages/sizer).
- State management with [`provider`](https://pub.dev/packages/provider).
- Clean architecture with dedicated **Model ➜ Service ➜ Provider ➜ UI** layers.

## 📸 Screenshots
_Add screenshots of the running app here._

## 🚀 Getting Started

### Prerequisites

1. [Flutter SDK](https://docs.flutter.dev/get-started/install) **v3.0** or later.
2. A connected device or emulator (Android/iOS/web/desktop).

### Installation

```bash
git clone <repo-url>
cd crypto_listing
flutter pub get
flutter run          # choose your target device when prompted
```

### Configuration

Want to fetch prices in a different fiat currency or change the number of coins? Edit `lib/Controller/services/API/apis.dart`:

```dart
String currency = 'usd'; // e.g. 'eur', 'gbp'
String noData  = '20';   // number of coins to fetch
```

## 🗂️ Project Structure

```
lib/
 ├── Controller/
 │   ├── provider/          # State management (CryptoDataProvider)
 │   └── services/          # REST API layer & endpoint definitions
 ├── Model/                 # Plain-Dart data models
 └── main.dart              # Entry point & presentation layer
```

## 📦 Dependencies

| Package  | Purpose |
|----------|---------|
| [provider](https://pub.dev/packages/provider) | State management |
| [http](https://pub.dev/packages/http)         | REST requests    |
| [sizer](https://pub.dev/packages/sizer)       | Responsive UI    |

## 🌐 API Reference

Market data is provided by the free [CoinGecko API](https://www.coingecko.com/en/api). Make sure to comply with their terms of service before commercial use.

## 📝 License

This project is licensed under the **MIT License** – see the [LICENSE](LICENSE) file for details.

---

Made with ❤️ using Flutter.
