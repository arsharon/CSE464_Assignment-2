import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/task.dart';

class TaskCardWidget extends StatefulWidget {
  final TaskCardData taskCardData;

  const TaskCardWidget({
    super.key,
    required this.taskCardData,
  });

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  String monthFromInt(int monthInt) {
    switch (monthInt) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        throw "Invalid month index";
    }
  }

  String formatDatetime(DateTime dateTime) {
    return "${dateTime.hour > 12 ? '${dateTime.hour - 12}' : '${dateTime.hour}'}:${dateTime.minute} ${dateTime.hour >= 12 ? 'pm' : 'am'} ${dateTime.day == 1 || dateTime.day == 21 || dateTime.day == 31 ? '${dateTime.day}st' : dateTime.day == 2 || dateTime.day == 22 ? '${dateTime.day}nd' : dateTime.day == 3 || dateTime.day == 23 ? '${dateTime.day}rd' : '${dateTime.day}th'} ${monthFromInt(dateTime.month)}, ${dateTime.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xF5F8FBFF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.taskCardData.title,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            widget.taskCardData.description,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.w300,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              formatDatetime(widget.taskCardData.deadline),
              style: GoogleFonts.inter(
                fontSize: 10,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
