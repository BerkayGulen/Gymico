import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../home.dart';

class ProgramPage extends StatelessWidget {
  final int programNum;
  ProgramPage({@required this.programNum});
  @override
  Widget build(BuildContext context) {
    CollectionReference program = FirebaseFirestore.instance.collection('program$programNum');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: Text(
          "Program Page",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Expanded(
          child: StreamBuilder<QuerySnapshot>(
            stream: program.snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                final list = snapshot.data.docs;
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: Flexible(
                      child: ListView.builder(
                        itemCount: list.length,
                        padding: const EdgeInsets.all(7),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  )
                                ],
                                gradient: LinearGradient(
                                  colors: [Colors.red, Colors.white],
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Center(
                                    child: Text(
                                      list[index]["name"],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        wordSpacing: 4,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          border:
                                              Border(left: BorderSide(width: 3, color: Colors.grey[300]))),
                                      alignment: Alignment.center,
                                      height: 120,
                                      child: Image.asset(list[index]["gif"]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
