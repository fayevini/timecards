import 'package:flutter/material.dart';
import 'package:timecards/constants.dart';

class CardSetup extends StatefulWidget {
  @override
  _CardSetupState createState() => _CardSetupState();
}

class _CardSetupState extends State<CardSetup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15.0),
          color: kSecondaryColor,
          width: MediaQuery.of(context).size.width / 1.2,
          height: MediaQuery.of(context).size.height / 1.2,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('READING', style: TextStyle(
                    fontSize: 22.0,
                    letterSpacing: 5.0,
                    fontStyle: FontStyle.italic,
                  ),),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close),
                  ),
                ],
              ),
              TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'ACTIVITY',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(0.0)),
                  fillColor: kPrimaryColor,
                  filled: true,
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
