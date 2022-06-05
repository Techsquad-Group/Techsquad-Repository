import 'package:cloud_firestore/cloud_firestore.dart';

class HomeServices {
  final CollectionReference _categoryCollectionReference =
      FirebaseFirestore.instance.collection("Categories");

  final CollectionReference _productCollectionReference =
      FirebaseFirestore.instance.collection("Products");

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionReference.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await _productCollectionReference.get();
    return value.docs;
  }
}