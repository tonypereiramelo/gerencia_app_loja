import 'package:flutter/material.dart';
import 'package:gerencia_app_loja/widgets/add_color_dialog.dart';

class ProductColor extends FormField<List> {
  ProductColor({
    BuildContext? context,
    List? initialValue,
    FormFieldSetter<List>? onSaved,
    FormFieldValidator<List>? validator,
  }) : super(
            initialValue: initialValue,
            onSaved: onSaved,
            validator: validator,
            builder: (state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 34,
                    child: GridView(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8,
                        childAspectRatio: 0.5,
                      ),
                      children: state.value!.map((c) {
                        return GestureDetector(
                          onLongPress: () {
                            state.didChange(state.value!..remove(c));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              border: Border.all(
                                color: Colors.pinkAccent,
                                width: 3,
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              c,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      }).toList()
                        ..add(
                          GestureDetector(
                            onTap: () async {
                              String color = await showDialog(
                                  context: context!,
                                  builder: (context) => AddColorDialog());
                              if (color.isNotEmpty)
                                state.didChange(state.value!..add(color));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                                border: Border.all(
                                  color: state.hasError
                                      ? Colors.red
                                      : Colors.pinkAccent,
                                  width: 3,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '+',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
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
