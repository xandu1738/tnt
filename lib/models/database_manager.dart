import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager{
  final CollectionReference carsList = FirebaseFirestore.instance.collection('cars');

  // Future<void> createCarData(String id, String name, String model, String plate, int charge) async {
  //   return await carsList.doc(id).setData({
  //     'id':id,
  //     'name':name,
  //     'model':model,
  //     'plate':plate,
  //     'charge':charge,
  //   });
  //}
  Future getCarsList() async{
    List itemsList = [];
    try{
      await carsList.get().then((querySnapshot){
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}