import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../admin/admin_home.dart';
import 'home.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final user = FirebaseFirestore.instance.collection('users').get();

  String? inputData(){
    final User? user = auth.currentUser;
    final userUid = user!.uid;
    return userUid;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: user,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.hasError){
          return const Text('An Error has occurred');
        }else if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        }
          if(FirebaseFirestore.instance.collection('users').where('role', arrayContains: ['admin']) == true){
            return const AdminHomePage();
          }else {
            return const Home();
          }
        },
    );
  }
}
