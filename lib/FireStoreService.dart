import 'package:cloud_firestore/cloud_firestore.dart';

import 'News.dart';

class FireStoreService {
  static final FireStoreService _fireStoreService =
      FireStoreService._internal();
  Firestore _db = Firestore.instance;

  FireStoreService._internal();

  factory FireStoreService() {
    return _fireStoreService;
  }

 Stream<List<News>> getNews() {
    return _db.collection('news').snapshots().map((event) => event.documents
        .map(
          (doc) => News.fromMap(doc.data, doc.documentID),
        )
        .toList());
  }

  Future<void> addNews(News news){
      return _db.collection('news').add(news.toMap());
  }

  Future<void> deleteNews(String id) {
    return _db.collection('news').document(id).delete();
  }
}
