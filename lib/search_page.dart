import 'package:flutter/material.dart';
import 'package:gallary_app/all.dart';
import 'package:gallary_app/animals.dart';
import 'package:gallary_app/birds.dart';
import 'package:gallary_app/model.dart/all_model.dart';
import 'package:gallary_app/mountains.dart';
import 'package:gallary_app/view_image.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<AllImage> search = contents;

  void searchFilter(String Query) {
    final Sugg = search.where((search) {
      final serchtitle = search.title?.toLowerCase();
      final input = Query.toLowerCase();
      return serchtitle!.contains(input);
    }).toList();
    setState(() => search = Sugg);
  }

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
              Container(
                margin: EdgeInsets.all(20),
                height: 60,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  onChanged: searchFilter,
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      hintText: 'Search Keywords',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 35,
                      )),
                ),
              ),
              Expanded(
                child: search.isNotEmpty
                    ? Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) {
                            return RawMaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                      imagePath: search[index].image!,
                                      title: search[index].title!,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: '${search[index].image},',
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(search[index].image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: search.length,
                        ))
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "images/no-results.png",
                            height: 80,
                          ),
                          Text(
                            'No results found',
                            style: TextStyle(fontSize: 24),
                          ),
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
