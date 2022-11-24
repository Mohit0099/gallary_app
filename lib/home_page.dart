import 'package:flutter/material.dart';
import 'package:gallary_app/all.dart';
import 'package:gallary_app/animals.dart';
import 'package:gallary_app/birds.dart';
import 'package:gallary_app/mountains.dart';
import 'package:gallary_app/search_page.dart';
import 'package:gallary_app/view_image.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        //backgroundColor: Colors.lightBlueAccent,
        body: SafeArea(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPage(),
                    ),
                  );
                },
                child: Container(
                    margin: EdgeInsets.all(20),
                    height: 60,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Search Keywords",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 35,
                          ),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              TabBar(
                isScrollable: true,
                labelColor: Colors.black,
                indicatorColor: Colors.greenAccent,
                labelStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "Mountains",
                  ),
                  Tab(
                    text: "Birds",
                  ),
                  Tab(
                    text: "Animals",
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    All(),
                    Mountains(),
                    Birds(),
                    Animals(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
