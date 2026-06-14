import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DaftarApp());
}

class DaftarApp extends StatelessWidget {
  const DaftarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFFD4AF37),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _check();
  }

  Future<void> _check() async {
    await Future.delayed(const Duration(seconds: 3));
    final prefs = await SharedPreferences.getInstance();
    final nick = prefs.getString('nickname');
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => nick != null ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF121212),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.edit, color: Color(0xFFD4AF37), size: 80),
            SizedBox(height: 16),
            Text(
              'Daftar',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Sizning raqamli daftaringiz',
              style: TextStyle(color: Color(0xFFC0C0C0)),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Asosiy sahifa', style: TextStyle(color: Colors.white))),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Kirish', style: TextStyle(color: Colors.white))),
    );
  }
}
