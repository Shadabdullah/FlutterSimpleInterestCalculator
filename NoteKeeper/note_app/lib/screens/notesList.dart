import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  State<StatefulWidget> createState() {
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Floating button pressed");
        },
        tooltip: "Add Items",
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView getListView() {
    // TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 2,
          color: Colors.white,
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_left),
            ),
            title: Text("Dummy Title"),
            subtitle: Text("Sub Title"),
            trailing: const Icon(
              Icons.delete,
              color: Colors.grey,
            ),
            onTap: () {
              debugPrint("title tapped");
            },
          ),
        );
      },
    );
  }
}
