import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _numberOneController = TextEditingController();
  final TextEditingController _numberTwoController = TextEditingController();
  double _result = 0;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sum Apps'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _numberOneController,
                decoration: InputDecoration(hintText: 'Enter Number One'),
                validator: (String? value) {
                  String v = value ?? "";
                  if (v.isEmpty) {
                    return "Enter Number Two";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _numberTwoController,
                decoration: InputDecoration(hintText: 'Enter Number Two'),
                validator: (String? value) {
                  String v = value ?? "";
                  if (v.isEmpty) {
                    return "Enter Number two";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          double numberOne = double.tryParse(
                                  _numberOneController.text.trim()) ??
                              0;
                          double numberTwo = double.tryParse(
                                  _numberTwoController.text.trim()) ??
                              0;
                          double result = add(numberOne, numberTwo);
                          _result = result;
                          setState(() {});
                        }
                      },
                      child: Text('Add'),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              double numberOne = double.tryParse(
                                      _numberOneController.text.trim()) ??
                                  0;
                              double numberTwo = double.tryParse(
                                      _numberTwoController.text.trim()) ??
                                  0;
                              double result = sub(numberOne, numberTwo);
                              _result = result;
                              setState(() {});
                            }
                          },
                          child: Text('Sub'))),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              double numberOne = double.tryParse(
                                      _numberOneController.text.trim()) ??
                                  0;
                              double numberTwo = double.tryParse(
                                      _numberTwoController.text.trim()) ??
                                  0;
                              double result = multi(numberOne, numberTwo);
                              _result = result;
                              setState(() {});
                            }
                          },
                          child: Text('Multi'))),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              double numberOne = double.tryParse(
                                  _numberOneController.text.trim()) ??
                                  0;
                              double numberTwo = double.tryParse(
                                  _numberTwoController.text.trim()) ??
                                  0;
                              double result = divi(numberOne, numberTwo);
                              _result = result;
                              setState(() {});
                            }
                          }, child: Text('divi'))),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            clear();
                            setState(() {});
                          },
                          child: Text('Clear'))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Result: ${_result}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double add(double numberOne, double numberTwo) {
    return numberOne + numberTwo;
  }

  double sub(double numberOne, double numberTwo) {
    return numberOne - numberTwo;
  }

  double multi(double numberOne, double numberTwo) {
    return numberOne * numberTwo;
  }
  double divi(double numberOne, double numberTwo) {
    return numberOne / numberTwo;
  }

  void clear() {
    _numberOneController.clear();
    _numberTwoController.clear();
    _result = 0;
    setState(() {});
  }
}
