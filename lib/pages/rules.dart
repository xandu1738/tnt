import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Rules extends StatelessWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Container(
        color: HexColor('#ffe4e1'),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "TERMS & CONDITIONS",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 223, 168, 186),
              elevation: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 480,
                      child: Text(
                        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo vitae sint autem debitis inventore, dolores aspernatur magni similique cupiditate placeat aut fugiat doloribus dolorum, reiciendis repellendus sequi consequuntur, aliquam consectetur soluta accusantium dicta iusto numquam nihil labore. Voluptatem, architecto pariatur iure quae consequuntur ab doloremque ipsa tempora exercitationem explicabo deleniti",
                        style: TextStyle(
                          color: Color.fromARGB(255, 40, 126, 255),
                          fontSize: 15,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
