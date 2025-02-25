import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'src.dart';

class BatteryState extends StatefulWidget {
  const BatteryState({super.key});
  @override
  State<StatefulWidget> createState() => _BatteryStateState();
}

class _BatteryStateState extends State<BatteryState> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        child: ClipRect(
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Color(0x565B5B5B),
                      borderRadius: BorderRadius.circular(30)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "State",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              ActiveStates()
                            ]),
                        CupertinoButton(
                          color: Colors.white,
                          padding: EdgeInsets.all(3),
                          onPressed: () {},
                          child: Text("Reset",
                              style:
                                  TextStyle(fontSize: 11, color: Colors.black)),
                        )
                      ]),
                ))));
  }
}

class ActiveStates extends StatefulWidget {
  const ActiveStates({super.key});

  @override
  State<StatefulWidget> createState() => _ActiveStatesState();
}

class _ActiveStatesState extends State<ActiveStates> {
  List<Widget> states = [];
  Widget generateStateElement(String title, String description) {
    Color color = Colors.orange;
    if (title == "SCP") {
      color = Colors.red;
    }
    if (description.length > 35) {
      var position = description.indexOf(" ", 23).clamp(0, description.length);
      description = description.replaceFirst(" ", "\n", position);
    }

    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("$title :",
          style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      Padding(padding: EdgeInsets.only(left: 5)),
      Text(
        description,
        style: TextStyle(fontSize: 12, color: Colors.white),
        overflow: TextOverflow.visible,
        softWrap: true,
      )
    ]);
  }

  @override
  void initState() {
    // TODO: implement initState

    states.add(generateStateElement("COBU", "Charge turned off by user"));
    states.add(
        generateStateElement("CLVP", "Cell low voltage protection (2.5V)"));
    states.add(generateStateElement("SCP", "Short circuit protection (1100A)"));
    states.add(generateStateElement(
        "CUTP", "Charge under temperature protection (O C)"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: states);
  }
}
