import 'package:devfest_mobile_app/config.dart';
import 'package:flutter/material.dart';

class FractionItem extends StatelessWidget {
  final FractionItemModel model;

  FractionItem(this.model);

  @override
  Widget build(context) {
    return Stack(
      children: [
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(height: 70, image: model.image),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                    ),
                    child: Text(
                      model.text,
                      style: TextStyle(
                        fontSize: 12,
                        color: Config.colorPalette.shade800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromARGB(model.isSelected ? 0 : 127, 0, 0, 0),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}

class FractionItemModel {
  bool isSelected;
  AssetImage image;
  String text;

  FractionItemModel(this.isSelected, this.image, this.text);
}
