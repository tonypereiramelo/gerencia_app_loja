import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class ProductBloc extends BlocBase {
  final _dataController = BehaviorSubject<Map>();

  Stream<Map> get outData => _dataController.stream;

  String categoryId;
  DocumentSnapshot<Map<String, dynamic>>? product;

  late Map<String, dynamic> unsavedData;

  ProductBloc({required this.categoryId, this.product}) {
    if (product != null) {
      unsavedData = Map.of(product!.data()!);
      unsavedData['images'] = List.of(product!.data()!['images']);
      unsavedData['color'] = List.of(product!.data()!['color']);
    } else {
      unsavedData = {
        'title': null,
        'color': [],
        'description': null,
        'images': [],
        'price': null,
      };
    }
    _dataController.add(unsavedData);
  }

  @override
  void dispose() {
    super.dispose();
    _dataController.close();
  }
}
