/***************************************
    Developed by Gunarathna PMSSB IT1618800
 ****************************************/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'News.dart';

//Code for this page was inspired by following tutorials
//https://www.youtube.com/watch?v=-blxq_RLybQ&t=928s

class FireStoreService {
  static final FireStoreService _fireStoreService =
      FireStoreService._internal();
  Firestore _db = Firestore.instance;

  FireStoreService._internal();

  factory FireStoreService() {
    return _fireStoreService;
  }

  //read news from firebase cloud store
  Stream<List<News>> getNews() {
    return _db.collection('news').snapshots().map((event) => event.documents
        .map(
          (doc) => News.fromMap(doc.data, doc.documentID),
        )
        .toList());
  }

  // add news to firebase cloud store
  Future<void> addNews(News news) {
    return _db.collection('news').add(news.toMap());
  }

  //delete news from firebase cloud store for given id
  Future<void> deleteNews(String id) {
    return _db.collection('news').document(id).delete();
  }

  //update news record in cloud store
  Future<void> updateNews(News news) {
    return _db.collection('news').document(news.id).updateData(news.toMap());
  }
}
