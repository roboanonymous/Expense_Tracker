import 'package:flutter/widgets.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/Widgets/expense_list/expense_item.dart';

class Expenselist extends StatelessWidget{
  const Expenselist({ super.key,
    required this.expenses,
    }
    );

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),
    );
  }
  

}