import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/data/task.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({Key? key, required this.task}) : super(key: key);

  Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  var box = Hive.box<Task>('taskBox');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                deleteTask();
              },
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              widget.task.isdone = !widget.task.isdone;
              widget.task.save();
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Checkbox(
                      activeColor: Colors.black,
                      value: widget.task.isdone,
                      onChanged: (value) {
                        setState(() {
                          widget.task.isdone = value!;
                          widget.task.save();
                        });
                      }),
                  Text(
                    widget.task.name,
                    style: TextStyle(
                      decoration: widget.task.isdone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void deleteTask() {
    widget.task.delete();
  }
}
