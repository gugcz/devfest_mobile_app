import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/components/topic.dart';

class TalkDetailScreen extends StatelessWidget {
  final String talkName;
  final String firstSubtitle;
  final String secondSubtitle;
  final List<Topic> topics;
  final Image speakerPhoto;
  final String speakerName;
  final String company;
  final String description;

  TalkDetailScreen({
    Key key,
    @required this.talkName,
    this.firstSubtitle,
    this.secondSubtitle,
    this.topics,
    @required this.description,
    @required this.speakerPhoto,
    @required this.speakerName,
    this.company,
  }) : super(key: key);

  Widget buildTalkName() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Text(
        talkName,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
      ),
    );
  }

  Widget buildFirstSubtitle() {
    if (firstSubtitle != null && firstSubtitle.length > 0) {
      return Text(
        firstSubtitle,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
      );
    } else {
      return Container();
    }
  }

  Widget buildSecondSubtitle() {
    if (secondSubtitle != null && secondSubtitle.length > 0) {
      return Text(
        secondSubtitle,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
      );
    } else {
      return Container();
    }
  }

  Widget buildTopics() {
    if (topics != null && topics.length > 0) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: Row(
          children: topics,
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
        description,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Talk detail'),
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
