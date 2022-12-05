import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'models.g.dart';

@HiveType(typeId: 1)
class notesModel extends HiveObject{
 @HiveField(0)
 String Title;

 @HiveField(1)
 String Description;

 @HiveField(2)
 DateTime current_Time;

 notesModel({required this.Title,required this.Description,required this.current_Time});
}