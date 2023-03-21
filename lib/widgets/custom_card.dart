import 'package:flutter/material.dart';
class CustomCard extends StatelessWidget {
  final AssetImage image;
  final Text title;
  final Text subtitle;
  const CustomCard({Key? key,
    required this.image,
    required this.title,
    required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: Colors.grey,
                child: Image(
                  image: image,
                  height: 250,
                  fit: BoxFit.fill,
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 150.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title,
                      subtitle,
                    ],
                  ),
                ),
              )
            ],
          ),
          GestureDetector(
            child: Container(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("BROWSE NOW"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
