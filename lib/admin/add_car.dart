import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tnt/widgets/custom_drawer.dart';
import 'package:tnt/widgets/custom_tff.dart';

import 'image_picker.dart';

class AddCarForm extends StatefulWidget {
  const AddCarForm({Key? key}) : super(key: key);

  @override
  AddCarFormState createState() {
    return AddCarFormState();
  }
}

class AddCarFormState extends State<AddCarForm> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController plate = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController charge = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String folder = "";
    CollectionReference cars = FirebaseFirestore.instance.collection('cars');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#0d0010"),
        // title: const Text("TourAndTravel"),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Text(
                "TNT",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      drawer: const AdminDrawer(),
      body: SizedBox(
        height: double.infinity,
        //color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "ADD CAR",
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 30,
                    left: 80,
                    right: 80,
                  ),
                  child: Column(
                    children: <Widget>[
                      CustomNff(
                        text: 'CAR ID',
                        alertMessage: 'Enter Car ID',
                        controller: id,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTff(
                        text: 'Brand Name',
                        alertMessage: 'Enter Driver Name',
                        controller: name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomNff(
                        text: 'Plate Number',
                        alertMessage: 'Enter number',
                        controller: plate,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTff(
                        text: 'Model',
                        alertMessage: 'Enter Car Model',
                        controller: model,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomNff(
                        text: 'Rates Per Hour',
                        alertMessage: 'Enter Charging Rates',
                        controller: charge,
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.redAccent),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await cars.doc(plate.text).set(
                                  {
                                    'id': id.text,
                                    'name': name.text,
                                    'plate': plate.text,
                                    'model': model.text,
                                    'charge': charge.text,
                                    'status': 'free',
                                  },
                                );
                                setState(() {
                                  folder = plate.text;
                                  _formKey.currentState!.reset();
                                });
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Data Saved"),
                                  ),

                                );
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context)=> UploadPage(
                                      imageCategory: folder, collection: 'car_image',
                                      ),
                                    ),
                                  );
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                                left: 60,
                                right: 60,
                              ),
                              child: Text('ADD IMAGES'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.redAccent),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await cars.doc(name.text).set(
                                  {
                                    'id': id.text,
                                    'name': name.text,
                                    'plate': plate.text,
                                    'model': model.text,
                                    'status':'available',
                                    'charge': charge.text,
                                  },
                                );
                                setState(() {
                                  _formKey.currentState!.reset();
                                });
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Data Saved"),
                                  ),

                                );
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(
                                top: 15,
                                bottom: 15,
                                left: 60,
                                right: 60,
                              ),
                              child: Text('SKIP TO SUBMIT'),
                            ),
                          ),
                        ),
                        ],
                      ),
                    ],
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
