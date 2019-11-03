import 'package:pezeshk_yar/Constant/Constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pezeshk_yar/Constant/globalVariables.dart' as globalVariables;

class HomeScreen extends StatefulWidget {

  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    globalVariables.isLoggedIn = true;

    return new Scaffold(
      /* appBar: AppBar(
          title: new Text("Home Page"),
        ),*/
      backgroundColor: Colors.white,
//      floatingActionButton: Container(
//        child: FloatingActionButton(
//          onPressed: () {},
//          child: Icon(Icons.message),
//          elevation: 10.0,
//          backgroundColor: Colors.blue,
//        ),
//      ),
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            child: new Image(
              image: new AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ), //backgroundImage
          ),//background image
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 200.0,
              ),
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(left: 8.0, bottom: 8.0),
                    width: 130.0,
                    height: 130.0,
                    child: new RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      color: Colors.white,
                      elevation: 10.0,
                      onPressed: () {
                        Navigator.of(context).pushNamed(SEARCH_SCREEN);
                      },
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Center(
                              child: Image(
                                image: AssetImage("assets/images/search.png"),
                                width: 60.0,
                                height: 60.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: Text(
                                'جستجوی کد',
                                style: TextStyle(
                                    fontSize: 14.0, fontFamily: 'Shabnam'),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ), //searchCodes

                  new Container(
                    margin: EdgeInsets.only(right: 8.0, bottom: 8.0),
                    width: 130.0,
                    height: 130.0,
                    child: new RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      color: Colors.white,
                      elevation: 10.0,
                      onPressed: () {
                        Navigator.of(context).pushNamed(SAVED_SCREEN);
                      },
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Center(
                              child: Image(
                                image: AssetImage("assets/images/saved.png"),
                                width: 60.0,
                                height: 60.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: Text(
                                'کدهای ذخیره شده',
                                style: TextStyle(
                                    fontSize: 14.0, fontFamily: 'Shabnam'),
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ), //savedCodes
                ],
              ),//search section+saved section
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //محاسبه کارانه
                  //income calculator section
                  new Container(
                    margin: EdgeInsets.only(left: 8.0, top: 8.0),
                    width: 130.0,
                    height: 130.0,
                    child: new RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      color: Colors.white,
                      elevation: 10.0,
                      onPressed: (){
                        Navigator.of(context).pushNamed(INCOME_CALCULATOR_SCREEN);

                      },
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Center(
                              child: Container(
                                child: Image(
                                  image:
                                      AssetImage("assets/images/calculate.png"),
                                  width: 60.0,
                                  height: 60.0,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: Text(
                                'محاسبه کارانه',
                                style: TextStyle(
                                    fontSize: 14.0, fontFamily: 'Shabnam'),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  //description section
                  // توضیحات
                  new Container(
                    margin: EdgeInsets.only(right: 8.0, top: 8.0),
                    width: 130.0,
                    height: 130.0,
                    child: new RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      color: Colors.white,
                      elevation: 10.0,
                      onPressed: () {
                        Navigator.of(context).pushNamed(DESCRIPTION_SCREEN);
                      },
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: Center(
                              child: Image(
                                image:
                                    AssetImage("assets/images/description.png"),
                                width: 60.0,
                                height: 60.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: Text(
                                'توضیحات',
                                style: TextStyle(
                                    fontSize: 14.0, fontFamily: 'Shabnam'),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ), //income calculator section+ description section
            ],
          ),
          new Column(
            children: <Widget>[
              SizedBox(height: 100.0),
              Center(
                child: Container(height: 120.0,width: 120.0,
                  decoration: BoxDecoration(shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/image.jpg'),fit: BoxFit.fill)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
