import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dras_school/topic_list.dart';
import 'package:flutter/material.dart';

class SubjectList extends StatefulWidget {
  var classid;

  SubjectList(var classid) {
    this.classid = classid;
  }

  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  var subjectname = [];
  _SubjectListState() {
    getClassListData();
  }

  Future getClassListData() async {
    print("======= Subject Started =====");
    var res = await http
        .get(Uri.parse("https://imdeepak1997.github.io/csv/subjectList.json"));
    var subjectList = jsonDecode(res.body);
    setState(() {
      this.subjectname = subjectList;
    });
    // print("====== json ===" + classList.toString());
  }

  @override
  Widget build(BuildContext context) {
    if (subjectname == null ||
        subjectname.length == 0) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Select Subject'),
        ),
        body: Center(
          child: Text(
            "No Subject Found",
            style: TextStyle(color: Colors.red, fontSize: 30),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Subject'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: subjectname[0][this.widget.classid].length,
          itemBuilder: (context, index) => Card(
            elevation: 0,
            margin: EdgeInsets.all(5),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  subjectname[0][this.widget.classid][index]["subjectNumber"],
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                backgroundColor: Colors.grey,
              ),
              title: Text(
                subjectname[0][this.widget.classid][index]["subjectName"],
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                subjectname[0][this.widget.classid][index]["subjectTeacher"],
                style: TextStyle(fontSize: 15),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                print("tapped");
                print("object====" +
                    subjectname[0][this.widget.classid][index]["subjectid"]);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TopicList(subjectname[0]
                            [this.widget.classid][index]["subjectid"])));
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //   builder: (context) => TopicList(subjectname[0][this.classid][index]["subjectid"]),
                // ));
              },
            ),
          ),
        ),
      ),
    );
  }

  // final List subjectname = [
  //   {
  //     "cone": [
  //       {
  //         "subjectid": "conesone",
  //         "subjectNumber": "1",
  //         "subjectName": "Math",
  //         "subjectTeacher": "Deepak",
  //       },
  //       {
  //         "subjectid": "conestwo",
  //         "subjectNumber": "2",
  //         "subjectName": "English",
  //         "subjectTeacher": "Rahul",
  //       },
  //       {
  //         "subjectid": "conesthree",
  //         "subjectNumber": "3",
  //         "subjectName": "Hindi",
  //         "subjectTeacher": "Mayank",
  //       },
  //       {
  //         "subjectid": "conesfour",
  //         "subjectNumber": "4",
  //         "subjectName": "Science",
  //         "subjectTeacher": "Ashutosh",
  //       },
  //       {
  //         "subjectid": "conesfive",
  //         "subjectNumber": "5",
  //         "subjectName": "Social Scince",
  //         "subjectTeacher": "Sandeep",
  //       },
  //     ],
  //     "ctwo": [
  //       {
  //         "subjectid": "ctwosone",
  //         "subjectNumber": "1",
  //         "subjectName": "Math",
  //         "subjectTeacher": "Deepak",
  //       },
  //       {
  //         "subjectid": "ctwostwo",
  //         "subjectNumber": "2",
  //         "subjectName": "English",
  //         "subjectTeacher": "Rahul",
  //       },
  //       {
  //         "subjectid": "ctwosthree",
  //         "subjectNumber": "3",
  //         "subjectName": "Hindi",
  //         "subjectTeacher": "Mayank",
  //       },
  //     ]
  //   }
  // ];

}
