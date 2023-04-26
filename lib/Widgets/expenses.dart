import 'package:expense_tracker/Widgets/expense_list/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/Widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/Widgets/Chart/chart.dart';


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

  void _openAddExpenseOverlay(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, 
      builder: (ctx) =>  NewExpense(onAddExpense: _addExpense),
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
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

   @override
  Widget build(BuildContext context) {
    Widget maincontent = const Center(child: Text("No Expense Found, Start Adding Some!"
    ) ,
    );
    if(_registeredExpenses.isNotEmpty){
      maincontent = Expenselist(
          expenses: _registeredExpenses,
         onRemoveExpense: _removeExpense ,);
    }
    return Scaffold(
      appBar:AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay, 
            icon: const Icon(Icons.add),
            )
        ],
      ),
      body: Column(
      children:  [
        Chart(expenses: _registeredExpenses),
        Expanded (child: maincontent,
        ),
    ]
    ),
    );
  }
}
