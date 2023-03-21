import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tnt/widgets/custom_drawer.dart';

class Airport extends StatelessWidget {
  const Airport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#092509"),
        // title: const Text("TourAndTravel"),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('signout'),
              IconButton(onPressed: () async {
                await FirebaseAuth.instance.signOut();
              }, icon: const Icon(Icons.exit_to_app, color: Colors.redAccent,),),
            ],
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: HexColor('#ffe4e1'),
        child: const Icon(Icons.airplanemode_active, size: 150,),
      ),
    );
  }
}
