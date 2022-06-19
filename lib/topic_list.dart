import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TopicList extends StatelessWidget {
  var subjectid;
  Image cardImage = Image.network(
      "https://image.freepik.com/free-vector/teacher-students-wearing-face-mask-class_52683-46993.jpg");
  TopicList(var subjectid) {
    this.subjectid = subjectid;
  }
  final List topicname = [
    {
      "conesone": [
        {
          "topicid": "tone",
          "topicNumber": "1",
          "topicName": "Chapter 1",
          "topicTeacher": "Deepak",
          "topicVideoLink": "https://www.youtube.com/watch?v=hgPTvi0OM4A"
        },
        {
          "topicid": "ttwo",
          "topicNumber": "2",
          "topicName": "Chapter 2",
          "topicTeacher": "Rahul",
          "topicVideoLink": "https://www.youtube.com/watch?v=hgPTvi0OM4A"
        },
        {
          "topicid": "tthree",
          "topicNumber": "3",
          "topicName": "Chapter 3",
          "topicTeacher": "Mayank",
          "topicVideoLink": "https://www.youtube.com/watch?v=hgPTvi0OM4A"
        },
        {
          "topicid": "tfour",
          "topicNumber": "4",
          "topicName": "Chapter 4",
          "topicTeacher": "Ashutosh",
          "topicVideoLink": "https://www.youtube.com/watch?v=hgPTvi0OM4A"
        },
        {
          "topicid": "tfive",
          "topicNumber": "5",
          "topicName": "Chapter 5",
          "topicTeacher": "Sandeep",
          "topicVideoLink": "https://www.youtube.com/watch?v=hgPTvi0OM4A"
        },
      ],
      "conestwo": [
        {
          "topicid": "tthree",
          "topicNumber": "3",
          "topicName": "Chapter 3",
          "topicTeacher": "Mayank",
          "topicVideoLink": "https://www.youtube.com/watch?v=hgPTvi0OM4A"
        },
        {
          "topicid": "tfour",
          "topicNumber": "4",
          "topicName": "Chapter 4",
          "topicTeacher": "Ashutosh",
          "topicVideoLink": "https://www.youtube.com/watch?v=hgPTvi0OM4A"
        },
        {
          "topicid": "tfive",
          "topicNumber": "5",
          "topicName": "Chapter 5",
          "topicTeacher": "Sandeep",
          "topicVideoLink": "https://www.youtube.com/watch?v=hgPTvi0OM4A"
        },
      ],
      "ctwostwo": [
        {
          "topicid": "tthree",
          "topicNumber": "3",
          "topicName": "Chapter 3",
          "topicTeacher": "Mayank",
          "topicVideoLink": "https://www.youtube.com/watch?v=hgPTvi0OM4A"
        },
        {
          "topicid": "tfour",
          "topicNumber": "4",
          "topicName": "Chapter 4",
          "topicTeacher": "Ashutosh",
          "topicVideoLink": "https://www.youtube.com/watch?v=hgPTvi0OM4A"
        },
        {
          "topicid": "tfive",
          "topicNumber": "5",
          "topicName": "Chapter 5",
          "topicTeacher": "Sandeep",
          "topicVideoLink": "https://www.youtube.com/watch?v=hgPTvi0OM4A"
        },
      ]
    }
  ];
  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    if (topicname[0][this.subjectid] == null ||
        topicname[0][this.subjectid].length == 0) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Select Topic'),
          ),
          body: Center(
            child: Text(
              "No Topic Found",
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select topic'),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: topicname[0][this.subjectid].length,
            itemBuilder: (context, index) => Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            topicname[0][this.subjectid][index]["topicNumber"],
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          backgroundColor: Colors.grey,
                        ),
                        title: Text(
                          "Topic : " +
                              topicname[0][this.subjectid][index]["topicName"],
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(
                          "Teacher : " +
                              topicname[0][this.subjectid][index]
                                  ["topicTeacher"],
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: cardImage,
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                        child: Text("Summary : Newtons Laws",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 15),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.end,
                        buttonPadding:
                            const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
                        children: [
                          ElevatedButton.icon(
                            icon: Icon(Icons.play_arrow, size: 18),
                            onPressed: () {
                              _launchURL(topicname[0][this.subjectid][index]
                                  ["topicVideoLink"]);
                            },
                            label: const Text(
                              'PLAY',
                              style: TextStyle( color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      // Icon(Icons.pages),
                      // Icon(Icons.pages),
                      // Image.asset('assets/card-sample-image.jpg'),
                      // Image.asset('assets/card-sample-image-2.jpg'),
                    ],
                  ),
                )),
      ),
    );
  }
}
