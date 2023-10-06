/* Importing from libraries / packages */
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

//ExpanseItem class
class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});

  //expanse object variable
  final Expense expense;

  //build method, used to create a widget tree. can be viewed in devtools for flutter.
  @override
  Widget build(BuildContext context) {
  //starts with returning a card widget, which is viewed.
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          //getting information from the current expanse and returning / viewing the tilte variable of that expense.
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4), // Adding spacing / padding between the widgets.
            Row(
              children: [
              //displays the expense amount with the dollar sign in front, uses \ infrom of the first dollar to avoid using the keycharacter.
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                  //display the expense category icon.
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
