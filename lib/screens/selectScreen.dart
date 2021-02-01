import 'package:diagnose_me/models/AilmentModel.dart';
import 'package:diagnose_me/screens/ailmentScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatefulWidget {
  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  List<String> lst = ['android','kotlin','flutter'];
  int selectedIndex = 0;
  int _pillIndex = 0 ;
  bool changeColor =  false ;
  List<IconData> iconlist = [Icons.settings,Icons.bookmark, Icons.account_circle];
  int secondaryIndex = 0;
  // var title = ["Fever (High Temperature)","Headache","Nausea","Frequent Stooling","","","","","","","","","","","","","","","","","","","","","","","","","","",]

List<AilmentModel> counterList = List<AilmentModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title:  Container(
          child:  Text('How are u feeling Today',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
         // width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              Container(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Expanded(
                        child: Wrap(
                          children: <Widget>[

                            for(var item in ailmentItem) pill(index: 0, item: item ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                     SizedBox(height: 20,),
                    Container(
                      alignment: Alignment.bottomCenter,
                       width: double.infinity,
                      //  margin: EdgeInsets.symmetric(horizontal: 20),
                      child: RaisedButton(
                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AilmentScreen(model: counterList)));
                        },
                        elevation: 0,
                        color:Colors.deepOrange ,
                        textColor:  Colors.white ,
                        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.yellowAccent),
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Source Sans Pro'),
                        ),
                      ),
                    )
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
  void changeIndex(int index){
    setState(() {
      selectedIndex = index;
    });
  }

    Widget customRadio(String txt,int index){
      return OutlineButton(
        onPressed: () => changeIndex(index),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        borderSide: BorderSide(color: selectedIndex == index ? Colors.cyan : Colors.grey),
        child: Text(txt, style: TextStyle(color: selectedIndex == index ?Colors.cyan : Colors.grey),),
      );
    }

    void changeSecondaryIndex(int index){
    setState(() {
      secondaryIndex = index;
    });
    }
    Widget customRadio2(IconData icon,int index){
    return OutlineButton(
      onPressed: () => changeSecondaryIndex(index),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      borderSide: BorderSide(color: secondaryIndex == index ? Colors.deepOrangeAccent : Colors.grey),
      child: Icon(icon,color: secondaryIndex == index ?Colors.deepOrangeAccent : Colors.grey),
    );
  }

  Widget pill({int index, AilmentModel item,  VoidCallback onPressed}) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(top: 10,right: 10),
      child: ButtonTheme(
        minWidth: 56,
        child: RaisedButton(
          onPressed: onPressed ??
                  () {
                    if(counterList.length < 10){
                      setState(() {
                        item.changeColor = !item.changeColor ;
                      });
                      if(item.changeColor){
                        counterList.add(item);
                      }else{
                        if(counterList.length > 0){
                          counterList.remove(item);
                        }
                      }
                    }else{
                      print("counterlist ${counterList.length}");
                      var _item = counterList.firstWhere((element) => element == item) ;
                      if(_item != null){
                        setState(() {
                          item.changeColor = !_item.changeColor ;
                        });
                      }
                      counterList.remove(item);

                    }

              },
          elevation: 0,
          color: item.changeColor ? Colors.deepOrange : Colors.white,
         // color: _pillIndex == index ? Colors.green : Colors.white,
         // textColor: _pillIndex == index ? Colors.white : Colors.black,
          textColor: item.changeColor ? Colors.white : Colors.black,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.yellowAccent),
          ),
          child: Text(
            item.title,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: 'Source Sans Pro'),
          ),
        ),
      ),
    );
  }

  }

