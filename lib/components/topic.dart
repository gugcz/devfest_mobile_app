import 'package:devfest_mobile_app/components/topic_circle.dart';
import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  final String text;
  final Color color;

  const Topic({
    Key key,
    @required this.text,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(4, 0, 8, 0),
            child: CustomPaint(painter: TopicCircle(color)),
          ),
          Text(text),
        ],
      ),
    );
  }
}

class Topics {
  static const Topic android = Topic(
    color: Colors.green,
    text: 'Android',
  );

  static const Topic firebase = Topic(
    color: Colors.orange,
    text: 'Firebase',
  );

  static const Topic flutter = Topic(
    color: Colors.blue,
    text: 'Flutter',
  );
}
