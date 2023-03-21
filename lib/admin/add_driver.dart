import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tnt/widgets/custom_drawer.dart';
import 'package:tnt/widgets/custom_tff.dart';

import 'image_picker.dart';

class AddDriverForm extends StatefulWidget {
  const AddDriverForm({Key? key}) : super(key: key);

  @override
  AddDriverFormState createState() {
    return AddDriverFormState();
  }
}

class AddDriverFormState extends State<AddDriverForm> {
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController xp = TextEditingController();
  TextEditingController location = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String folder ="";
    CollectionReference driver =
        FirebaseFirestore.instance.collection('driver');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#0d0010"),
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
                      "ADD DRIVER",
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
                        text: 'Driver ID',
                        alertMessage: 'Enter valid ID',
                        controller: id,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTff(
                        text: 'Driver Name',
                        alertMessage: 'Enter Driver Name',
                        controller: name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomNff(
                        text: 'Contact',
                        alertMessage: 'Enter your contact',
                        controller: contact,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTff(
                        text: 'Email',
                        alertMessage: 'Enter Valid',
                        controller: email,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTff(
                        text: 'Experience',
                        alertMessage: 'What is your Experience',
                        controller: xp,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTff(
                        text: 'Areas',
                        alertMessage: 'Enter maps Location url',
                        controller: location,
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
                                    await driver.add(
                                      {
                                        'id': id.text,
                                        'name': name.text,
                                        'contact': contact.text,
                                        'email': email.text,
                                        'Experience': xp.text,
                                        'Location': location.text,
                                      },
                                    );
                                    setState(() {
                                      folder=name.text;
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
                                      imageCategory: folder, collection: 'driver_image',
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
                                  child: Text('ADD PHOTO'),
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
                                    await driver.add(
                                      {
                                        'id': id.text,
                                        'name': name.text,
                                        'contact': contact.text,
                                        'email': email.text,
                                        'Experience': xp.text,
                                        'Location': location.text,
                                      },
                                    );
                                    setState(() {
                                      _formKey.currentState!.reset();
                                    });
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
