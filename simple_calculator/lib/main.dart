import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Simple Interest Calculator",
                style: TextStyle(fontFamily: "Tinos", fontSize: 20),
              ),
              backgroundColor: const Color(0xFFDEF1FE),
            ),
            body: Center(
              child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/icon3.png',
                        height: 150,
                        width: 150,
                      ),
                      const SimpleInterestForm()
                    ],
                  )),
            )));
  }
}

class SimpleInterestForm extends StatefulWidget {
  const SimpleInterestForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SimpleForm();
  }
}

class _SimpleForm extends State<SimpleInterestForm> {
  final _currencies = ["Dollar", "Rupee", "Yen"];
  String _selectedCurrency = 'Rupee';

  TextEditingController timeController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController principalController = TextEditingController();
  var displayResult = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          TextField(
            controller: principalController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: "Principal",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.number,
            controller: roiController,
            decoration: const InputDecoration(
              labelText: "Rate Of Interest",
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFDEF1FE))),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: timeController,
                  decoration: const InputDecoration(
                    labelText: "Time (in years)",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFDEF1FE))),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 180, 178, 178),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    value: _selectedCurrency,
                    items: _currencies.map((String currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Text(currency),
                      );
                    }).toList(),
                    onChanged: (newitem) {
                      setState(() {
                        _selectedCurrency = newitem!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDEF1FE),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      minimumSize: const Size(120, 50),
                      textStyle: const TextStyle(color: Colors.black)),
                  onPressed: () {
                    setState(() {
                      displayResult = _Calculate();
                    });
                  },
                  child: const Text('Calculate'),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      minimumSize: const Size(120, 50)),
                  onPressed: () {
                    setState(() {
                      _Reset();
                    });
                  },
                  child: const Text('Reset'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(displayResult),
          )
        ],
      ),
    );
  }

  String _Calculate() {
    double principal = double.parse(principalController.text);
    double term = double.parse(timeController.text);
    double rate = double.parse(roiController.text);
    var roi = principal + (principal * term * rate) / 100;

    return "After $term  Year . Your investment will be worth of  $roi  in $_selectedCurrency";
  }

  void _Reset() {
    displayResult = '';
    timeController.clear();
    principalController.clear();
    roiController.clear();
    _selectedCurrency = "Rupee";
  }
}
