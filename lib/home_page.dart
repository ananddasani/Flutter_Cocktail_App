import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'drink_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final api =
      "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";

  //this is a global variable
  var res, myDrinks;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  void fetchData() async {
    res = await get(Uri.parse(api));
    final _jsonData = jsonDecode(res.body); //as List;

    //showing on UI
    setState(() {
      myDrinks = _jsonData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.orange,
            Colors.amber,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Cocktail App"),
        ),
        body: Center(
          child: res != null
              ? ListView.builder(
                  itemCount: myDrinks["drinks"].length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Hero(
                        tag: myDrinks["drinks"][index]["idDrink"],
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            myDrinks["drinks"][index]["strDrinkThumb"],
                          ),
                        ),
                      ),
                      title: Text(myDrinks["drinks"][index]["strDrink"]),
                      subtitle: Text(myDrinks["drinks"][index]["idDrink"]),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DrinkDetails(
                                      myDrinks: myDrinks["drinks"][index],
                                    )));
                      },
                    );
                  },
                )
              : CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
