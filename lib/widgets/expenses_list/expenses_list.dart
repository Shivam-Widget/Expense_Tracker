import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expense, required this.onRemoveExpense});

  final List<Expense> expense;

  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (ctx, i) {
        return Dismissible(
          background: Container(
            margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal),
            decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.6),
                borderRadius: BorderRadius.circular(10)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.highlight_remove,
                  color: Colors.black38,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Removed',
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          key: ValueKey(
            expense[i],
          ),
          onDismissed: (direction) {
            onRemoveExpense(expense[i]);
          },
          child: ExpenseItem(
            expense[i],
          ),
        );
      },
    );
  }
}
