import 'package:demo/common/app_string.dart';
import 'package:demo/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/home_screen_controllerr.dart';
import 'compiler/complier_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeScreenController>(context, listen: false).categoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenController>(
        builder: (context, homeScreenController, child) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              leading: null,
              backgroundColor: bottomBarColor,
              title: const Text("Multi Language Code Compiler")),
          backgroundColor: homeScreenBackgroundColor,
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
            ),
            padding: const EdgeInsets.all(16.0),
            itemCount: homeScreenController.getCourses?.course?.length,
            // itemCount: languageName.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CompilerScreen(),
                      ));
                },
                child: Card(
                  color: bottomBarColor,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Image.network(
                            "${AppStrings.imageUrl}${homeScreenController.getCourses?.course![index].image}",
                            height: 80,
                            width: 80,
                          ), /* child: Image.asset(
                            languageImage[index] ?? "assets/images/pngwing.com",
                            height: 80,
                            width: 80,
                          ),*/
                        ),
                      ),
                      Expanded(
                        child: Text(
                          homeScreenController
                                  .getCourses?.course![index].courseName ??
                              "C++",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ), /*child: Text(
                          languageName[index].toUpperCase() ?? "C++",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),*/
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
