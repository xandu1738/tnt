import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tnt/admin/add_image.dart';
import 'package:tnt/admin/bookings.dart';
import 'package:tnt/admin/reqs.dart';
import 'package:tnt/pages/comment_box.dart';
import '../admin/add_accommodation.dart';
import '../admin/add_car.dart';
import '../admin/add_driver.dart';
import '../admin/add_sites.dart';
import '../pages/home.dart';
import '../pages/rules.dart';
import '../screens/accommodtion.dart';
import '../screens/airport.dart';
import '../screens/cars.dart';
import '../screens/guides.dart';
import '../screens/places.dart';
import 'list_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DrawerHeader(
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 60,
                  child: Text("TNT", style: GoogleFonts.pacifico(fontSize: 20,),),
                ),
              ),
              //const SizedBox(height: 45,),
              CustomListTile(
                onClicked: () =>
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home(),),),
                leadingIcon: const Icon(Icons.home),
                labelText: const Text('HOME'),
              ),
              ExpansionTile(
                leading: const Icon(Icons.handyman, color: Colors.amber,),
                trailing: const Icon(
                  Icons.arrow_drop_down, color: Colors.amber,),
                title: const Text('SERVICES',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    decoration: TextDecoration.none,
                  ),
                ),
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.airplanemode_active, color: Colors.white,),
                    title: const Text('Airport Pickup',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => const Airport(),),);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.car_rental, color: Colors.white,),
                    title: const Text('Book a car',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => const Cars(),),);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person, color: Colors.white,),
                    title: const Text('Hire a guide',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => const Guides(),),);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.lens, color: Colors.white,),
                    title: const Text('Explore Places',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => Sites(),),);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.house_siding, color: Colors.white,),
                    title: const Text('Accommodation',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => const AccomodationScreen(),),);
                    },
                  ),
                ],
              ),
              CustomListTile(
                  leadingIcon: const Icon(Icons.approval),
                  labelText: const Text('TESTIMONIAL'),
                  onClicked: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const Comms(),),);
                  }
              ),
              CustomListTile(
                onClicked: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Rules(),),);
                },
                leadingIcon: const Icon(Icons.rule),
                labelText: const Text('T & Cs'),
              ),
              ExpansionTile(
                leading: const Icon(Icons.help, color: Colors.amber,),
                trailing: const Icon(
                  Icons.arrow_drop_down, color: Colors.amber,),
                title: const Text('HELP',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    decoration: TextDecoration.none,
                  ),
                ),
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.contact_mail, color: Colors.white,),
                    title: const Text('Contact us',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.question_answer, color: Colors.white,),
                    title: const Text('FAQs',
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdminDrawer extends StatelessWidget {
  const AdminDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DrawerHeader(
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 60,
                child: Text("TNT", style: GoogleFonts.pacifico(fontSize: 20,),),
              ),
            ),
            CustomListTile(
              onClicked: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddSitesForm(),),);
              },
              leadingIcon: const Icon(Icons.add_location),
              labelText: const Text('add sites'),
            ),
            CustomListTile(
              onClicked: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddDriverForm(),),);
              },
              leadingIcon: const Icon(Icons.person_add),
              labelText: const Text('add driver'),
            ),
            CustomListTile(
              onClicked: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddCarForm(),),);
              },
              leadingIcon: const Icon(Icons.car_rental),
              labelText: const Text('add cars'),
            ),
            CustomListTile(
              onClicked: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const AddAccommodationForm()),);
              },
              leadingIcon: const Icon(Icons.add_home),
              labelText: const Text('add accommodation'),
            ),
            CustomListTile(
              onClicked: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserRequests(),),);
              },
              leadingIcon: const Icon(Icons.book),
              labelText: const Text('bookings'),
            ),
            CustomListTile(
              onClicked: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const ImageLoader(),),);
              },
              leadingIcon: const Icon(Icons.image),
              labelText: const Text('pictures'),
            ),
          ],
        ),
      ),
    );
  }
}

