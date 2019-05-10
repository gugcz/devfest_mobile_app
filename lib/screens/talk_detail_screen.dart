import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/entities/talk.dart';

class TalkDetailScreen extends StatelessWidget {
  final Talk talk;

  TalkDetailScreen({
    Key key,
    @required this.talk,
  }) : super(key: key);

  Widget buildTalkName() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Text(
        talk.name,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
      ),
    );
  }

  Widget buildFirstSubtitle() {
    if (talk.firstSubtitle != null && talk.firstSubtitle.length > 0) {
      return Text(
        talk.firstSubtitle,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
      );
    } else {
      return Container();
    }
  }

  Widget buildSecondSubtitle() {
    if (talk.secondSubtitle != null && talk.secondSubtitle.length > 0) {
      return Text(
        talk.secondSubtitle,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
      );
    } else {
      return Container();
    }
  }

  Widget buildTopics() {
    if (talk.topics != null && talk.topics.length > 0) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: Row(
          children: talk.topics,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget buildTalkDescription() {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Text(
        talk.description,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(talk.name),
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildTalkName(),
                    buildFirstSubtitle(),
                    buildSecondSubtitle(),
                    buildTopics(),
                    buildTalkDescription(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
