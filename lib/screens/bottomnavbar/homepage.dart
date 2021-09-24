import 'package:bean/models/chief/chiefmodel.dart';
import 'package:bean/models/mainModel.dart';
import 'package:bean/screens/searchresult.dart';
import 'package:bean/theme/sharedFontStyle.dart';
import 'package:bean/theme/sharedcolors.dart';
import 'package:bean/widgets/categoryWidget.dart';
import 'package:bean/widgets/cheifwidget.dart';
import 'package:flutter/material.dart';
import 'package:bean/demodata.dart';
import 'package:scoped_model/scoped_model.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
        appBar: AppBar(
            backgroundColor: appBarAndButtonColor,
            title: Text('Welcome', style: appBarButtonTextStyle),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return SearchResult();
                  }));
                },
              ),
            ]),
        backgroundColor: Colors.white,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: offerImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                            image: NetworkImage(offerImages[index]),
                            fit: BoxFit.fill)),
                  );
                },
              ),
            ),
            Text(
              '   Categories...',
              style: mainTextStyle,
            ),
            Container(
              height: 110.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: model.allCategories.length,
                itemBuilder: (context, index) {
                  if(model.isGetCategoryLoading == true) {
                    return Center(child: CircularProgressIndicator());
                  }else if(model.allCategories.isEmpty) {
                    return Center(child: Text('Ops some thing went wrong'));
                  }else{
                    return CategoryWidget(model.allCategories[index]);
                  }
                },
              ),
            ),
            Text(
              '  \n    Nearby Chief...',
              style: mainTextStyle,
            ),
            checkChief(model)
          ],
        ),
      );
      },
    );
  }
  checkChief(MainModel model) {
    if(model.selectedCategory == null){
        return Center(child: Text('Select Category Upove', style: TextStyle(color: Colors.black)));
      }else{
        return Column(
          children: [
            for(ChiefModel chief in model.selectedCategory!.chief) CheifWidget(chief)
          ],
        );
    }
  }
}
