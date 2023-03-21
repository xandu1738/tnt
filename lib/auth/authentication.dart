import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tnt/auth/login.dart';
import 'package:tnt/auth/signup.dart';
class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor("#092509"),
            bottom: TabBar(
              mouseCursor: MouseCursor.defer,
              indicatorColor: Colors.amber,
              indicatorWeight: 10,
                tabs: [
                  Text('Signup',style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),),
                  Text('Login',style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),),
                ],
            ),
          ),
          body: const TabBarView(
            children: [
              Signup(),
              Login(),
            ],
          ),
        ),
    );
  }
}
