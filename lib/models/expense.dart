import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, leisure, work  }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();


  /* Internal values for expenses */
  final String id;      // internal id for the expense
  final String title;   // name of the expense
  final double amount;  // price of the expense
  final DateTime date;  // date the expense was made

  /* Categories for expenses */

  final Category category;


  String get formattedDate {
    return formatter.format(date);
}

}
