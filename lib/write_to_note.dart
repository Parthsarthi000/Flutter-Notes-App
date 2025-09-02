import 'package:flutter/material.dart';

class WriteToNote extends StatefulWidget {
  final Function(String, String, String) initialiseCard;
  const WriteToNote({super.key, required this.initialiseCard});
  @override
  State<WriteToNote> createState() => WriteToNoteState();
}

class WriteToNoteState extends State<WriteToNote> {
  late String formattedDateTime;
  @override
  void initState() {
    super.initState();
    formattedDateTime =
        '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}, ${DateTime.now().hour}:${DateTime.now().minute}';
  }

  final titleController = TextEditingController();
  final noteController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    noteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              if (titleController.text != "" || noteController.text != "") {
                widget.initialiseCard(titleController.text, noteController.text,
                    formattedDateTime);
              }
              titleController.clear();
              noteController.clear();
              Navigator.pop(context);
            },
            icon: const Icon(Icons.check)),
        title: Text(formattedDateTime),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: null,
              expands: true,
              controller: noteController,
              decoration: const InputDecoration(
                hintText: "Your Note....",
                border: InputBorder.none,
              ),
            ),
          )),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        ],
      ),
    );
  }
}
