import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar_assignment/import_widgets.dart';
import 'package:ubixstar_assignment/provider/home_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CollectionReference status = FirebaseFirestore.instance.collection('status');

  Future<void> addWidgetStatus(bool textVal, bool imageVal) {
    // Call the user's CollectionReference to add a new user
    return status
        .add({
          'Test-widget': textVal, // John Doe
          'image-image': imageVal, // Stokes and Sons
        })
        .then((value) => print("Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Text(
            "Assignment App",
            style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height * 0.7,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            decoration: BoxDecoration(color: Color(0xFFd1f3e0).withOpacity(0.5), borderRadius: BorderRadius.circular(18)),
            child: Center(
                child: homeProvider.imageWidget || homeProvider.testWidget || homeProvider.saveButton
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          homeProvider.imageWidget || homeProvider.testWidget
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    homeProvider.testWidget
                                        ? Container(
                                            height: MediaQuery.sizeOf(context).height * 0.06,
                                            width: MediaQuery.sizeOf(context).width,
                                            color: Colors.grey,
                                            child: const Center(
                                              child: Text(
                                                "Enter Text",
                                                style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w700),
                                              ),
                                            ),
                                          )
                                        : SizedBox(),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    homeProvider.imageWidget
                                        ? Container(
                                            height: MediaQuery.sizeOf(context).height * 0.3,
                                            width: MediaQuery.sizeOf(context).width,
                                            color: Colors.grey,
                                            child: const Center(
                                              child: Text(
                                                "Upload Image",
                                                style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w700),
                                              ),
                                            ),
                                          )
                                        : SizedBox(),
                                  ],
                                )
                              : const Center(
                                  child: Text(
                                    "Add at-least a widget to save",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w700),
                                  ),
                                ),
                          InkWell(
                            onTap: () async {
                              if (homeProvider.imageWidget || homeProvider.testWidget) {
                                await addWidgetStatus(homeProvider.testWidget, homeProvider.imageWidget);
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("Succeesfully Saved"),
                                ));
                              }
                            },
                            child: Container(
                              width: 80,
                              height: 50,
                              decoration: BoxDecoration(color: Color(0xFF46bf60).withOpacity(0.5), border: Border.all(color: Colors.black, width: 2)),
                              child: const Center(
                                  child: Text(
                                "Save",
                                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
                              )),
                            ),
                          )
                        ],
                      )
                    : const Text(
                        "No widget is added",
                        style: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w700),
                      )),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ImportWidgets()));
            },
            child: Container(
              width: 180,
              height: 50,
              decoration: BoxDecoration(color: Color(0xFF46bf60).withOpacity(0.5), borderRadius: BorderRadius.circular(30), border: Border.all(color: Colors.black, width: 2)),
              child: const Center(
                  child: Text(
                "Add Widget",
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
              )),
            ),
          )
        ]),
      ),
    ));
  }
}
