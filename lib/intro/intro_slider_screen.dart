import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:simple_calendar/home/home_screen.dart';

class IntroSliderScreen extends StatefulWidget {
  @override
  _IntroSliderScreenState createState() => _IntroSliderScreenState();
}

class _IntroSliderScreenState extends State<IntroSliderScreen> {
  List<Slide> slides = [];

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffD02090),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffD02090),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffD02090),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IntroSlider(
        slides: [
          Slide(
            title: "シンプルなカレンダー",
            styleTitle: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            description: "毎日をカレンダーに記録しよう。",
            styleDescription: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            pathImage: "assets/images/calendar.png",
            heightImage: MediaQuery.of(context).size.height * 0.5,
            // widthImage: MediaQuery.of(context).size.width * 0.5,
            backgroundColor: Colors.white,
          ),
          Slide(
            title: "あなたの毎日を記憶",
            styleTitle: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            description: "あなたは生きています。",
            styleDescription: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            pathImage: "assets/images/memory.png",
            heightImage: MediaQuery.of(context).size.height * 0.5,
            // widthImage: MediaQuery.of(context).size.width * 0.5,
            backgroundColor: Colors.white,
          ),
        ],
        renderSkipBtn: this.renderSkipBtn(),
        colorSkipBtn: Color(0x33000000),
        highlightColorSkipBtn: Color(0xff000000),
        // Next button
        renderNextBtn: this.renderNextBtn(),

        // Done button
        renderDoneBtn: this.renderDoneBtn(),
        onDonePress: this.onDonePress,
        colorDoneBtn: Color(0x33000000),
        highlightColorDoneBtn: Color(0xff000000),
      ),
    );
  }
}
