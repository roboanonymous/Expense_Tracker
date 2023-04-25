import 'package:expense_tracker/Widgets/expense_list/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';

import 'package:flutter/material.dart';


class Expenses extends StatefulWidget{
  const Expenses({super.key});


  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }

}

class _ExpensesState extends State <Expenses>{  

  final List<Expense> _registeredExpenses = [
     Expense(title:"Flutter Course" , amount: 20.45, date: DateTime.now(), category: Category.work),
     Expense(title:"Movie" , amount: 15.75, date: DateTime.now(), category: Category.leisure),
  ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      children:  [
       const Text("The chart"),
        Expanded (child: Expenselist(expenses: _registeredExpenses),
        ),
    ]
    ),
    );
  }
}