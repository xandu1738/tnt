import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../widgets/custom_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width,
        screenHeight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 700) {
            return smallScreenDisplay(screenWidth, screenHeight);
          } else if(constraints.maxWidth > 700 && constraints.maxWidth < 1000){
            return mediumScreenDisplay(screenWidth, screenHeight);
          }
          else {
            return biggerScreenDisplay(screenWidth, screenHeight);
          }
        });
  }
}

smallScreenDisplay(screenWidth, screenHeight){
  return SafeArea(
    child: Scaffold(
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
              },
                icon: const Icon(Icons.exit_to_app, color: Colors.redAccent,),
              ),
            ],
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  height: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/home-alt.jpg",),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text("TRAVEL & TOUR",
                            style: TextStyle(
                              fontSize: 40,
                              color: HexColor("#FFE4B5"),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  color: Colors.grey[200],
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset("assets/images/culture.jpg",
                          fit: BoxFit.fill,
                          width: 400,
                          height: 400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('C U L T U R E',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),

                            SizedBox(
                              width: 400,
                              child: Text('The Culture of Africa is varied and manifold, consisting of a mixture of countries with various tribes that each have their unique characteristic from the continent of Africa. It is a product of the diverse populations that inhabit the continent of Africa and the African Diaspora. Generally, Culture can be defined as a collective mass of distinctive qualities belonging to a certain group of people. These qualities include laws, morals, beliefs, knowledge, art, customs, and any other attributes belonging to a member of that society.',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.grey[200],
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset("assets/images/explore.jpg",
                        fit: BoxFit.fill,
                        width: 400,
                        height: 400,
                      ),
                    ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('N A T U R E',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),

                            SizedBox(
                              width: 400,
                              child: Text('The majority of the continent and its countries are in the Northern Hemisphere, with a substantial portion and number of countries in the Southern Hemisphere. Most of the continent lies in the tropics, except for a large part of Western Sahara, Algeria, Libya and Egypt, the northern tip of Mauritania, the entire territories of Morocco, Ceuta, Melilla, and Tunisia which in turn are located above the tropic of Cancer, in the northern temperate zone.',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.grey[200],
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset("assets/images/wildlife.jpg",
                          fit: BoxFit.fill,
                          width: 400,
                          height: 400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('W I L D L I F E',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),

                            SizedBox(
                              width: 400,
                              child: Text('Wildlife was also synonymous to game: those birds and mammals that were hunted for sport. Wildlife can be found in all ecosystems. Deserts, forests, rainforests, plains, grasslands, and other areas, including the most developed urban areas, all have distinct forms of wildlife. While the term in popular culture usually refers to animals that are untouched by human factors, most scientists agree that much wildlife is affected by human activities',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.blue,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text("About us"),
                        Text("FAQs"),
                        Text("Contact us"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text("Support us"),
                        Text("Make Donation"),
                        Text("Subscribe to Newsletter"),
                        Text("Suggest Something"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){}, icon: const Icon(Icons.facebook,),),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.call,),),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.telegram,),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

mediumScreenDisplay(screenWidth, screenHeight){
  return SafeArea(
    child: Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  height: 600,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/home-alt.jpg",),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      bottom: 30,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text("T  R  A  V  E  L",
                            style: TextStyle(
                              fontSize: 100,
                              color: HexColor("#FFE4B5"),
                            ),
                          ),
                          Text("&",
                            style: TextStyle(
                              fontSize: 100,
                              color: HexColor("#FFE4B5"),
                            ),
                          ),
                          Text("T  O  U  R",
                            style: TextStyle(
                              fontSize: 100,
                              color: HexColor("#FFE4B5"),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  color: Colors.grey[200],
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset("assets/images/culture.jpg",
                          fit: BoxFit.fill,
                          width: 400,
                          height: 400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('C U L T U R E',
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),

                            SizedBox(
                              width: 00,
                              child: Text('The Culture of Africa is varied and manifold, consisting of a mixture of countries with various tribes that each have their unique characteristic from the continent of Africa. It is a product of the diverse populations that inhabit the continent of Africa and the African Diaspora. Generally, Culture can be defined as a collective mass of distinctive qualities belonging to a certain group of people. These qualities include laws, morals, beliefs, knowledge, art, customs, and any other attributes belonging to a member of that society.',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.grey[200],
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('N A T U R E',
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),

                            SizedBox(
                              width: 900,
                              child: Text('The majority of the continent and its countries are in the Northern Hemisphere, with a substantial portion and number of countries in the Southern Hemisphere. Most of the continent lies in the tropics, except for a large part of Western Sahara, Algeria, Libya and Egypt, the northern tip of Mauritania, the entire territories of Morocco, Ceuta, Melilla, and Tunisia which in turn are located above the tropic of Cancer, in the northern temperate zone.',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset("assets/images/explore.jpg",
                          fit: BoxFit.fill,
                          width: 500,
                          height: 500,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.grey[200],
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset("assets/images/wildlife.jpg",
                          fit: BoxFit.fill,
                          width: 500,
                          height: 500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('W I L D L I F E',
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),

                            SizedBox(
                              width: 900,
                              child: Text('Wildlife was also synonymous to game: those birds and mammals that were hunted for sport. Wildlife can be found in all ecosystems. Deserts, forests, rainforests, plains, grasslands, and other areas, including the most developed urban areas, all have distinct forms of wildlife. While the term in popular culture usually refers to animals that are untouched by human factors, most scientists agree that much wildlife is affected by human activities',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.blue,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("About us"),
                        Text("FAQs"),
                        Text("Contact us"),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Support us"),
                      Text("Make Donation"),
                      Text("Subscribe to Newsletter"),
                      Text("Suggest Something"),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          IconButton(onPressed: (){}, icon: const Icon(Icons.facebook,),),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.call,),),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.telegram,),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

biggerScreenDisplay(screenWidth, screenHeight){
  return SafeArea(
    child: Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              fit: StackFit.loose,
              children: [
                Container(
                  height: 600,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/home-alt.jpg",),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      bottom: 30,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Text("T  R  A  V  E  L",
                            style: TextStyle(
                              fontSize: 100,
                              color: HexColor("#FFE4B5"),
                            ),
                          ),
                          Text("&",
                            style: TextStyle(
                              fontSize: 100,
                              color: HexColor("#FFE4B5"),
                            ),
                          ),
                          Text("T  O  U  R",
                            style: TextStyle(
                              fontSize: 100,
                              color: HexColor("#FFE4B5"),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  color: Colors.grey[200],
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset("assets/images/culture.jpg",
                          fit: BoxFit.fill,
                          width: 400,
                          height: 400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('C U L T U R E',
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),

                            SizedBox(
                              width: 400,
                              child: Text('The Culture of Africa is varied and manifold, consisting of a mixture of countries with various tribes that each have their unique characteristic from the continent of Africa. It is a product of the diverse populations that inhabit the continent of Africa and the African Diaspora. Generally, Culture can be defined as a collective mass of distinctive qualities belonging to a certain group of people. These qualities include laws, morals, beliefs, knowledge, art, customs, and any other attributes belonging to a member of that society.',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.grey[200],
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('N A T U R E',
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),

                            SizedBox(
                              width: 400,
                              child: Text('The majority of the continent and its countries are in the Northern Hemisphere, with a substantial portion and number of countries in the Southern Hemisphere. Most of the continent lies in the tropics, except for a large part of Western Sahara, Algeria, Libya and Egypt, the northern tip of Mauritania, the entire territories of Morocco, Ceuta, Melilla, and Tunisia which in turn are located above the tropic of Cancer, in the northern temperate zone.',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset("assets/images/explore.jpg",
                          fit: BoxFit.fill,
                          width: 400,
                          height: 400,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  color: Colors.grey[200],
                  margin: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset("assets/images/wildlife.jpg",
                          fit: BoxFit.fill,
                          width: 400,
                          height: 400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text('W I L D L I F E',
                              style: TextStyle(
                                fontSize: 60,
                              ),
                            ),

                            SizedBox(
                              width: 400,
                              child: Text('Wildlife was also synonymous to game: those birds and mammals that were hunted for sport. Wildlife can be found in all ecosystems. Deserts, forests, rainforests, plains, grasslands, and other areas, including the most developed urban areas, all have distinct forms of wildlife. While the term in popular culture usually refers to animals that are untouched by human factors, most scientists agree that much wildlife is affected by human activities',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.blue,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text("About us",style: TextStyle(color: Colors.black),),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("FAQs",style: TextStyle(color: Colors.black),),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Contact us",style: TextStyle(color: Colors.black),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text("Support us",style: TextStyle(color: Colors.black),),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Make Donation",style: TextStyle(color: Colors.black),),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Subscribe to Newsletter",style: TextStyle(color: Colors.black),),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Make suggestion",style: TextStyle(color: Colors.black),),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.facebook,),
                                TextButton(onPressed: (){}, child: TextButton(
                                  onPressed: () {},
                                  child: const Text("Facebook",style: TextStyle(color: Colors.black),),
                                ),),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.telegram,),
                                TextButton(onPressed: (){}, child: TextButton(
                                  onPressed: () {},
                                  child: const Text("Telegram",style: TextStyle(color: Colors.black),),
                                ),),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.call,),
                                TextButton(onPressed: (){}, child: TextButton(
                                  onPressed: () {},
                                  child: const Text("Make call",style: TextStyle(color: Colors.black),),
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
