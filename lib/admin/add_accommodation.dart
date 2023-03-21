import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tnt/widgets/custom_drawer.dart';
import 'package:tnt/widgets/custom_tff.dart';

import 'image_picker.dart';

class AddAccommodationForm extends StatefulWidget {
  const AddAccommodationForm({Key? key}) : super(key: key);
  // const AddAccommodationForm({super.key});

  @override
  AddAccommodationFormState createState() {
    return AddAccommodationFormState();
  }
}

class AddAccommodationFormState extends State<AddAccommodationForm> {
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController charge = TextEditingController();
  TextEditingController status = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _drop = 'choose';
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Lodge", child: Text("Lodge")),
      const DropdownMenuItem(value: "Motel", child: Text("Motel")),
      const DropdownMenuItem(value: "Hotel", child: Text("Hotel")),
      const DropdownMenuItem(value: "Apartment", child: Text("Apartment")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    String folder = "";
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
      body: Container(
        height: double.infinity,
        color: Colors.grey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "ADD ACCOMMODATION",
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
                      CustomTff(
                        text: 'Name',
                        alertMessage: 'Enter Name',
                        controller: name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTff(
                        text: 'Location',
                        alertMessage: 'Enter Location',
                        controller: location,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // const SizedBox(height: 20,),
                      DropdownButtonFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          labelText: 'Select Accommodation type',
                          fillColor: Colors.grey,
                        ),
                        items: dropdownItems,
                        onChanged: (String? value) {
                          setState(() {
                            _drop = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomNff(
                        text: 'Charge',
                        alertMessage: 'what is the charge per night',
                        controller: charge,
                      ),

                      const SizedBox(
                        height: 20,
                      ),
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
                                  await FirebaseFirestore.instance
                                      .collection('accommodation')
                                      .doc(name.text)
                                      .set({
                                    'name': name.text,
                                    'location': location.text,
                                    'type': _drop,
                                    'status': 'available',
                                    'charge': charge.text,
                                  });

                                  // await accommodation.add(
                                  //   {
                                  //     'name': name.text,
                                  //     'location': location.text,
                                  //     'type': _drop,
                                  //     'status': 'available',
                                  //     'charge': charge.text,
                                  //   },
                                  // );
                                  setState(() {
                                    folder = name.text;
                                    _formKey.currentState!.reset();
                                  });
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Data Saved"),
                                    ),
                                  );
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => UploadPage(
                                        imageCategory: folder, collection: 'acco_images',
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
                                  await FirebaseFirestore.instance
                                      .collection('accommodation')
                                      .doc(name.text)
                                      .set({
                                    'name': name.text,
                                    'location': location.text,
                                    'type': _drop,
                                    'status': 'available',
                                    'charge': charge.text,
                                  });
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
