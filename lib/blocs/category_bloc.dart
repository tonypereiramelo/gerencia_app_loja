import 'dart:async';
import 'dart:io';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBloc extends BlocBase {
  final _titleController = BehaviorSubject<String>();
  final _imageController = BehaviorSubject();
  final _deleteController = BehaviorSubject<bool>();

  Stream<String> get outTitle => _titleController.stream.transform(
          StreamTransformer<String, String>.fromHandlers(
              handleData: (title, sink) {
        if (title.isEmpty)
          sink.addError('Insira um título');
        else
          sink.add(title);
      }));
  Stream get outImage => _imageController.stream;
  Stream<bool> get outDelete => _deleteController.stream;
  Stream<bool> get outSubmitValid =>
      Rx.combineLatest2(outTitle, outImage, (a, b) => true);

  DocumentSnapshot<Map<String, dynamic>>? category;
  File? image;
  String? title;

  CategoryBloc(this.category) {
    if (category != null) {
      title = category!.data()!['title'];
      _titleController.add(category!.data()!['title']);
      _imageController.add(category!.data()!['icon']);
      _deleteController.add(true);
    } else {
      _deleteController.add(false);
    }
  }
  void setImage(File file) {
    image = file;
    _imageController.add(file);
  }

  void setTitle(String title) {
    this.title = title;
    _titleController.add(title);
  }

  Future saveData() async {
    if (image == null &&
        category != null &&
        title == category!.data()!['title']) return;
    Map<String, dynamic> dataToUpdate = {};
    if (image != null) {
      UploadTask task = FirebaseStorage.instance
          .ref()
          .child("icons")
          .child(title!)
          .putFile(image!);

      var snap = await (await task).ref.getDownloadURL();
      String urlDown = snap.toString();
      dataToUpdate["icon"] = urlDown;
    }
    if (title != null || title != category!.data()!['title']) {
      dataToUpdate["title"] = title;
    }
    if (category == null) {
      await FirebaseFirestore.instance
          .collection("products")
          .doc(title!.toLowerCase())
          .set(dataToUpdate);
    } else {
      await category!.reference.update(dataToUpdate);
    }
  }

  void delete() {
    category!.reference.delete();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.close();
    _imageController.close();
    _deleteController.close();
  }
}
