import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../widgets/custom_drawer.dart';

class Bookings extends StatefulWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> bookings =
        FirebaseFirestore.instance.collection('requests').snapshots();

    return Scaffold(
      drawer: const AdminDrawer(),
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
                      width: 450,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(40),
                        shrinkWrap: true,
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 3,
                            semanticContainer: true,
                            color: Colors.grey[200],
                            child: ListTile(
                              leading: const Icon(
                                Icons.circle,
                                color: Colors.blue,
                              ),
                              title: Row(
                                children: [
                                  Text(
                                    '${data.docs[index]['check-in']}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.none,
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '${data.docs[index]['service']}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.none,
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '${data.docs[index]['name']}',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.none,
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    '${data.docs[index]['user']} ',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.none,
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      FirebaseFirestore.instance.collection('accommodation').doc('${data.docs[index]['name'][0].toString()}').update({'status':'booked'});
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(2.0),
                                      child: Text('check'),
                                    ),
                                  ),
                                ],
                              ),
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
