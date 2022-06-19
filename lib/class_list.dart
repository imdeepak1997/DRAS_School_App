import 'dart:convert';
import 'package:dras_school/subject_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClassList extends StatefulWidget {
  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  var classesname = [];
  _ClassListState() {
    getClassListData();
  }

  Future getClassListData() async {
    print("======= Started =====");
    var res = await http
        .get(Uri.parse("https://imdeepak1997.github.io/csv/classList.json"));
    var classList = jsonDecode(res.body);
    setState(() {
      this.classesname = classList;
    });
    // print("====== json ===" + classList.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('SACE School'),
      // ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: classesname.length,
          itemBuilder: (context, index) => Card(
            elevation: 1.5,
            margin: EdgeInsets.all(5),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  classesname[index]["classNumber"],
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                backgroundColor: Colors.blue,
              ),
              title: Text(
                classesname[index]["className"],
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                "Class Teacher : "+classesname[index]["classTeacher"],
                style: TextStyle(fontSize: 15),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                print("tapped");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SubjectList(classesname[index]["classid"])));
                // Navigator.of(context).pushReplacement(MaterialPageRoute(
                //   builder: (context) => SubjectList(classesname[index]["classid"]),
                // ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
