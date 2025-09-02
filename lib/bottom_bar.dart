import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget implements PreferredSizeWidget {
  const MyBottomBar(
      {super.key,
      required this.categoryChips,
      required this.setCategory,
      required this.selectedCategory,
      required this.incrementCategories});
  final List<String> categoryChips;
  final Function(int) setCategory;
  final Function(String) incrementCategories;
  final int selectedCategory;
  @override
  State<MyBottomBar> createState() => MyBottomBarState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class MyBottomBarState extends State<MyBottomBar> {
  final inputController = TextEditingController();
  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  Future<void> alertDialog(BuildContext context) async {
    String? text = await showDialog<String?>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            TextField(
              controller: inputController,
              decoration: const InputDecoration(hintText: "Enter Category"),
            ),
            ButtonBar(
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, "");
                    },
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context, inputController.text);
                    },
                    child: const Text("Ok"))
              ],
            ),
          ],
        );
      },
    );
    if (text != null && text != "") {
      widget.incrementCategories(text);
      //widget.setCategory(widget.categoryChips.length - 1);
    }
    inputController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.categoryChips.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0), // Add horizontal spacing
                    child: GestureDetector(
                      onTap: () {
                        widget.setCategory(index);
                      },
                      child: Chip(
                        backgroundColor: widget.selectedCategory == index
                            ? const Color(0xFF1E90FF)
                            : null,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        label: Text(widget.categoryChips[index],
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            IconButton(
                tooltip: "Add Category",
                onPressed: () async {
                  await alertDialog(context);
                  widget.setCategory(widget.categoryChips.length - 1);
                },
                icon: const Icon(Icons.add)),
          ],
        ));
  }
}
