import 'package:flutter/material.dart';
import 'keystack.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Map<String, String> keys = {
    "a": "ا",
    "b": "ب",
    "t": "ت",
    "t'": "ث",
    "j": "ج",
    "H": "ح",
    "x": "خ",
    "d": "د",
    "d'": "ذ",
    "r": "ر",
    "z": "ز",
    "s": "س",
    "s'": "ش",
    "S": "ص",
    "D": "ض",
    "T": "ط",
    "Z": "ظ",
    "g": "ع",
    "g'": "غ",
    "f": "ف",
    "q": "ق",
    "k": "ك",
    "l": "ل",
    "m": "م",
    "n": "ن",
    "h": "ه",
    "w": "و",
    "i": "ي",
    "h'": "ة",
    "y": "ى"
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => 'Arabic Keyboard',
      title: "Arabic Keyboard",
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 220, 220, 220),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Arabic Keyboard',
                  style: TextStyle(fontSize: 20),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                const TextField(
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  cursorHeight: 20,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(20.0),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: keys.entries.map((entry) {
                    return KeyStack(alpha: entry.key, arab: entry.value);
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
