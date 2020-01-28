import 'package:flutter/material.dart';
import 'package:timecards/screens/card_setup_screen.dart';
import '../constants.dart';
import 'package:timecards/components/card_data.dart';
import 'package:provider/provider.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool cardState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(
                      Icons.menu,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                  ),
                  Text(
                    'TIME CARDS',
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 5.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'You\'re awake for a total of 16h',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: GridView.builder(
                    itemCount: Provider.of<CardData>(context).cards.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return Provider.of<CardData>(context).cards[index];
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        Provider.of<CardData>(context, listen: false).addReusableCard(
                            'reading', //activity
                            2, //goal
                            0.3, //elapsed
                           cardState, //state
                            () {
                              setState(() {
                                cardState = true;
                              });
                            }, //onPress
                            () {}); //onLongPress
                      });
                    },
                    backgroundColor: kAccentColor,
                    elevation: 0.0,
                    child: Icon(Icons.add),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
