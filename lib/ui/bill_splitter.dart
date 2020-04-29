import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _person = 1;
  int _tipPercentage = 0;
  double _billAmount = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 30.0),
              decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Total per Person",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "\$${calculateTotalperPerson()}",
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(30.0),
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: Colors.purple.shade50, width: 2.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Bill Amount"),
                  TextField(
                    controller: TextEditingController()..text = "$_billAmount",
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value) => _changeBillAmount(value),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Split to"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              onTap: () => _decreasePerson(),
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.purple.shade50,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                "$_person",
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => _increasePerson(),
                              child: Container(
                                padding: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  color: Colors.purple.shade50,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Tip"),
                        Text(
                          "\$${calculateTip()}",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "$_tipPercentage%",
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Slider(
                        min: 0.0,
                        max: 100.0,
                        divisions: 10,
                        activeColor: Colors.purple,
                        inactiveColor: Colors.grey.shade300,
                        value: _tipPercentage.toDouble(),
                        onChanged: (double value) => _sliderChange(value),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _changeBillAmount(String value) {
    try {
      _billAmount = double.parse(value);
    } catch (e) {
      _billAmount = 100.0;
    }
  }

  _decreasePerson() {
    setState(() {
      _person == 1 ? _person = 1 : _person--;
    });
  }

  _increasePerson() {
    setState(() {
      _person++;
    });
  }

  _sliderChange(double value) {
    setState(() {
      _tipPercentage = value.round();
    });
  }

  String calculateTotalperPerson() {
    return (_billAmount * ((_tipPercentage / 100) + 1) / _person).toStringAsFixed(2);
  }

  String calculateTip() {
    return (_tipPercentage / 100 * _billAmount).toStringAsFixed(2);
  }
}
