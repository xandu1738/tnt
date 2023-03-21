// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:tnt/widgets/custom_drawer.dart';
// import 'package:tnt/widgets/custom_tff.dart';

// class AddCarForm extends StatefulWidget {
//   const AddCarForm({Key? key}) : super(key: key);

//   @override
//   AddCarFormState createState() {
//     return AddCarFormState();
//   }
// }

// class AddCarFormState extends State<AddCarForm> {
//   TextEditingController id = TextEditingController();
//   TextEditingController name = TextEditingController();
//   TextEditingController plate = TextEditingController();
//   TextEditingController model = TextEditingController();
//   TextEditingController charge = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     // String folder = "";
//     // CollectionReference cars = FirebaseFirestore.instance.collection('cars');
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("#092509"),
//         // title: const Text("TourAndTravel"),
//         actions: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               const Text('signout'),
//               IconButton(onPressed: () async {
//                 await FirebaseAuth.instance.signOut();
//               }, icon: const Icon(Icons.exit_to_app, color: Colors.redAccent,),),
//             ],
//           ),
//         ],
//       ),
//       drawer: const AdminDrawer(),
//       body: Container(
//         height: double.infinity,
//         color: Colors.black,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 50, left: 50),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: const [
//                     Text(
//                       "BOOK ACCOMMODATION",
//                       style: TextStyle(
//                         fontSize: 60,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Form(
//                 key: _formKey,
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                     top: 10,
//                     bottom: 30,
//                     left: 80,
//                     right: 80,
//                   ),
//                   child: Column(
//                     children: <Widget>[
//                       CustomNff(
//                         text: 'CAR ID',
//                         alertMessage: 'Enter Car ID',
//                         controller: id,
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       CustomTff(
//                         text: 'Brand Name',
//                         alertMessage: 'Enter Driver Name',
//                         controller: name,
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       CustomNff(
//                         text: 'Plate Number',
//                         alertMessage: 'Enter number',
//                         controller: plate,
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       CustomTff(
//                         text: 'Model',
//                         alertMessage: 'Enter Car Model',
//                         controller: model,
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       CustomNff(
//                         text: 'Rates Per Hour',
//                         alertMessage: 'Enter Charging Rates',
//                         controller: charge,
//                       ),
//                       SizedBox(height: 20,),
//                       Row(
//                         children: [
//                         Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: ElevatedButton(
//                             style: ButtonStyle(
//                               backgroundColor:
//                                   MaterialStateProperty.all(Colors.redAccent),
//                             ),
//                             onPressed: () async {
//                               if (_formKey.currentState!.validate()) {
//                                 // await cars.add(
//                                 //   {
//                                 //     'id': id.text,
//                                 //     'name': name.text,
//                                 //     'plate': plate.text,
//                                 //     'model': model.text,
//                                 //     'charge': charge.text,
//                                 //   },
//                                 // );
//                                 setState(() {
//                                   _formKey.currentState!.reset();
//                                 });
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text("Data Saved"),
//                                   ),

//                                 );
//                               }
//                             },
//                             child: const Padding(
//                               padding: EdgeInsets.only(
//                                 top: 15,
//                                 bottom: 15,
//                                 left: 60,
//                                 right: 60,
//                               ),
//                               child: Text('SKIP TO SUBMIT'),
//                             ),
//                           ),
//                         ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
