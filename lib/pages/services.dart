import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tnt/widgets/custom_card.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor('#ffe4e1'),
      child: SingleChildScrollView(
        child: Container(
          color: HexColor("FED8B1"),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text("S E R V I C E S",
                    style: TextStyle(
                     color: Colors.grey,
                      decoration: TextDecoration.none,
                      fontSize: 80,
                       ),
                  ),
                ),
              ],
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CustomCard(
                      image: AssetImage("assets/images/airport-pu.jpg"),
                      title: Text("AIRPORT PICKUP",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),
                      ),
                      subtitle: Text("& DROP OFF",
                        style: TextStyle(color: Colors.white54,
                            fontSize: 15
                        ),
                      ),
                    ),
                    CustomCard(
                      image: AssetImage("assets/images/book.jpg"),
                      title: Text("BOOK A CAR",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),
                      ),
                      subtitle: Text("FAMILIAR TERRITORY",
                        style: TextStyle(color: Colors.white54,
                            fontSize: 15
                        ),
                      ),
                    ),
                    CustomCard(
                      image: AssetImage("assets/images/guide.jpg"),
                      title: Text("HIRE A GUIDE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),
                      ),
                      subtitle: Text("BE YOUR OWN DRIVER",
                        style: TextStyle(color: Colors.white54,
                            fontSize: 15
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CustomCard(
                      image: AssetImage("assets/images/explore.jpg"),
                      title: Text("EXPLORE PLACES",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),
                      ),
                      subtitle: Text("DISCOVER TOUR SITES",
                        style: TextStyle(color: Colors.white54,
                            fontSize: 15
                        ),
                      ),
                    ),
                    CustomCard(
                      image: AssetImage("assets/images/accomodation.jpg"),
                      title: Text("ACCOMMODATION",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),
                      ),
                      subtitle: Text("HOME AWAY FROM HOME",
                        style: TextStyle(color: Colors.white54,
                            fontSize: 15
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
