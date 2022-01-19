import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  double size = 30.0;
  Color color = Colors.red;
  IconData icon;
  String titleText = "";
  String subTitleText = "";
  IconContainer(
      this.titleText, this.subTitleText, this.icon, this.color, this.size,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: color,
      child: Card(
        child: ListTile(
          title: Column(
            children: <Widget>[
              Text(
                titleText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                subTitleText,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    icon,
                    size: size,
                    color: Colors.green,
                    semanticLabel: "Active",
                    textDirection: TextDirection.rtl,
                  ),
                  Text("Actvie")
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
