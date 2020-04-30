import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String categoryName = '';
  String categoryDescription = '' ;
  String categoryImage = '';
  final DocumentReference reference;

  CategoryModel(this.reference,  {this.categoryName} );

  CategoryModel.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['description'] != null),
        assert(map['image'] != null),
        categoryName = map['name'],
        categoryDescription = map['description'],
        categoryImage = map['image'];

  CategoryModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

// Function to fetch all the documents
//  getCategories(String collectionName){
//    return Firestore.instance.collection(collectionName).snapshots();
//  }
}
