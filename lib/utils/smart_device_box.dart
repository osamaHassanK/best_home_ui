
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  String smartDeviceName;
  IconData iconPath;
  final bool  powerOn;
  void Function(bool)? onChanged;
   SmartDeviceBox({super.key, required this.smartDeviceName,required this.iconPath,required this.powerOn,required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: powerOn ? Colors.deepPurple : Colors.white60,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(iconPath,size:50),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(smartDeviceName, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: powerOn ? Colors.white : Colors.black,
                ),),
              ),
            ),
                  Transform.rotate(
                    angle:pi /2,
                    child: CupertinoSwitch(value:powerOn, onChanged:onChanged
                    ),
                  ),]),

          ],
        ),
      ),
    );
  }
}
