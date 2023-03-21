import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tnt/admin/bookings.dart';
import 'package:tnt/admin/car_requests.dart';
import 'package:tnt/admin/guard_requests.dart';

class UserRequests extends StatelessWidget {
  const UserRequests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor("#092509"),
            bottom: TabBar(
              mouseCursor: MouseCursor.defer,
              indicatorColor: Colors.amber,
              indicatorWeight: 10,
                tabs: [
                  Text('Accommodations',style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),),
                  Text('Cars',style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),),
                  Text('Guards',style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),),
                ],
            ),
          ),
          body: const TabBarView(
            children: [
              Bookings(),
              BookCar(),
              BookGuard(),
            ],
          ),
        ),
    );
  }
}
