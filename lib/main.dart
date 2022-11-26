import 'dart:ffi';

import 'package:best_home_ui/utils/smart_device_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalpadding=49;
  final double verticalpadding=25;
   List smartDevices =[
     ["Smart Light",Icons.lightbulb,true],
     ["Smart AC",Icons.ac_unit,true],
     ["Smart TV",Icons.tv,false],
     ["Smart Fan",Icons.threesixty_outlined,false],
  ];
   void powerSwitchChange(bool value,int index){
   setState(() {
      smartDevices[index][2]=value;
   });
   }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: horizontalpadding,
                vertical: verticalpadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                      size: 45,
                      Icons.dashboard_sharp),Icon(
                      size: 45,
                      Icons.home_filled),],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: verticalpadding,
                horizontal: horizontalpadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome Home",style: GoogleFonts.atma(fontSize: 25,fontWeight: FontWeight.w500)),
                  Text("Flutter with Osama",style: GoogleFonts.bebasNeue(fontSize: 50),
                  ),
                  SizedBox(height: 10,),
                  Text("Smart Devices",style: GoogleFonts.atma(fontSize: 25,fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: smartDevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,childAspectRatio: 1/1.0),
                itemBuilder: (context,index)=> SmartDeviceBox(smartDeviceName: smartDevices[index][0],
                  iconPath:smartDevices[index][1], powerOn: smartDevices[index][2],onChanged:(value)=>powerSwitchChange(value,index)
                ),
              ),
            )
          ],
        )   ,
      ),
    );
  }
}
