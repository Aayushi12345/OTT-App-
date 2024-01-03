import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailScreen extends StatelessWidget {
  final String name;
  final int id;

  const DetailScreen({
    Key? key,
    required this.name,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Detail Screen"),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child:
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
              Container(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("First Name",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 25.00,
                            fontWeight: FontWeight.bold)),
                    Text("Last Name",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 25.00,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Container(
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("First Name",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 25.00,
                            fontWeight: FontWeight.bold)),
                    Text("Last Name",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 25.00,
                            fontWeight: FontWeight.bold)),

                    // TextField(
                    //   maxLines: 2,
                    //   decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       hintText: 'Enter Your Last Name'),
                    // )
                  ],
                ),
              )
            ]),
          ),
        )
      )
    );
  }
}

// body: Column(
// children: [
// CustomTextView(context),
// // SearchBar(),
// Expanded(
// child: ListView.builder(
// itemCount: 10,
// itemBuilder: (context, index) {
// return new GestureDetector(
// onTap: () {
// print("tapped");
// },
// child: new Padding(
// padding: const EdgeInsets.all(8.0),
// child: new Container(
// color: Colors.grey,
// height: 100.0,
// ),
// ),
// );
