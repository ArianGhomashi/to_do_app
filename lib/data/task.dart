import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  Task({required this.name, this.isdone = false});

  @HiveField(0)
  String name;

  @HiveField(1)
  bool isdone;
}
