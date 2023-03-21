import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tnt/widgets/custom_drawer.dart';

class ImageLoader extends StatefulWidget {
  const ImageLoader({Key? key}) : super(key: key);

  @override
  State<ImageLoader> createState() => ImageLoaderState();
}

class ImageLoaderState extends State<ImageLoader> {
  final Stream<QuerySnapshot> bookings =
      FirebaseFirestore.instance.collection('acco_images').snapshots();
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
                IconButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      drawer: const CustomDrawer(),
      body: Container(
        color: HexColor('#bffe4e1'),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: bookings,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(child: Text('Something went wrong')),
                      ],
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    );
                  }
                  final data = snapshot.requireData;
                  return SingleChildScrollView(
                    child: SizedBox(
                      //width: 450,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 3 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        padding: const EdgeInsets.all(40),
                        shrinkWrap: true,
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 160,
                            width: 160,
                            child: Image.network(
                              '${data.docs[index]['url'][0].toString()}',
                              height: 150,
                              width: 150,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
