import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends BlocBase {
  final _userController = BehaviorSubject();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Map<String, Map<String, dynamic>> _users = {};

  UserBloc() {
    _addUserListener();
  }

  void _addUserListener() {
    _firestore.collection('users').snapshots().listen((snapshot) {
      snapshot.docChanges.forEach((change) {
        String uid = change.doc.id;

        switch (change.type) {
          case DocumentChangeType.added:
            _users[uid] = change.doc.data()!;
            break;
          case DocumentChangeType.modified:
            _users[uid]!.addAll(change.doc.data()!);
            break;
          case DocumentChangeType.removed:
            _users.remove(uid);
            break;
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userController.close();
  }
}
