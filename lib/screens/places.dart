import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tnt/widgets/custom_drawer.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Sites extends StatelessWidget {
  final Stream<QuerySnapshot> allSites =
      FirebaseFirestore.instance.collection('sites').snapshots();
  Sites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#092509"),
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
        color: HexColor('#ffe4e1'),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'TOUR SITES',
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.none,
                  fontSize: 50,
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: allSites,
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
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(40),
                      shrinkWrap: true,
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          color: Colors.grey[200],
                          margin: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Image.asset(
                                  "assets/images/culture.jpg",
                                  fit: BoxFit.fill,
                                  width: 300,
                                  height: 300,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${data.docs[index]['name']}',
                                      style: const TextStyle(
                                        fontSize: 60,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 400,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            width: 40,
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'Description: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                child: Text(
                                                  '${data.docs[index]['description']}',
                                                  style: const TextStyle(
                                                    color: Colors.grey,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 30,
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                'Charge: ',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                '${data.docs[index]['charge']}',
                                                style: const TextStyle(
                                                  color: Colors.grey,
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
