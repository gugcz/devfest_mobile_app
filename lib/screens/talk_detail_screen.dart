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

  Widget buildSubtitle() {
    if (talk.subtitle != null && talk.subtitle.length > 0) {
      return Text(
        talk.subtitle,
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

  Widget buildSpeaker() {
    return Padding(
      padding: EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _speakerPhoto(),
          _speakerName(),
          _speakerPosition(),
          _companyLogo(),
          _speakerBio(),
        ],
      ),
    );
  }

  Widget _speakerPhoto() {
    return Image(
      image: talk.speaker.photo,
      height: 128.0,
    );
  }

  Widget _speakerName() {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Text(
        talk.speaker.name,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
      ),
    );
  }

  Widget _speakerPosition() {
    if (talk.speaker.position != null) {
      return Padding(
        padding: EdgeInsets.only(top: 4),
        child: Text(
          talk.speaker.position,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _companyLogo() {
    if (talk.speaker.company.logo != null) {
      return Padding(
        padding: EdgeInsets.only(top: 12),
        child: Image(
          image: talk.speaker.company.logo,
          height: 36.0,
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _speakerBio() {
    if (talk.speaker.bio != null && talk.speaker.bio.length > 0) {
      return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Text(
          talk.speaker.bio,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      );
    } else {
      return Container();
    }
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
                    buildSubtitle(),
                    buildTopics(),
                    buildTalkDescription(),
                    buildSpeaker(),
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
