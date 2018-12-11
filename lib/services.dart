import 'package:cloud_firestore/cloud_firestore.dart';

class TravelDataService {
  Stream<QuerySnapshot> getTravelData() {
    return Firestore.instance.collection('travels').snapshots();
  }
}
