// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:tnt/admin/image_picker.dart';
// import 'package:tnt/widgets/custom_drawer.dart';

// class AddSiteImageUI extends StatefulWidget {
//   const AddSiteImageUI({Key? key}) : super(key: key);

//   @override
//   State<AddSiteImageUI> createState() => _AddImageUIState();
// }

// class _AddImageUIState extends State<AddSiteImageUI> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: HexColor("#0d0010"),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.all(15.0),
//             child: Center(
//               child: Text(
//                 "TNT",
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//           ),
//         ],
//       ),
//       drawer: const AdminDrawer(),
//       body: const UploadPage(imageCategory: null,),
//     );
//   }
// }
