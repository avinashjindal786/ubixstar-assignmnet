import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar_assignment/provider/home_provider.dart';

class ImportWidgets extends StatefulWidget {
  const ImportWidgets({super.key});

  @override
  State<ImportWidgets> createState() => _ImportWidgetsState();
}

class _ImportWidgetsState extends State<ImportWidgets> {
  bool text = false;
  bool image = false;
  bool button = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    text = homeProvider.testWidget;
    image = homeProvider.imageWidget;
    button = homeProvider.saveButton;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFd1f3e0),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.7,
              decoration: BoxDecoration(color: Color(0xFFd1f3e0).withOpacity(0.5), borderRadius: BorderRadius.circular(18)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 45,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                text = !text;
                              });
                              homeProvider.updateValue(text, image, button);
                            },
                            child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.1,
                                color: Colors.white,
                                padding: const EdgeInsets.all(6),
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: text ? Color(0xFF46bf60) : Colors.grey,
                                )),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.6,
                            color: Colors.grey.withOpacity(0.7),
                            child: const Center(
                                child: Text(
                              "Text Widget",
                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 45,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                image = !image;
                              });
                              homeProvider.updateValue(text, image, button);
                            },
                            child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.1,
                                color: Colors.white,
                                padding: const EdgeInsets.all(6),
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: image ? Color(0xFF46bf60) : Colors.grey,
                                )),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.6,
                            color: Colors.grey.withOpacity(0.7),
                            child: const Center(
                                child: Text(
                              "Image Widget",
                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 45,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                button = !button;
                              });
                              homeProvider.updateValue(text, image, button);
                            },
                            child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.1,
                                color: Colors.white,
                                padding: const EdgeInsets.all(6),
                                child: CircleAvatar(
                                  radius: 5,
                                  backgroundColor: button ? Color(0xFF46bf60) : Colors.grey,
                                )),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.6,
                            color: Colors.grey.withOpacity(0.7),
                            child: const Center(
                                child: Text(
                              "Button Widget",
                              style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
                            )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
          InkWell(
            onTap: () {
              Navigator.pop(context);
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
