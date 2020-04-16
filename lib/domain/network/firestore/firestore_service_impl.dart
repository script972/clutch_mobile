import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_clutch_mobile/domain/network/model/response/company_response.dart';

import '../api_service.dart';
import 'firestore_constance.dart';

class FirestoreServiceImpl extends ApiService {
  final databaseReference = Firestore.instance;

  Stream<List<CompanyResponse>> fetchCompany() async* {
    Stream<QuerySnapshot> streamDB = await databaseReference
        .collection(FirestoreConstance.ROOT_COMPANY)
        .snapshots();
    var company = <CompanyResponse>[];
    streamDB.forEach((item) {
      item.documents.forEach((inner) {
        company.add(CompanyResponse.fromMap(inner.data));
      });
    });
    yield company;
  }
}
