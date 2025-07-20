# Flutter Wellness AI App Guide

## 🚀 Flutter Core Principles

### 1. **Widget-Based Architecture**
Everything in Flutter is a widget - from simple text to complex layouts:
- **StatelessWidget**: Static content (like display-only pages)
- **StatefulWidget**: Dynamic content that can change (like forms, counters)

### 2. **Material Design**
- Uses Google's Material Design language
- Consistent UI components across the app
- Built-in themes and styling

### 3. **Hot Reload**
- Changes reflect immediately without restarting the app
- Perfect for rapid development and testing

### 4. **Cross-Platform**
- Single codebase for iOS and Android
- Native performance on both platforms

## 📱 App Structure

### **Navigation System**
```
AuthWrapper
├── AuthPage (Login/Signup)
└── MainNavigation (Bottom Navigation)
    ├── DashboardPage
    ├── DietPlanningPage
    ├── BarcodeScannerPage
    ├── ChatPage
    └── ProfilePage
```

### **Key Components Mapped**

| Component | Page | Description |
|-----------|------|-------------|
| **User Authorization** | `AuthPage` | Login/signup screen |
| **User Onboarding** | `ProfilePage` | User setup and preferences |
| **User Dashboard** | `DashboardPage` | Main overview and goals |
| **Diet Planning** | `DietPlanningPage` | Meal plans and nutrition |
| **Scanning Barcodes** | `BarcodeScannerPage` | Food barcode scanning |
| **Chat Interface** | `ChatPage` | AI and human chat |

## 🏗️ Folder Structure

```
lib/
├── main.dart              # App entry point
├── pages/                 # Full page widgets
│   ├── auth_page.dart
│   ├── dashboard_page.dart
│   ├── diet_planning_page.dart
│   ├── barcode_scanner_page.dart
│   ├── chat_page.dart
│   └── profile_page.dart
├── widgets/               # Reusable UI components
│   ├── goal_card.dart
│   ├── meal_card.dart
│   └── chat_bubble.dart
├── services/              # Business logic and API calls
│   ├── auth_service.dart
│   ├── api_service.dart
│   └── barcode_service.dart
├── models/                # Data models
│   ├── user.dart
│   ├── goal.dart
│   └── meal.dart
└── utils/                 # Helper functions
    ├── constants.dart
    └── helpers.dart
```

## 🎯 Navigation Types

### **1. Bottom Navigation (Current)**
- Fixed tabs at the bottom
- Quick access to main features
- Good for primary navigation

### **2. Stack Navigation (Future)**
- Pages stack on top of each other
- Good for detailed views
- Back button navigation

### **3. Drawer Navigation (Future)**
- Side menu for additional options
- Good for settings and secondary features

## 🔧 Key Flutter Concepts

### **State Management**
```dart
// StatelessWidget - Static content
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Welcome!');
  }
}

// StatefulWidget - Dynamic content
class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;
  
  void increment() {
    setState(() {
      count++;
    });
  }
}
```

### **Layout Widgets**
```dart
// Column - Vertical layout
Column(
  children: [
    Text('Item 1'),
    Text('Item 2'),
  ],
)

// Row - Horizontal layout
Row(
  children: [
    Icon(Icons.star),
    Text('Rating'),
  ],
)

// Container - Box with styling
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Text('Styled Box'),
)
```

### **Navigation**
```dart
// Navigate to new page
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => DetailPage()),
);

// Navigate and replace current page
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => HomePage()),
);
```

## 🎨 Theming

### **Material 3 Design**
- Modern, adaptive design system
- Dynamic color schemes
- Consistent spacing and typography

### **Custom Theme**
```dart
ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFF4CAF50), // Green for wellness
    brightness: Brightness.light,
  ),
  useMaterial3: true,
)
```

## 📱 Platform Considerations

### **iOS (Cupertino)**
- Apple's design language
- iOS-specific widgets available
- Native iOS feel

### **Android (Material)**
- Google's design language
- Material Design widgets
- Native Android feel

## 🚀 Next Steps

### **Immediate Tasks**
1. **Add Authentication**: Implement login/signup
2. **API Integration**: Connect to Django backend
3. **Barcode Scanning**: Add camera functionality
4. **Chat Interface**: Implement AI chat
5. **User Onboarding**: Add setup flow

### **Advanced Features**
1. **State Management**: Add Provider/Riverpod
2. **Local Storage**: Add SQLite/Hive
3. **Push Notifications**: Add Firebase
4. **Offline Support**: Add caching
5. **Analytics**: Add user tracking

## 🔍 Debugging Tips

### **Hot Reload**
- Save file to see changes immediately
- Press 'r' in terminal for hot reload
- Press 'R' for hot restart

### **Debug Console**
- Use `print()` for debugging
- Check console output
- Use VS Code debugger

### **Widget Inspector**
- Use Flutter Inspector in VS Code
- Inspect widget tree
- Debug layout issues

## 📚 Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Material Design](https://material.io/design)
- [Flutter Widget Catalog](https://flutter.dev/docs/development/ui/widgets)
- [Flutter Cookbook](https://flutter.dev/docs/cookbook)

---

This structure provides a solid foundation for your wellness AI app with clear separation of concerns and scalable architecture! 🎉 