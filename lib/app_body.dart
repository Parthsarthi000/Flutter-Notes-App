import 'dart:async';
import 'package:flutter/material.dart';
import 'card.dart';
import 'write_to_note.dart';

class MyBody extends StatefulWidget {
  final List<MyCard> cards;
  final Function(String, String, String) initialiseCard;
  final Function(int) deleteCard;

  const MyBody(
      {super.key,
      required this.cards,
      required this.initialiseCard,
      required this.deleteCard});

  @override
  State<MyBody> createState() => MyBodyState();
}

class MyBodyState extends State<MyBody> {
  Future<void> createNote() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WriteToNote(
                initialiseCard: widget.initialiseCard,
              )),
    );
    setState(() {});
  }

  Future<void> alertDialog(BuildContext context, int index) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text("Delete Note?"),
              IconButton(
                onPressed: () {
                  widget.deleteCard(index);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
            ),
            itemCount: widget.cards.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () async {
                  await alertDialog(context, index);
                },
                child: widget.cards[index],
              );
            }),
        Positioned(
          right: MediaQuery.of(context).size.width * 0.02,
          bottom: MediaQuery.of(context).size.width * 0.02,
          child: FloatingActionButton(
            onPressed: () async {
              await createNote();
            },
            tooltip: "Add Note",
            backgroundColor: const Color(0xFF1E90FF),
            shape: const CircleBorder(),
            child: const Icon(Icons.note_add_rounded),
          ),
        ),
      ],
    );
  }
}
