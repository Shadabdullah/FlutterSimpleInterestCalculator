import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {
  String appBartitle;

  NoteDetail(this.appBartitle, {super.key});

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.appBartitle);
  }
}

class NoteDetailState extends State<NoteDetail> {
  String appBartitle;

  var _priorities = ["High", "Low"];

  TextEditingController titleNameController = TextEditingController();
  TextEditingController itemDescriptionController = TextEditingController();

  NoteDetailState(this.appBartitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text(appBartitle)),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: DropdownButton<String>(
                items: _priorities.map((String dropdownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropdownStringItem,
                    child: Text(dropdownStringItem),
                  );
                }).toList(),
                value: "Low",
                onChanged: (String? valueSelected) {
                  setState(() {
                    debugPrint("user selected $valueSelected");
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: TextField(
                controller: titleNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  labelText: "Title",
                ),
                onChanged: (String value) {
                  debugPrint("something changed");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: TextField(
                controller: itemDescriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  labelText: "Description",
                ),
                onChanged: (String value) {
                  debugPrint("something changed");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        "Save",
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint("Saved");
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        "Delete",
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint("Deleted");
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
