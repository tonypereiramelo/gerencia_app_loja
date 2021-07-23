import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/widgets/image_source_sheet.dart';

class ImagesWidget extends FormField<List> {
  ImagesWidget({
    BuildContext? context,
    FormFieldSetter<List>? onSaved,
    FormFieldValidator<List>? validator,
    List? initialValue,
    bool autoValidate = false,
  }) : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            // ignore: deprecated_member_use
            autovalidate: autoValidate,
            builder: (state) {
              return Column(
                children: <Widget>[
                  Container(
                    height: 124,
                    padding: EdgeInsets.only(
                      top: 16,
                      bottom: 8,
                    ),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.value!.map<Widget>((i) {
                        return Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            child: i is String
                                ? Image.network(i, fit: BoxFit.cover)
                                : Image.file(
                                    i,
                                    fit: BoxFit.cover,
                                  ),
                            onLongPress: () {
                              state.didChange(state.value!..remove(i));
                            },
                          ),
                        );
                      }).toList()
                        ..add(
                          GestureDetector(
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Icon(
                                Icons.camera_enhance,
                                color: Colors.white,
                              ),
                              color: Colors.white.withAlpha(50),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context!,
                                  builder: (context) => ImageSourceSheet(
                                        onImageSelected: (image) {
                                          state.didChange(
                                            state.value!..add(image),
                                          );
                                        },
                                      ));
                            },
                          ),
                        ),
                    ),
                  ),
                  state.hasError
                      ? Text(
                          state.errorText.toString(),
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        )
                      : Container(),
                ],
              );
            });
}
