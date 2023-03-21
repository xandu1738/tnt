import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../widgets/comments_widget.dart';
import '../widgets/custom_drawer.dart';

class Comms extends StatefulWidget {
  const Comms({Key? key}) : super(key: key);

  @override
  _CommsState createState() => _CommsState();
}

class _CommsState extends State<Comms> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  String? inputData(){
    final User? user = auth.currentUser;
    final email = user!.email;
    return email;
  }

  Widget commentChild(data) {
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: Card(
              elevation: 1,
              child: ListTile(
                leading: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                          Radius.circular(50),
                      ),
                  ),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(data[i]['pic'] + "$i")),
                ),
                title: Text(
                  data[i]['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(data[i]['message']),
              ),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> comment = FirebaseFirestore.instance.collection('comments').snapshots();
    CollectionReference comments = FirebaseFirestore.instance.collection('comments');
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
              },
                icon: const Icon(
                  Icons.exit_to_app, color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CommentBox(
          userImage:
          "https://cdn-icons.flaticon.com/png/512/552/premium/552721.png?token=exp=1655234403~hmac=415bd655754fb5ac0c4e06a9981ff62f",
          labelText: 'Type your comment...',
          withBorder: false,
          errorText: 'Please type something',
          sendButtonMethod: () async {
            if (formKey.currentState!.validate()) {
              print(commentController.text);
              await comments.add(
                {'userID': inputData(), 'comment': commentController.text, 'time': DateTime.now(),},
              );

              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Could not load comments'),),
              );
              // print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.grey[400],
          textColor: Colors.white,
          sendWidget: const Icon(Icons.send_sharp, size: 30, color: Colors.white),
          child: Container(
            color: HexColor('#bffe4e1'),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  StreamBuilder<QuerySnapshot>(
                    stream: comment,
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                      if(snapshot.hasError){
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Center(child: Text('Error fetching comments')),
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
                      return SingleChildScrollView(
                        child: ListView.builder(
                            padding: const EdgeInsets.all(40),
                            shrinkWrap: true,
                            itemCount: data.size,
                            itemBuilder: (context, index){
                              return CommentsCard(
                                userID: Text(
                                  "${data.docs[index]['userID']}",
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),

                                ),
                                comment: Text(
                                  "${data.docs[index]['comment']}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                ),
                                time: Text(
                                  "${data.docs[index]['time'].toDate()}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10,
                                  ),

                                ),
                              );
                            }
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}