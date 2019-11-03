import 'package:flutter/material.dart';
import 'package:jalali_date/jalali_date.dart';

//import 'package:pezeshk_yar/Constant/Constant.dart';
//import 'Database.dart';
//import 'CodeNewModel.dart';
import 'package:pezeshk_yar/Screen/CodeNewModel.dart';
import 'package:pezeshk_yar/Screen/Database.dart';
import 'package:persian_datepicker/persian_datepicker.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class SavedCode extends StatefulWidget {
  @override
  _SavedCodeState createState() => _SavedCodeState();
}

class _SavedCodeState extends State<SavedCode>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  String _codeSumDay = '0';
  String _codeSumMonth = '0';
  String _codeSumRange = '0';

  double _sumOfTodayK = 0.0;
  double _sumOfMonthk = 0.0;
  double _sumOfAll = 0.0;

  String _sumOfAllFinal = " ";
  String _sumOfMonthFinal = " ";
  String _sumOfDayFinal = " ";

  TextEditingController _patientNameController = new TextEditingController();
  TextEditingController _caseNumberController = new TextEditingController();
  TextEditingController _codeIdController = new TextEditingController();
  TextEditingController _datePickerController = new TextEditingController();

  bool _flagTodaySum;

  void _displaySum() async {
    var list = await DBProvider.db.getAllCodeNews();
    var list1 = await DBProvider.db.getTodayCodeNews();
    var list2 = await DBProvider.db.getMonthCodeNews();
    _codeSumRange = list.length.toString();
    _codeSumDay = list1.length.toString();
    _codeSumMonth = list2.length.toString();

    List<CodeNew> _listToday = [];
    _listToday = list1;
    List<CodeNew> _listMonth = list2;
    List<CodeNew> _listAll = list;
    print('hello');
    print(_sumOfTodayK);
    if (_listToday.length == 0) {
      _sumOfDayFinal = "0.0";
    } else {
      _sumOfTodayK = 0.00;
      for (var i = 0; i < _listToday.length; i++) {
        double dayDouble = double.tryParse(_listToday[i].proRate);

        _sumOfTodayK = dayDouble + _sumOfTodayK;
        _sumOfDayFinal = _sumOfTodayK.toStringAsFixed(2);
      }
    }

    if (_listMonth.length == 0) {
      _sumOfMonthFinal = '0.0';
    } else {
      _sumOfMonthk = 0.00;
      for (var j = 0; j < _listMonth.length; j++) {
        double monthDouble = double.tryParse(_listMonth[j].proRate);
        _sumOfMonthk = monthDouble + _sumOfMonthk;
        _sumOfMonthFinal = _sumOfMonthk.toStringAsFixed(2);
      }
    }

    if (_listAll.length == 0) {
      _sumOfAllFinal = '0.0';
    } else {
      _sumOfAll = 0.00;
      for (var k = 0; k < _listAll.length; k++) {
        double allDouble = double.tryParse(_listAll[k].proRate);
        _sumOfAll = allDouble + _sumOfAll;
        _sumOfAllFinal = _sumOfAll.toStringAsFixed(2);
      }
    }

//    _sumOfAllFinal =  _sumOfAll.toString();
//    _sumOfAllFinal = _sumOfAllFinal.to

    setState(() {});
  }

  void _displayK() async {}

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    _tabController.addListener(_handleTabIndex);
    _flagTodaySum = true;

    _displaySum();
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //List<Widget> widgetList = [];

//    return MaterialApp(

//
//      debugShowChetheme: ThemeData(
////        brightness: Brightness.dark,
////        primaryColor: Color.fromRGBO(123, 202, 204, 10.0),
////        accentColor: Color.fromRGBO(123, 202, 204, 10.0)
//          ),ckedModeBanner: false,
//      home:
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(123, 202, 204, 10.0),
        title: Text(
          "کدهای ذخیره شده",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16.0,
            fontFamily: 'Shabnam',
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(
                Icons.today,
                color: Colors.white,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(right: 4.0, left: 4.0),
                    decoration: BoxDecoration(
                        color: Colors.red[300],
                        borderRadius: BorderRadius.circular(5.0)),
                    child: new Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(_codeSumDay),
                      ),
                    ),
                  ),
                  new Text(
                    "روزانه",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontFamily: 'Shabnam', color: Colors.white),
                  ),
                ],
              ),
//                  icon: Icon(Icons.today),
//                  text: "روزانه",
            ),
            Tab(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(right: 4.0, left: 4.0),
                    decoration: BoxDecoration(
                        color: Colors.red[300],
                        borderRadius: BorderRadius.circular(5.0)),
                    child: new Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(_codeSumMonth),
                      ),
                    ),
                  ),
                  new Text(
                    "ماهانه",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontFamily: 'Shabnam', color: Colors.white),
                  ),
                ],
              ),
              icon: Icon(
                Icons.calendar_today,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.calendar_view_day,
                color: Colors.white,
              ),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(right: 4.0, left: 4.0),
                    decoration: BoxDecoration(
                        color: Colors.red[300],
                        borderRadius: BorderRadius.circular(5.0)),
                    child: new Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(_codeSumRange),
                      ),
                    ),
                  ),
                  new Text(
                    "بازه دلخواه",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontFamily: 'Shabnam', color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: new Column(
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Container(
                    height: 50.0,
                    margin: EdgeInsets.only(bottom: 2.0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(78, 162, 162, 10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 4.0),
                          child: new Icon(
                            Icons.playlist_add_check,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: new Text(
                            " مجموع کل  K : ",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Shabnam'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red[400],
                                  borderRadius: BorderRadius.circular(4.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Text(
                                  _sumOfDayFinal,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Shabnam',
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                new Expanded(
                    flex: 9,
                    child: new Container(
                      child: new
                          //Today Saved codes List
                          Padding(
                        padding: const EdgeInsets.only(
                            right: 4.0, left: 4.0, top: 2.0, bottom: 4.0),
                        child: new FutureBuilder<List<CodeNew>>(
                          future: DBProvider.db.getTodayCodeNews(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<CodeNew>> snapshot) {
                            if (snapshot.hasData) {
                              return new ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  CodeNew item = snapshot.data[index];
//                                      for(var i = 0; i < snapshot.data.length; i++){
//                                        if(_flagTodaySum){
//                                          _sumOfTodayK = double.tryParse(item.proRate) + _sumOfTodayK;
//
//                                        }
//                                        _flagTodaySum = false;
//
//                                      }

//                                      _sumOfTodayK = double.tryParse(item.proRate) + _sumOfTodayK;

                                  return new Card(
                                    elevation: 8.0,
                                    child: new ListTile(
                                      title: new Text(
                                        item.data,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(fontFamily: 'Shabnam'),
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            child: new Column(
                                              children: <Widget>[
                                                new Text(
                                                  "کد شماره: " + item.codeId,
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontFamily: 'Shabnam'),
                                                ),
                                                new Text(
                                                  "تاریخ ثبت: " +
                                                      item.time +
                                                      " , " +
                                                      item.date,
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontFamily: 'Shabnam'),
                                                ),



                                        ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 70.0,
                                          ),
                                          Container(
                                            child: IconButton(
                                              icon: Icon(Icons.delete_forever),
                                              onPressed: () async {
                                                DBProvider.db
                                                    .deleteCodeNew(item.id);
                                                _displaySum();
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    margin: const EdgeInsets.all(4.0),
                                  );
                                },
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ))
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(0.0),
            child: new Column(
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Container(
                    height: 50.0,
                    margin: EdgeInsets.only(bottom: 2.0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(78, 162, 162, 10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 4.0),
                          child: new Icon(
                            Icons.playlist_add_check,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: new Text(
                            " مجموع کل  K : ",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Shabnam'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red[400],
                                  borderRadius: BorderRadius.circular(4.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Text(
                                  _sumOfMonthFinal,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Shabnam',
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                new Expanded(
                    flex: 9,
                    child: new Container(
                      child: //This month Saved codes
                          Padding(
                        padding: const EdgeInsets.only(
                            right: 4.0, left: 4.0, top: 2.0, bottom: 4.0),
                        child: new FutureBuilder<List<CodeNew>>(
                          future: DBProvider.db.getMonthCodeNews(),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<CodeNew>> snapshot) {
                            if (snapshot.hasData) {
                              return new ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  CodeNew item = snapshot.data[index];
                                  return new Card(
                                    elevation: 8.0,
                                    child: new ListTile(
                                      title: new Text(
                                        item.data,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(fontFamily: 'Shabnam'),
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            child: new Column(
                                              children: <Widget>[
                                                new Text(
                                                  "کد شماره: " + item.codeId,
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontFamily: 'Shabnam'),
                                                ),
                                                new Text(
                                                  "تاریخ ثبت: " +
                                                      item.time +
                                                      " , " +
                                                      item.date,
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                      fontFamily: 'Shabnam'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 70.0,
                                          ),
                                          Container(
                                            child: IconButton(
                                              icon: Icon(Icons.delete_forever),
                                              onPressed: () async {
                                                DBProvider.db
                                                    .deleteCodeNew(item.id);
                                                _displaySum();
                                                setState(() {});
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    margin: const EdgeInsets.all(4.0),
                                  );
                                },
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ))
              ],
            ),
          ),

          //Range Saved codes
          //listview part
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: <Widget>[
                new Expanded(
                  flex: 1,
                  child: new Container(
                    height: 50.0,
                    margin: EdgeInsets.only(bottom: 2.0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(78, 162, 162, 10.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 4.0),
                          child: new Icon(
                            Icons.playlist_add_check,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: new Text(
                            " مجموع کل  K : ",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Shabnam'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red[400],
                                  borderRadius: BorderRadius.circular(4.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Text(
                                  _sumOfAllFinal,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Shabnam',
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                new Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 4.0, right: 4.0, top: 2.0, bottom: 4.0),
                    child: new Container(
                      child: new FutureBuilder<List<CodeNew>>(
                        future: DBProvider.db.getAllCodeNews(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<CodeNew>> snapshot) {
                          if (snapshot.hasData) {
                            return new ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                CodeNew item = snapshot.data[index];
                                return new Card(
                                  elevation: 8.0,
                                  child: new ListTile(
                                    title: new Text(
                                      item.data,
                                      textAlign: TextAlign.right,
                                      style: TextStyle(fontFamily: 'Shabnam'),
                                    ),
                                    subtitle: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          child: new Column(
                                            children: <Widget>[
                                              new Text(
                                                "کد شماره: " + item.codeId,
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontFamily: 'Shabnam'),
                                              ),
                                              new Text(
                                                "تاریخ ثبت: " +
                                                    item.time +
                                                    " , " +
                                                    item.date,
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                    fontFamily: 'Shabnam'),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 70.0,
                                        ),
                                        Container(
                                          child: IconButton(
                                            icon: Icon(Icons.delete_forever),
                                            onPressed: () async {
                                              DBProvider.db
                                                  .deleteCodeNew(item.id);
                                              _displaySum();
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  margin: const EdgeInsets.all(4.0),
                                );
                              },
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ),
                ),
                new Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 2.0, right: 2.0, left: 2.0, top: 0.0),
                      child: new Card(
                        elevation: 20.0,
                        color: Colors.white,
                        child: new Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0))),
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new TextField(
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.assignment_ind),
                                      hintText: "نام بیمار",
                                      hintStyle:
                                          TextStyle(fontFamily: 'Shabnam')),
                                  textAlign: TextAlign.right,
                                  maxLines: 1,
                                  controller: _patientNameController,
                                  enabled: true,
                                  autofocus: false,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new TextField(
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.assignment),
                                      hintText: "شماره پرونده",
                                      hintStyle:
                                          TextStyle(fontFamily: 'Shabnam')),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.right,
                                  maxLines: 1,
                                  controller: _caseNumberController,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new TextField(
                                  decoration: InputDecoration(
                                      suffixIcon:
                                          Icon(Icons.assignment_turned_in),
                                      hintText: "شماره کد",
                                      hintStyle:
                                          TextStyle(fontFamily: 'Shabnam')),
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  textAlign: TextAlign.right,
                                  controller: _codeIdController,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: new Container(
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0,
                                            bottom: 2.0,
                                            left: 4.0,
                                            right: 4.0),
                                        child: new Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue[200],
                                              borderRadius:
                                                  BorderRadius.circular(4.0)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: new Text(
                                                PersianDate.fromDateTime(
                                                        DateTime.parse(
                                                            DateTime.now()
                                                                .toString()))
                                                    .toString()),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0,
                                            bottom: 2.0,
                                            right: 4.0,
                                            left: 4.0),
                                        child: new Text(
                                          "تا",
                                          style:
                                              TextStyle(fontFamily: 'Shabnam'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0,
                                            bottom: 2.0,
                                            left: 4.0,
                                            right: 4.0),
                                        child: new Icon(Icons.date_range),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0,
                                            bottom: 2.0,
                                            left: 4.0,
                                            right: 4.0),
                                        child: new Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blue[200],
                                              borderRadius:
                                                  BorderRadius.circular(4.0)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: new Text(
                                                PersianDate.fromDateTime(
                                                        DateTime.parse(
                                                            DateTime.now()
                                                                .toString()))
                                                    .toString()),
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0,
                                            bottom: 2.0,
                                            right: 4.0,
                                            left: 4.0),
                                        child: new Text(
                                          "از",
                                          style:
                                              TextStyle(fontFamily: 'Shabnam'),
                                        ),
                                      ),
//                                        Column(
//                                          children: <Widget>[
//                                            new Container(child: PersianDatePickerWidget(),),
//                                            new TextField(
//                                              onTap: (){
//                                                FocusScope.of(context).requestFocus(new FocusNode());
//                                              },
//                                              enableInteractiveSelection: false,
//                                              controller: _datePickerController,
//                                            )
//                                          ],
//                                        ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0,
                                            bottom: 2.0,
                                            right: 4.0,
                                            left: 4.0),
                                        child: new Icon(
                                          Icons.date_range,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 2.0,
                                    bottom: 10.0,
                                    left: 6.0,
                                    right: 6.0),
                                child: new RaisedButton(
                                  onPressed: () {},
                                  elevation: 15.0,
                                  color: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: new Center(
                                    child: new Text(
                                      "جستجو",
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Shabnam'),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
//          floatingActionButton: _searchRangeButton(),
    );

    // implement build
  }

//
//  DefaultTabController(
//  length: 3,
//  child: Scaffold(
//  appBar: AppBar(
//  textTheme: TextTheme(
//  title: TextStyle(fontFamily: 'Shabnam', fontSize: 16.0)),
//  brightness: Brightness.light,
//  elevation: 10.0,
//  backgroundColor: Color.fromRGBO(123, 202, 204, 10.0),
//  bottom: TabBar(
//  controller: _tabController,
//  tabs: [
//  Tab(
//  icon: Icon(
//  Icons.calendar_view_day,
//  color: Colors.white,
//  ),
//  child: new Row(
//  mainAxisAlignment: MainAxisAlignment.center,
//  children: <Widget>[
//  new Container(
//  margin: EdgeInsets.only(right: 4.0, left: 4.0),
//  decoration: BoxDecoration(
//  color: Colors.red[300],
//  borderRadius: BorderRadius.circular(5.0)),
//  child: new Center(
//  child: Padding(
//  padding: const EdgeInsets.all(2.0),
//  child: Text(_codeSumRange),
//  ),
//  ),
//  ),
//  new Text(
//  "بازه دلخواه",
//  textAlign: TextAlign.center,
//  style: TextStyle(
//  fontFamily: 'Shabnam', color: Colors.white),
//  ),
//  ],
//  ),
//  ),
//  Tab(
//  child: new Row(
//  mainAxisAlignment: MainAxisAlignment.center,
//  children: <Widget>[
//  new Container(
//  margin: EdgeInsets.only(right: 4.0, left: 4.0),
//  decoration: BoxDecoration(
//  color: Colors.red[300],
//  borderRadius: BorderRadius.circular(5.0)),
//  child: new Center(
//  child: Padding(
//  padding: const EdgeInsets.all(2.0),
//  child: Text(_codeSumMonth),
//  ),
//  ),
//  ),
//  new Text(
//  "ماهانه",
//  textAlign: TextAlign.center,
//  style: TextStyle(
//  fontFamily: 'Shabnam', color: Colors.white),
//  ),
//  ],
//  ),
//  icon: Icon(
//  Icons.calendar_today,
//  color: Colors.white,
//  ),
//  ),
//  Tab(
//  icon: Icon(
//  Icons.today,
//  color: Colors.white,
//  ),
//  child: new Row(
//  mainAxisAlignment: MainAxisAlignment.center,
//  children: <Widget>[
//  new Container(
//  margin: EdgeInsets.only(right: 4.0, left: 4.0),
//  decoration: BoxDecoration(
//  color: Colors.red[300],
//  borderRadius: BorderRadius.circular(5.0)),
//  child: new Center(
//  child: Padding(
//  padding: const EdgeInsets.all(2.0),
//  child: Text(_codeSumDay),
//  ),
//  ),
//  ),
//  new Text(
//  "روزانه",
//  textAlign: TextAlign.center,
//  style: TextStyle(
//  fontFamily: 'Shabnam', color: Colors.white),
//  ),
//  ],
//  ),
////                  icon: Icon(Icons.today),
////                  text: "روزانه",
//  ),
//  ],
//  ),
//  title: Text(
//  'کدهای ذخیره شده',
//  textAlign: TextAlign.right,
//  style: TextStyle(
//  fontFamily: 'Shabnam',
//  color: Colors.white,
//  ),
//  ),
//  ),
//  body: new TabBarView(
//  controller: _tabController,
//  children: [
//  //Range Saved codes
//  //listview part
//  Padding(
//  padding: const EdgeInsets.all(0.0),
//  child: Column(
//  children: <Widget>[
//  new Expanded(
//  flex: 1,
//  child: new Container(
//  height: 50.0,
//  margin: EdgeInsets.only(bottom: 2.0),
//  decoration: BoxDecoration(
//  color: Color.fromRGBO(78, 162, 162, 10.0)),
//  child: Row(
//  mainAxisAlignment: MainAxisAlignment.end,
//  crossAxisAlignment: CrossAxisAlignment.center,
//  mainAxisSize: MainAxisSize.max,
//  children: <Widget>[
//  Padding(
//  padding: const EdgeInsets.all(2.0),
//  child: Container(
//  decoration: BoxDecoration(
//  color: Colors.red[200],
//  borderRadius: BorderRadius.circular(4.0)),
//  child: Padding(
//  padding: const EdgeInsets.all(2.0),
//  child: new Text(
//  _sumOfAllFinal,
//  textAlign: TextAlign.center,
//  style: TextStyle(
//  color: Colors.white,
//  fontFamily: 'Shabnam',
//  ),
//  ),
//  )),
//  ),
//  Padding(
//  padding: const EdgeInsets.only(right: 8.0),
//  child: new Text(
//  " :k مجموع کل  ",
//  textAlign: TextAlign.right,
//  style: TextStyle(
//  color: Colors.white, fontFamily: 'Shabnam'),
//  ),
//  ),
//  Padding(
//  padding:
//  const EdgeInsets.only(right: 4.0, left: 4.0),
//  child: new Icon(
//  Icons.playlist_add_check,
//  color: Colors.white,
//  ),
//  ),
//  ],
//  ),
//  ),
//  ),
//  new Expanded(
//  flex: 3,
//  child: Padding(
//  padding: const EdgeInsets.only(
//  left: 4.0, right: 4.0, top: 2.0, bottom: 4.0),
//  child: new Container(
//  child: new FutureBuilder<List<CodeNew>>(
//  future: DBProvider.db.getAllCodeNews(),
//  builder: (BuildContext context,
//      AsyncSnapshot<List<CodeNew>> snapshot) {
//  if (snapshot.hasData) {
//  return new ListView.builder(
//  itemCount: snapshot.data.length,
//  itemBuilder:
//  (BuildContext context, int index) {
//  CodeNew item = snapshot.data[index];
//  return new Card(
//  elevation: 8.0,
//  child: new ListTile(
//  leading: IconButton(
//  icon: Icon(Icons.delete_forever),
//  onPressed: () async {
//  DBProvider.db
//      .deleteCodeNew(item.id);
//  _displaySum();
//  setState(() {});
//  },
//  ),
//  title: new Text(
//  item.codeId + " :کد شماره ",
//  textAlign: TextAlign.right,
//  style:
//  TextStyle(fontFamily: 'Shabnam'),
//  ),
//  subtitle: new Column(
//  crossAxisAlignment:
//  CrossAxisAlignment.end,
//  children: <Widget>[
//  new Text(
//  item.data,
//  textAlign: TextAlign.right,
//  style: TextStyle(
//  fontFamily: 'Shabnam'),
//  ),
//  new Text(
//  item.date + " :تاریخ ثبت ",
//  textAlign: TextAlign.right,
//  style: TextStyle(
//  fontFamily: 'Shabnam'),
//  ),
////                                            new Text(item.day + "/" + item.month + "/" + item.year + " " + item.time),
////                                            new Text(item.date),
//  new Text(item.time + " :زمان ثبت ",textAlign: TextAlign.right,style: TextStyle(fontFamily: 'Shabnam'),),
//  new Text(
//  " نام بیمار: " + item.name,
//  textAlign: TextAlign.right,
//  style: TextStyle(
//  fontFamily: 'Shabnam'),
//  ),
//  new Text(
//  item.caseNum + " :شماره پرونده ",
//  textAlign: TextAlign.right,
//  style: TextStyle(
//  fontFamily: 'Shabnam'),
//  ),
//  new Text(
//  item.proRate + " :ضریب حرفه ای  ",
//  textAlign: TextAlign.right,
//  style: TextStyle(
//  fontFamily: 'Shabnam'),
//  ),
//
////                                new Text(
////                                  item.techRate + ":ضریب فنی ",
////                                  textAlign: TextAlign.right,
////                                  style: TextStyle(fontFamily: 'Shabnam'),
////                                ),
////                                new Text(
////                                  item.valueRate + " :ضریب ارزشی ",
////                                  textAlign: TextAlign.right,
////                                  style: TextStyle(fontFamily: 'Shabnam'),
////                                ),
//  ],
//  ),
//  ),
//  margin: const EdgeInsets.all(4.0),
//  );
//  },
//  );
//  } else {
//  return Center(
//  child: CircularProgressIndicator());
//  }
//  },
//  ),
//  ),
//  ),
//  ),
//  new Expanded(
//  flex: 6,
//  child: Padding(
//  padding: const EdgeInsets.only(bottom:2.0,right: 2.0,left: 2.0,top: 0.0),
//  child: new Card(
//  elevation: 20.0,
//  color: Colors.white,
//  child: new Container(
//  decoration: BoxDecoration(
//  borderRadius:
//  BorderRadius.all(Radius.circular(8.0))),
//  child: new Column(
//  crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.end,
//  children: <Widget>[
//  Padding(
//  padding: const EdgeInsets.all(8.0),
//  child: new TextField(
//  decoration: InputDecoration(
//  suffixIcon: Icon(Icons.assignment_ind),
//  hintText: "نام بیمار",hintStyle: TextStyle(fontFamily: 'Shabnam')),
//  textAlign: TextAlign.right,
//  maxLines: 1,
//  controller: _patientNameController,
//  enabled: true,
//  autofocus: false,
//
//  ),
//  ),
//  Padding(
//  padding: const EdgeInsets.all(8.0),
//  child: new TextField(
//  decoration: InputDecoration(
//  suffixIcon: Icon(Icons.assignment),
//  hintText: "شماره پرونده",hintStyle: TextStyle(fontFamily: 'Shabnam')
//  ),
//  keyboardType: TextInputType.number,
//  textAlign: TextAlign.right,
//  maxLines: 1,
//  controller: _caseNumberController,
//  ),
//  ),
//  Padding(
//  padding: const EdgeInsets.all(8.0),
//  child: new TextField(
//  decoration: InputDecoration(
//  suffixIcon:
//  Icon(Icons.assignment_turned_in),
//  hintText: "شماره کد",hintStyle: TextStyle(fontFamily: 'Shabnam')
//  ),
//  keyboardType: TextInputType.number,
//  maxLines: 1,
//  textAlign: TextAlign.right,
//  controller: _codeIdController,
//  ),
//  ),
//  Padding(padding: const EdgeInsets.all(2.0),
//  child: new Container(
//  child: new Row(mainAxisAlignment: MainAxisAlignment.center,
//  children: <Widget>[
//  Padding(
//  padding: const EdgeInsets.only(top: 2.0,bottom: 2.0,left: 4.0,right: 4.0),
//  child: new Container(
//  decoration: BoxDecoration(color: Colors.blue[200],borderRadius: BorderRadius.circular(4.0)),
//  child: Padding(
//  padding: const EdgeInsets.all(2.0),
//  child: new Text(PersianDate.fromDateTime(DateTime.parse(DateTime.now().toString())).toString()),
//  ),
//  ),
//  ),
//  Padding(
//  padding: const EdgeInsets.only(top: 2.0,bottom: 2.0,right: 4.0,left: 4.0),
//  child: new Text("تا",style: TextStyle(fontFamily: 'Shabnam'),),
//  ),
//  Padding(
//  padding: const EdgeInsets.only(top: 2.0,bottom: 2.0,left: 4.0,right: 4.0),
//  child: new Icon(Icons.date_range),
//  ),
//  Padding(
//  padding: const EdgeInsets.only(top: 2.0,bottom: 2.0, left: 4.0,right: 4.0),
//  child: new Container(
//  decoration: BoxDecoration(color: Colors.blue[200],borderRadius: BorderRadius.circular(4.0)),
//  child: Padding(
//  padding: const EdgeInsets.all(2.0),
//  child: new Text(PersianDate.fromDateTime(DateTime.parse(DateTime.now().toString())).toString()),
//  ),
//  ),
//  ),
//
//
//  Padding(
//  padding: const EdgeInsets.only(top: 2.0, bottom: 2.0,right: 4.0,left: 4.0),
//  child: new Text("از",style: TextStyle(fontFamily: 'Shabnam'),),
//  ),
////                                        Column(
////                                          children: <Widget>[
////                                            new Container(child: PersianDatePickerWidget(),),
////                                            new TextField(
////                                              onTap: (){
////                                                FocusScope.of(context).requestFocus(new FocusNode());
////                                              },
////                                              enableInteractiveSelection: false,
////                                              controller: _datePickerController,
////                                            )
////                                          ],
////                                        ),
//  Padding(
//  padding: const EdgeInsets.only(top: 2.0, bottom: 2.0, right: 4.0,left: 4.0),
//  child: new Icon(Icons.date_range,),
//  )
//
//  ],
//  ),
//  ),),
//  Padding(padding: const EdgeInsets.only(top: 2.0, bottom: 10.0, left: 6.0,right: 6.0),
//  child: new RaisedButton(
//  onPressed: () {},
//  elevation: 15.0,
//  color: Colors.blue,
//  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//  child: new Center(
//  child: new Text("جستجو",textAlign: TextAlign.center,maxLines: 1,style: TextStyle(color: Colors.white,fontFamily: 'Shabnam'),),
//  ),
//  ),)
//
//  ],
//  ),
//  ),
//  ),
//  ))
//  ],
//  ),
//  ),
//
//  Padding(
//  padding: const EdgeInsets.all(0.0),
//  child: new Column(
//  children: <Widget>[
//  new Expanded(
//  flex: 1,
//  child: new Container(
//  height: 50.0,
//  margin: EdgeInsets.only(bottom: 2.0),
//  decoration: BoxDecoration(
//  color: Color.fromRGBO(78, 162, 162, 10.0)),
//  child: Row(
//  mainAxisAlignment: MainAxisAlignment.end,
//  crossAxisAlignment: CrossAxisAlignment.center,
//  mainAxisSize: MainAxisSize.max,
//  children: <Widget>[
//  Padding(
//  padding: const EdgeInsets.all(2.0),
//  child: Container(
//  decoration: BoxDecoration(
//  color: Colors.red[200],
//  borderRadius: BorderRadius.circular(4.0)),
//  child: Padding(
//  padding: const EdgeInsets.all(2.0),
//  child: new Text(
//  _sumOfMonthFinal,
//  textAlign: TextAlign.center,
//  style: TextStyle(
//  color: Colors.white,
//  fontFamily: 'Shabnam',
//  ),
//  ),
//  )),
//  ),
//  Padding(
//  padding: const EdgeInsets.only(right: 8.0),
//  child: new Text(
//  " :k مجموع کل  ",
//  textAlign: TextAlign.right,
//  style: TextStyle(
//  color: Colors.white, fontFamily: 'Shabnam'),
//  ),
//  ),
//  Padding(
//  padding:
//  const EdgeInsets.only(right: 4.0, left: 4.0),
//  child: new Icon(
//  Icons.playlist_add_check,
//  color: Colors.white,
//  ),
//  ),
//  ],
//  ),
//  ),
//  ),
//  new Expanded(
//  flex: 9,
//  child: new Container(
//  child: //This month Saved codes
//  Padding(
//  padding: const EdgeInsets.only(
//  right: 4.0, left: 4.0, top: 2.0, bottom: 4.0),
//  child: new FutureBuilder<List<CodeNew>>(
//  future: DBProvider.db.getMonthCodeNews(),
//  builder: (BuildContext context,
//      AsyncSnapshot<List<CodeNew>> snapshot) {
//  if (snapshot.hasData) {
//  return new ListView.builder(
//  itemCount: snapshot.data.length,
//  itemBuilder:
//  (BuildContext context, int index) {
//  CodeNew item = snapshot.data[index];
//  return new Card(
//  elevation: 8.0,
//  child: new ListTile(
//  leading: IconButton(
//  icon: Icon(Icons.delete_forever),
//  onPressed: () async {
//  DBProvider.db
//      .deleteCodeNew(item.id);
//  _displaySum();
//  setState(() {});
//  },
//  ),
//  title: new Text(
//  item.codeId + " :کد شماره ",
//  textAlign: TextAlign.right,
//  style: TextStyle(
//  fontFamily: 'Shabnam'),
//  ),
//  subtitle: new Column(
//  children: <Widget>[
//  new Text(
//  item.data,
//  textAlign: TextAlign.right,
//  style: TextStyle(
//  fontFamily: 'Shabnam'),
//  ),
//  new Text(
//  item.date + " :زمان ثبت ",
//  textAlign: TextAlign.right,
//  style: TextStyle(
//  fontFamily: 'Shabnam'),
//  ),
//  ],
//  ),
//  ),
//  margin: const EdgeInsets.all(4.0),
//  );
//  },
//  );
//  } else {
//  return Center(
//  child: CircularProgressIndicator());
//  }
//  },
//  ),
//  ),
//  ))
//  ],
//  ),
//  ),
//
//  Padding(
//  padding: const EdgeInsets.all(0.0),
//  child: new Column(
//  children: <Widget>[
//  new Expanded(
//  flex: 1,
//  child: new Container(
//  height: 50.0,
//  margin: EdgeInsets.only(bottom: 2.0),
//  decoration: BoxDecoration(
//  color: Color.fromRGBO(78, 162, 162, 10.0)),
//  child: Row(
//  mainAxisAlignment: MainAxisAlignment.end,
//  crossAxisAlignment: CrossAxisAlignment.center,
//  mainAxisSize: MainAxisSize.max,
//  children: <Widget>[
//  Padding(
//  padding: const EdgeInsets.all(2.0),
//  child: Container(
//  decoration: BoxDecoration(
//  color: Colors.red[200],
//  borderRadius: BorderRadius.circular(4.0)),
//  child: Padding(
//  padding: const EdgeInsets.all(2.0),
//  child: new Text(
//  _sumOfDayFinal,
//  textAlign: TextAlign.center,
//  style: TextStyle(
//  color: Colors.white,
//  fontFamily: 'Shabnam',
//  ),
//  ),
//  )),
//  ),
//  Padding(
//  padding: const EdgeInsets.only(right: 8.0),
//  child: new Text(
//  " :k مجموع کل  ",
//  textAlign: TextAlign.right,
//  style: TextStyle(
//  color: Colors.white, fontFamily: 'Shabnam'),
//  ),
//  ),
//  Padding(
//  padding:
//  const EdgeInsets.only(right: 4.0, left: 4.0),
//  child: new Icon(
//  Icons.playlist_add_check,
//  color: Colors.white,
//  ),
//  ),
//  ],
//  ),
//  ),
//  ),
//  new Expanded(
//  flex: 9,
//  child: new Container(
//  child: new
//  //Today Saved codes List
//  Padding(
//  padding: const EdgeInsets.only(
//  right: 4.0, left: 4.0, top: 2.0, bottom: 4.0),
//  child: new FutureBuilder<List<CodeNew>>(
//  future: DBProvider.db.getTodayCodeNews(),
//  builder: (BuildContext context,
//      AsyncSnapshot<List<CodeNew>> snapshot) {
//  if (snapshot.hasData) {
//  return new ListView.builder(
//  itemCount: snapshot.data.length,
//  itemBuilder:
//  (BuildContext context, int index) {
//  CodeNew item = snapshot.data[index];
////                                      for(var i = 0; i < snapshot.data.length; i++){
////                                        if(_flagTodaySum){
////                                          _sumOfTodayK = double.tryParse(item.proRate) + _sumOfTodayK;
////
////                                        }
////                                        _flagTodaySum = false;
////
////                                      }
//
////                                      _sumOfTodayK = double.tryParse(item.proRate) + _sumOfTodayK;
//
//  return new Card(
//  elevation: 8.0,
//  child: new ListTile(
//  leading: IconButton(
//  icon: Icon(Icons.delete_forever),
//  onPressed: () async {
//  DBProvider.db
//      .deleteCodeNew(item.id);
//  _displaySum();
//  setState(() {});
//  },
//  ),
//  title: new Text(
//  item.codeId + " :کد شماره ",
//  textAlign: TextAlign.right,
//  style: TextStyle(
//  fontFamily: 'Shabnam'),
//  ),
//  subtitle: new Column(
//  children: <Widget>[
//  new Text(
//  item.data,
//  textAlign: TextAlign.right,
//  style: TextStyle(
//  fontFamily: 'Shabnam'),
//  ),
//  new Text(
//  item.date + " :زمان ثبت ",
//  textAlign: TextAlign.right,
//  style: TextStyle(
//  fontFamily: 'Shabnam'),
//  ),
//  ],
//  ),
//  ),
//  margin: const EdgeInsets.all(4.0),
//  );
//  },
//  );
//  } else {
//  return Center(
//  child: CircularProgressIndicator());
//  }
//  },
//  ),
//  ),
//  ))
//  ],
//  ),
//  ),
//
//  ],
//  ),
////          floatingActionButton: _searchRangeButton(),
//  ),
//  ),

  Widget _searchRangeButton() {
    return Container(
      alignment: Alignment(-0.75, 0.9),
      child: _tabController.index == 0
          ? FloatingActionButton(
              shape: StadiumBorder(),
              onPressed: null,
              backgroundColor: Color.fromRGBO(123, 202, 204, 10.0),
              child: Icon(
                Icons.calendar_today,
                size: 20.0,
              ),
            )
          : null,
    );
    /*
        : FloatingActionButton(
      shape: StadiumBorder(),
      onPressed: null,
      backgroundColor: Colors.redAccent,
      child: Icon(
        Icons.edit,
        size: 20.0,
      ),
    );
      */
  }
}
