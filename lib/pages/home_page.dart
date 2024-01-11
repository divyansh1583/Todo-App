import 'package:flutter/material.dart';
import 'package:todo_app/data/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isSortAscending = true;
  var isChecked = false;
  Widget? currentIcon;

  void acsending() {
    setState(() {
      isSortAscending = false;
      todoList.sort((a, b) => a.text.compareTo(b.text));
    });
  }

  void decsending() {
    setState(() {
      isSortAscending = true;
      todoList.sort((a, b) => b.text.compareTo(a.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget sortAscecnding = TextButton.icon(
      label: const Text("Sort Ascending"),
      icon: const Icon(Icons.arrow_upward_rounded),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
            side: BorderSide.none, borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: acsending,
    );

    Widget sortDescending = TextButton.icon(
      label: const Text("Sort Decsending"),
      icon: const Icon(Icons.arrow_downward_rounded),
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
            side: BorderSide.none, borderRadius: BorderRadius.circular(20)),
      ),
      onPressed: decsending,
    );

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //Sort text button
          currentIcon = isSortAscending ? sortAscecnding : sortDescending,
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                var todo = todoList[index];
                return CheckboxListTile(
                  value: todo.isChecked,
                  onChanged: (value) {
                    setState(() {
                      todo.isChecked = value!;
                    });
                  },
                  title: Row(
                    children: [
                      todo.icon,
                      const SizedBox(width: 20),
                      Text(todo.text),
                    ],
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                );
                // return ListTile(
                //   leading: Checkbox(
                //     value: todo.isChecked,
                //     onChanged: (value) {
                //       setState(() {
                //         todo.isChecked = value!;
                //       });
                //     },
                //   ),
                //   title: Row(
                //     children: [
                //       todo.icon,
                //       const SizedBox(width: 20),
                //       Text(todo.text),
                //     ],
                //   ),
                // );
              },
            ),
          )
        ],
      ),
    );
  }
}
