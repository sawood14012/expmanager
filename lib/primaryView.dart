import 'package:expmanager/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Primary extends ConsumerStatefulWidget {
  const Primary({Key? key}) : super(key: key);

  @override
  ConsumerState<Primary> createState() => _PrimaryState();
}

class _PrimaryState extends ConsumerState<Primary> {
  final screens = [];

  final _formKey = GlobalKey<FormState>();

  int _selectedCompany = 0;
  int _selectedExp = 0;
  List<DropdownMenuItem<int>> companyList = [];
  List<DropdownMenuItem<int>> expList = [];
  void loadCompanyList() {
    companyList = [];
    companyList.add(new DropdownMenuItem(
      child: new Text('Deepcloud'),
      value: 0,
    ));
    companyList.add(new DropdownMenuItem(
      child: new Text('Dadscorp'),
      value: 1,
    ));
    companyList.add(new DropdownMenuItem(
      child: new Text('Cloudadda'),
      value: 2,
    ));
  }

  void loadExpList() {
    expList = [];
    expList.add(new DropdownMenuItem(
      child: new Text('fuel'),
      value: 0,
    ));
    expList.add(new DropdownMenuItem(
      child: new Text('food'),
      value: 1,
    ));
    expList.add(new DropdownMenuItem(
      child: new Text('Cloudadda'),
      value: 2,
    ));
  }

  @override
  Widget build(BuildContext context) {
    loadCompanyList();
    loadExpList();
    return Form(
        key: _formKey,
        child: new ListView(
          children: getFormWidget(),
        ));
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = [];
    formWidget.add(Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(20),
        child: DropdownButton(
          hint: new Text('Select Company'),
          items: companyList,
          value: _selectedCompany,
          onChanged: (value) {
            setState(() {
              _selectedCompany = int.parse(value.toString());
            });
          },
          isExpanded: true,
        )));
    Padding(
      padding: EdgeInsets.all(10),
    );

    formWidget.add(Container(
         padding: EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
                color: Colors.red, style: BorderStyle.solid, width: 0.80),
          ),
        child: new DropdownButton(

          borderRadius: BorderRadius.circular(5),
          menuMaxHeight: 500.0,
          hint: new Text('Select Type of Expense'),
          elevation: 0,
          items: expList,
          value: _selectedExp,
          onChanged: (value) {
            setState(() {
              _selectedExp = int.parse(value.toString());
            });
          },
          isExpanded: true,
        )));
    return formWidget;
  }
}
