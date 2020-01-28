import 'package:flutter/material.dart';
import 'package:timecards/constants.dart';
import 'package:timecards/screens/card_setup_screen.dart';

class ReusableCard extends StatefulWidget {

  ReusableCard(
      {this.activityText,
        this.activityLength,
        this.activityTimeElapsed,
        this.enabled,
        this.longPress,
        this.singlePress
        });

  final String activityText;
  final int activityLength;
  final double activityTimeElapsed;
  final bool enabled;
  final Function singlePress;
  final Function longPress;


  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.singlePress,
      onLongPress: widget.longPress,
      child: Container(
        width: 175.0,
        height: 220.0,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: widget.enabled ? kAccentColor : kSecondaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.activityText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  letterSpacing: 5.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.arrow_forward_ios, size: 16.0),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '${widget.activityLength} HOURS',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.alarm, size: 16.0),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    '${widget.activityTimeElapsed} HOURS',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
  List<Widget> cards = [];
  Color mainScreenCardColor = kSecondaryColor;

  dynamic addReusableCard(String activity, int goal, double elapsed) {
    return cards.add(ReusableCard(
      activityText: activity,
      activityLength: goal,
      activityTimeElapsed: elapsed,
      cardColor: mainScreenCardColor,
      singlePress: () {
        setState(() {
          mainScreenCardColor = kAccentColor;
        });
      },
      longPress: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CardSetup(),
            ),
          );
        });
      },
    ));
  }
}

