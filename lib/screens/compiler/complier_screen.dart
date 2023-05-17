import 'package:demo/common/constants.dart';
import 'package:flutter/material.dart';

class CompilerScreen extends StatefulWidget {
  CompilerScreen({Key? key}) : super(key: key);

  @override
  State<CompilerScreen> createState() => _CompilerScreenState();
}

class _CompilerScreenState extends State<CompilerScreen> {
  String Code = '''
#include<stdio.h>
int main() {
    int intType;
    float floatType;
    double doubleType;
    char charType;

    // sizeof evaluates the size of a variable
    printf("Size of int: %zu bytes\n", sizeof(intType));
    printf("Size of float: %zu bytes\n", sizeof(floatType));
    printf("Size of double: %zu bytes\n", sizeof(doubleType));
    printf("Size of char: %zu byte\n", sizeof(charType));
    
    return 0;
}
''';
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController symbolController = TextEditingController();
  final TextEditingController sumController = TextEditingController();

  List<String> _lines = [];
  @override
  void initState() {
    super.initState();
    textEditingController.addListener(_updateLineNumbers);
  }

  void _updateLineNumbers() {
    setState(() {
      _lines = textEditingController.text.split('\n');
    });
  }

  void dispose() {
    textEditingController.removeListener(_updateLineNumbers);
    textEditingController.dispose();
    super.dispose();
  }

  String selectedSymbol = '';

  final List<String> symbols = [
    "/",
    "%",
    "++",
    "--",
    "==",
    "!=",
    ">",
    "<",
    ">=",
    "<=",
    "&&",
    "||",
    "!",
    "&",
    "|",
    "^",
    "~",
    "<<",
    ">>",
    ">>>",
    "+=",
    "-=",
    "=",
    "/=",
    "%=",
    "&=",
    "|=",
    "^=",
    "<<=",
    ">>=",
    ";",
    "()",
    "{}",
    "[]",
    ",",
    ":",
    ".",
    "?",
    "#",
    "\$",
    "&",
    "_"
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF333742),
        body: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 40,
                  color: Colors.grey[900],
                  child: ListView.builder(
                    itemCount: _lines.length,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: textEditingController,
                      style: const TextStyle(color: Colors.white),
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: symbols.length,
                  itemBuilder: (context, index) {
                    final symbol = symbols[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          symbolController.text = symbol;
                        });
                        print(symbolController.text);
                        sumController;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 40,
                          height: 30,
                          color: Colors.grey[900],
                          child: Center(
                            child: Text(
                              symbol,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        /* floatingActionButton: FloatingActionButton(

          onPressed: () async {
            await Future.delayed(Duration(seconds: 2));
            setState(() {
              _isLoading = false;
            });

            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Color(0xFF333742),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _isLoading
                              ? CircularProgressIndicator() // Display a loading indicator while waiting
                              : Text('Data Loaded!')
                        ]),
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.play_arrow_sharp),
        ),*/
      ),
    );
  }
}
