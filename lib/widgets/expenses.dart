/* Importing from libraries / packages */
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpanse(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: const Duration(seconds: 3),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            },
          ),
          content: const Text('Expense deleted')),
    );
  }

  double calculateLastWeekExpenses() {
    // Calculate the date one week ago from today
    final DateTime now = DateTime.now();
    final DateTime lastWeek = now.subtract(const Duration(days: 7));

    // Filter and sum expenses that are within the last week
    double totalLastWeekExpenses = 0;

    // goes trough the all expenses in the List to check if the expense was between lastWeek and NOW.
    // if the condition all expenses within the period is added together and returned.
    // the value will be used in the card later down in the code.
    for (final expense in _registeredExpenses) {
      final expenseDate = expense.date;
      if (expenseDate.isAfter(lastWeek) && expenseDate.isBefore(now)) {
        totalLastWeekExpenses += expense.amount;
      }
    }
    return totalLastWeekExpenses;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    MediaQuery.of(context).size.height;

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some !'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      //using ternary condition to say that if the width being used by the screen (which is defined above) is more than 600 use a colom, if not use a row.
      //the code below column and row are mostly the same so i wont comment on both.
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Card(
                // Adding the card for the last expenses 
                //(this could have been done with theming. Also could've created a widget instead and added the widget)
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                        //Adding some extra definition to the card since i want it to look a bit seperate from the other expenses card.
                          'Last 7 days expenses',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                            //Using the value calculated from the method to show the user how much expense he/she has had in the last week (7 days).
                                '\$${calculateLastWeekExpenses().toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            const Spacer(),
                            const Row(
                              children: [
                                Icon(
                                  Icons.attach_money_rounded,
                                  size: 50,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Chart(expenses: _registeredExpenses),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Last 7 days expenses',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  Text(
                                      '\$${calculateLastWeekExpenses().toStringAsFixed(2)}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  const Spacer(),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.attach_money_rounded,
                                        size: 50,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
