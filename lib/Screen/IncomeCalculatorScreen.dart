import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  CalculatorPage createState() => CalculatorPage();
}

class CalculatorPage extends State<Calculator> {
  TextEditingController _taxValueController = new TextEditingController();
  TextEditingController _overHeadLessController = new TextEditingController();
  TextEditingController _lessMakerValueController = new TextEditingController();
  TextEditingController _kRateController = new TextEditingController();
  TextEditingController _totalKValueController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "محاسبه کارانه",
          maxLines: 1,
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: 16.0),
        ),
        backgroundColor: Color.fromRGBO(123, 202, 204, 10),
      ),
      body: new Card(
        elevation: 10.0,
        margin: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: new Stack(fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                child: new Column(
                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Row(
//                        children: <Widget>[
//                          new Text(" مقدار K: "),
//                          new TextField(
//                            controller: _totalKValueController,
//                            keyboardType: TextInputType.number,
//                          ),
//                        ],
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Row(
//                        children: <Widget>[
//                          new Text(" تعرفه k: "),
//                          new TextField(
//                            controller: _kRateController,
//                            keyboardType: TextInputType.number,
//                          ),
//                        ],
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: new TextField(),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Row(
//                        children: <Widget>[
//                          new Text(" میزان کسورات: "),
//                          new TextField(
//                            controller: _lessMakerValueController,
//                            keyboardType: TextInputType.number,
//                          ),
//                        ],
//                      ),
//                    ),
//                    Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Row(
//                        children: <Widget>[
//                          new Text(" کسر بالاسری: "),
//                          new TextField(
//                            controller: _overHeadLessController,
//                            keyboardType: TextInputType.number,
//                          ),
//                        ],
//                      ),
//                    ),


                    new Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.assignment_turned_in ),
                            hintText: "مقدار K",hintStyle: TextStyle(fontFamily: 'Shabnam',),),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          controller: _totalKValueController,
                          enabled: true,
                          autofocus: false,
                          keyboardType: TextInputType.number,

                        ),
                      ),

                    ),

                    new Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.assignment),
                            hintText: "تعرفه K",hintStyle: TextStyle(fontFamily: 'Shabnam',),),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          controller: _kRateController,
                          enabled: true,
                          autofocus: false,
                          keyboardType: TextInputType.number,

                        ),
                      ),

                    ),

                    new Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.assignment_returned),
                            hintText: "میزان کسورات",hintStyle: TextStyle(fontFamily: 'Shabnam',),),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          controller: _lessMakerValueController,
                          enabled: true,
                          autofocus: false,
                          keyboardType: TextInputType.number,

                        ),
                      ),

                    ),

                    new Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.assessment),
                            hintText: "کسر بالاسری",hintStyle: TextStyle(fontFamily: 'Shabnam',),),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          controller: _overHeadLessController,
                          enabled: true,
                          autofocus: false,
                          keyboardType: TextInputType.number,

                        ),
                      ),

                    ),

                    new Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.assignment_late),
                              hintText: "میزان مالیات",hintStyle: TextStyle(fontFamily: 'Shabnam',),),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          controller: _taxValueController,
                          enabled: true,
                          autofocus: false,
                          keyboardType: TextInputType.number,

                        ),
                      ),

                    ),

                    new SizedBox(height: 30.0,),

                    new Container(
                      child: new Card(
                        elevation: 15.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Icon(Icons.monetization_on,color: Colors.black,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Text("مقدار نهایی (تومان): ",textAlign: TextAlign.right,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new Text("0"),
                            )
                          ],
                        ),
                      ),
                    ),

                    new SizedBox(
                      height: 30.0,
                    ),

                    Container(
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new RaisedButton(
                            onPressed: () {},
                            padding: EdgeInsets.all(8.0),
                            color: Colors.blue[200],
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            child: new Text(
                              "محاسبه کارانه",
                              style: TextStyle(color: Colors.white),

                            ),
                          ),
                          new SizedBox(width: 30.0,),
                          new RaisedButton(
                            onPressed: () {},
                            padding: EdgeInsets.all(8.0),
                            color: Colors.blue[200],
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            child: new Text(
                              "اعمال مقادیر پیش فرض",
                              maxLines: 1,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
