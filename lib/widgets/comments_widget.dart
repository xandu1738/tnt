import 'package:flutter/material.dart';

class CommentsCard extends StatelessWidget {
  final Text userID;
  final Text comment;
  final Text time;
  const CommentsCard({
    Key? key,
    required this.userID,
    required this.comment,
    required this.time
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.green[200],
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.amber[300],
                      child: const Icon(Icons.person),
                    ),
                    const SizedBox(width: 20,),
                    userID
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.grey[100],
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: comment,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    time,
                    const SizedBox(width: 10,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
