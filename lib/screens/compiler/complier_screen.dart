import 'package:demo/screens/compiler/compiler_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompilerScreen extends StatefulWidget {
  const CompilerScreen({Key? key}) : super(key: key);

  @override
  State<CompilerScreen> createState() => _CompilerScreenState();
}

class _CompilerScreenState extends State<CompilerScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CompilerController>(context, listen: false)
        .textEditingController
        .addListener(_updateLineNumbers);
  }

  void _updateLineNumbers() {
    setState(() {
      Provider.of<CompilerController>(context, listen: false).lines =
          Provider.of<CompilerController>(context, listen: false)
              .textEditingController
              .text
              .split('\n');
    });
  }

  @override
  void dispose() {
    Provider.of<CompilerController>(context, listen: false)
        .textEditingController
        .removeListener(_updateLineNumbers);
    Provider.of<CompilerController>(context, listen: false)
        .textEditingController
        .dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CompilerController>(
        builder: (BuildContext context, compilerController, Widget? child) {
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
                      itemCount: Provider.of<CompilerController>(context,
                              listen: false,)
                          .lines
                          .length,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8,),
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
                        controller: Provider.of<CompilerController>(context,
                                listen: false,)
                            .textEditingController,
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
                    itemCount: compilerController.symbols.length,
                    itemBuilder: (context, index) {
                      final symbol = compilerController.symbols[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            compilerController.selectedSymbol = symbol;
                          });
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
                                style: const TextStyle(
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
    },);
  }
}
