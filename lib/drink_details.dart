import 'package:flutter/material.dart';

class DrinkDetails extends StatelessWidget {
  const DrinkDetails({Key? key, required this.myDrinks}) : super(key: key);

  final myDrinks;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.orange,
        Colors.amber,
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(myDrinks["strDrink"]),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8.0),
              Hero(
                tag: myDrinks["strDrinkThumb"],
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(
                    myDrinks["strDrinkThumb"],
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Text(myDrinks["idDrink"]),
              SizedBox(height: 8.0),
              Text(
                myDrinks["strDrink"],
                style: TextStyle(
                  fontFamily: "Cursive",
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
