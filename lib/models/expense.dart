/* Importing from libraries / packages */
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// Creating the date formatter with "month/day/year"
final formatter = DateFormat.yMd();

//constant variable for generating unique identifiers.
const uuid = Uuid();

enum Category { food, travel, leisure, work }

// setting icons connected to the categories
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

//Expense class
class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();  //creating UNIQUE identifier with uuid package

  /* Internal values for expenses */
  final String id; // internal id for the expense
  final String title; // name of the expense
  final double amount; // price of the expense
  final DateTime date; // date the expense was made
  final Category category; // categories


 /* simple function that formats the date how we want it to be viewed. */
  String get formattedDate {
    return formatter.format(date);
  }
}


//ExpenseBucket class
class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  // Create an ExpenseBucket for a category from all expenses
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  // Calculate total expenses within the range of this bucket.
  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount; //sum of amounts.
    }

    return sum;
  }
}
