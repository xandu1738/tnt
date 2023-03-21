import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tnt/widgets/custom_drawer.dart';

class AdminHomePage extends StatelessWidget {
  const  AdminHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#0d0010"),
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
      drawer: const AdminDrawer(),
      body: const AdminHome(),
    );
  }
}

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: HexColor('#ffe4e1'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 700,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/admin-home.jpg",),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 80,
                        bottom: 80,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Column(
                            children: [
                              Text("A D M I N",
                                style: TextStyle(
                                  fontSize: 100,
                                  color: HexColor("#FFE4B5"),
                                ),
                              ),
                              Text("P A N E L",
                                style: TextStyle(
                                  fontSize: 100,
                                  color: HexColor("#FFE4B5"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
