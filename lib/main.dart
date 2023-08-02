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
    "ت'": "ث",
    "j": "ج",
    "H": "ح",
    "x": "خ",
    "d": "د",
    "د'": "ذ",
    "r": "ر",
    "z": "ز",
    "s": "س",
    "س'": "ش",
    "S": "ص",
    "D": "ض",
    "T": "ط",
    "Z": "ظ",
    "g": "ع",
    "ع'": "غ",
    "f": "ف",
    "q": "ق",
    "k": "ك",
    "l": "ل",
    "m": "م",
    "n": "ن",
    "h": "ه",
    "w": "و",
    "i": "ي",
    "ه'": "ة",
    "y": "ى",
    "e": "إ",
    "A": "أ",
    "o": "ؤ",
    "I": "ئ",
    "u": "ء",
    " ": " ",
    ",": "،"
  };

  final _controller = TextEditingController();
  String alphaText = "";

  String _convertValue(String value) {
    List word = [];
    List<String> chars = value.split('');
    String previousChar = "";
    for (String c in chars) {
      if (keys.containsValue(previousChar) &&
          c == "'" &&
          keys.containsKey("$previousChar'")) {
        word.removeLast();
        word.add(keys["$previousChar'"]);
      } else if (keys.containsKey(c)) {
        word.add(keys[c]);
      } else if (keys.values.contains(c)) {
        word.add(c);
      }
      previousChar = c;
    }
    return word.join();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                TextField(
                  cursorWidth: 1,
                  controller: _controller,
                  autofocus: true,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  cursorHeight: 20,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(20.0),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                  onChanged: (value) {
                    int currentOffset = _controller.selection.base.offset;
                    final newValue = _convertValue(value);
                    _controller.value = TextEditingValue(
                      text: newValue,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: currentOffset),
                      ),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
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
