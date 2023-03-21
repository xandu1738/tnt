import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:oktoast/oktoast.dart';
import 'package:tnt/widgets/custom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'show-images/driver_images.dart';

class Guides extends StatefulWidget {
  
  const Guides({Key? key}) : super(key: key);

  @override
  
  GuidesState createState() => GuidesState();
}

class GuidesState extends State<Guides> {

  late String dateCount;
  late String range;

  final Stream<QuerySnapshot> driver = FirebaseFirestore.instance.collection('driver').snapshots();
  CollectionReference requests = FirebaseFirestore.instance.collection('guardreq');

  final FirebaseAuth auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  late DateTime time;

  String? inputData(){
    final User? user = auth.currentUser;
    final email = user!.email;
    return email;
  }

  @override
  void initState() {
    dateCount = '';
    range = '';
    super.initState();
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        range =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
                ' - ' +
                DateFormat('dd/MM/yyyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
      } else if (args.value is List<DateTime>) {
        dateCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width,
        screenheight = MediaQuery.of(context).size.height;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 780) {
        return displayLargeScreen(screenwidth, screenheight);
      } else {
        return displaySmallScreen(screenwidth, screenheight);
      }
    });
  }

  displaySmallScreen(screenWidth, screenHeight){
    return Scaffold(
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
      body: Container(
        color: HexColor('#ffe4e1'),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Driver',
                style: TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.none,
                  fontSize: 40,
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: driver,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.hasError){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(child: Text('Something went wrong')),
                      ],
                    );
                  }
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(child: CircularProgressIndicator(),),
                      ],
                    );
                  }
                  final data = snapshot.requireData;
                  return Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(40),
                        shrinkWrap: true,
                        itemCount: data.size,
                        itemBuilder: (context, index){
                          return Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    color: Colors.blue,
                                    width: 100,
                                    height: 100,
                                    child: const Icon(
                                      Icons.house_siding,
                                      size: 30,
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Text('ID: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              decoration: TextDecoration.none,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text('${data.docs[index]['id']}',
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              decoration: TextDecoration.none,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 60,),
                                      Row(
                                        children: [
                                          const Text('Name: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              decoration: TextDecoration.none,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text('${data.docs[index]['name']}',
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              decoration: TextDecoration.none,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 40,),
                                      Row(
                                        children: [
                                          const Text('email: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              decoration: TextDecoration.none,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text('${data.docs[index]['email']}',
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              decoration: TextDecoration.none,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 40,),
                                      Row(
                                        children: [
                                          const Text('Contact: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              decoration: TextDecoration.none,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text('${data.docs[index]['contact']} ',
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              decoration: TextDecoration.none,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 40,),
                                      Row(
                                        children: [
                                          const Text('Experience: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              decoration: TextDecoration.none,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text('${data.docs[index]['Experience']} ',
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              decoration: TextDecoration.none,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 40,),
                                      Row(
                                        children: [
                                          const Text('Location: ',
                                            style: TextStyle(
                                              color: Colors.black,
                                              decoration: TextDecoration.none,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Text('${data.docs[index]['Location']} ',
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              decoration: TextDecoration.none,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 40,),
                                        ElevatedButton(
                                        onPressed: () async{
                                          showDialog(
                                            context: context,
                                             builder: (context){
                                              return AlertDialog(                                                
                                                actions: [
                                                  TextButton(
                                                    onPressed: () async{
                                                    await requests.doc(data.docs[
                                                                            index]
                                                                        ['name']).set(
                                                      {
                                                        'name': {data.docs[index]['name'].toString()},
                                                        'service':'driver',
                                                        'date': time,
                                                        'user': inputData(),
                                                      },
                                                    );
                                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order Placed'),),);

                                                  }, 
                                                  child: const Text('submit'),),
                                                ], 
                                                title: const Text('Check in Date'), 
                                                content: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode.date,
                                                initialDateTime: DateTime(2022, 1, 1),
                                                onDateTimeChanged: (DateTime newDateTime) {
                                                  setState(() {
                                                    time = newDateTime;
                                                  });
                                                },
                                              ),
                                              );
                                            },
                                          );
                                        },
                                        child: const Text('BOOK'),
                                      ),
                                      ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                    ),
                  );
                },),
            ],
          ),
        ),
      ),
    );
  }

  displayLargeScreen(screenwidth, screenheight) {
    return OKToast(
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
        body: Container(
          color: HexColor('#ffe4e1'),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Driver',
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.none,
                    fontSize: 80,
                  ),
                ),
                StreamBuilder<QuerySnapshot>(
                  stream: driver,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(snapshot.hasError){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(child: Text('Something went wrong')),
                        ],
                      );
                    }
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(child: CircularProgressIndicator(),),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${data.docs[index]['name']}',
                                          style: const TextStyle(
                                            fontSize: 60,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 400,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  child: Row(
                                                    children: [
                                                      const Text(
                                                        'Email: ',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontSize: 30,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${data.docs[index]['email']}',
                                                        style: const TextStyle(
                                                          color: Colors.blue,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontSize: 30,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 60,
                                                ),
                                                Row(
                                                  children: [
                                                    const Text(
                                                      'Contact: ',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: 30,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${data.docs[index]['contact']}',
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: 30,
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
                                                      'Location: ',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: 30,
                                                      ),
                                                    ),
                                                    Text(
                                                      '${data.docs[index]['Location']}',
                                                      style: const TextStyle(
                                                        color: Colors.grey,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontSize: 30,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(
                                                  child: Row(
                                                    children: [
                                                      const Text(
                                                        'Experience: ',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontSize: 30,
                                                        ),
                                                      ),
                                                      Text(
                                                        '${data.docs[index]['Experience']}',
                                                        style: const TextStyle(
                                                          color: Colors.blue,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontSize: 30,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                // const SizedBox(
                                                //   height: 30,
                                                // ),
                                                Row(
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () async {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return AlertDialog(
                                                              actions: [
                                                                TextButton(
                                                                  onPressed:
                                                                      () async {
                                                                    await requests
                                                                        .doc(data.docs[index]
                                                                            ['name'])
                                                                        .set(
                                                                      {
                                                                        'name': {
                                                                          data.docs[
                                                                                  index]
                                                                              [
                                                                              'name']
                                                                        },
                                                                        'check-in':
                                                                            range,
                                                                        'service':
                                                                            'guides',
                                                                        'user':
                                                                            inputData(),
                                                                      },
                                                                    );
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      const SnackBar(
                                                                        content: Text(
                                                                            'Order Placed'),
                                                                      ),
                                                                    );
                                                                  },
                                                                  child: const Text(
                                                                      'submit'),
                                                                ),
                                                              ],
                                                              title: const Text(
                                                                  'Time Range'),
                                                              content: SizedBox(
                                                                width: double
                                                                    .maxFinite,
                                                                height: double
                                                                    .maxFinite,
                                                                child:
                                                                    SfDateRangePicker(
                                                                  onSelectionChanged:
                                                                      onSelectionChanged,
                                                                  selectionMode:
                                                                      DateRangePickerSelectionMode
                                                                          .range,
                                                                  initialSelectedRange:
                                                                      PickerDateRange(
                                                                    DateTime.now()
                                                                        .subtract(
                                                                      const Duration(
                                                                          days: 4),
                                                                    ),
                                                                    DateTime.now()
                                                                        .add(
                                                                      const Duration(
                                                                          days: 3),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text('BOOK'),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 30,),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ImageLoader(),),);
                                                      },
                                                      child: const Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text('IMAGES'),
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
                                ],
                              ),
                            );
                          }),
                    );
                  },),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
