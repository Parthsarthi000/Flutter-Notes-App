import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  const MyCard(
      {super.key, required this.title, required this.note, required this.time});
  final String title;
  final String note;
  final String time;
  @override
  State<MyCard> createState() => MyCardState();
}

class MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple[700],
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Align(
              alignment:
                  widget.title != "" ? Alignment.topLeft : Alignment.centerLeft,
              //alignment: Alignment.topLeft,
              child: Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: widget.title != ""
                  ? MediaQuery.of(context).size.height * 0.02
                  : 0,
            ),
            Align(
              alignment:
                  widget.title != "" ? Alignment.centerLeft : Alignment.topLeft,
              child: Text(
                widget.note,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(widget.time),
            ),
          ],
        ),
      ),
    );
  }
}
