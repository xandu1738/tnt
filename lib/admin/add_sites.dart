import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tnt/widgets/custom_drawer.dart';
import 'package:tnt/widgets/custom_tff.dart';

import 'image_picker.dart';

class AddSitesForm extends StatefulWidget {
  const AddSitesForm({Key? key}) : super(key: key);

  @override
  AddSitesFormState createState() {
    return AddSitesFormState();
  }
}

class AddSitesFormState extends State<AddSitesForm> {
  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController charge = TextEditingController();
  TextEditingController description = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String imageFolderName = "";
    CollectionReference sites = FirebaseFirestore.instance.collection('sites');
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
                      "ADD TOUR SITES",
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
                        alertMessage: 'Enter location',
                        controller: location,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomNff(
                        text: 'Charge',
                        alertMessage: 'what is the Tax',
                        controller: charge,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTff(
                        text: 'Description',
                        alertMessage: 'Enter Description',
                        controller: description,
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
                              onPressed: () async{
                                if (_formKey.currentState!.validate()) {
                                  await sites.add(
                                    {
                                      'name': name.text,
                                      'location': location.text,
                                      'charge': charge.text,
                                      'description': description.text,
                                    },
                                  );
                                  setState(() {
                                    imageFolderName = name.text;
                                    _formKey.currentState!.reset();
                                  });
                                  // ignore: use_build_context_synchronously
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Data Saved"),
                                    ),
                                  );
                                }
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context)=> UploadPage(
                                      imageCategory: imageFolderName, collection: 'sites_images',
                                      ),
                                    ),
                                  );
                              },
                              
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  top: 15,
                                  bottom: 15,
                                  left: 60,
                                  right: 60,
                                ),
                                child: Text('ADD IMAGE'),
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
                                  await sites.add(
                                    {
                                      'name': name.text,
                                      'location': location.text,
                                      'charge': charge.text,
                                      'description': description.text,
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
                        
                        const SizedBox(width: 20,),
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

