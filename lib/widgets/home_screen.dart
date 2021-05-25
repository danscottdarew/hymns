import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  AnimationController ac;
  double maxSlide = 225;

  void toggle() => ac.isDismissed? ac.forward() : ac.reverse();

  @override
  void initState() {
    // TODO: implement initState

    ac = AnimationController(duration: Duration(seconds: 1), vsync: this, upperBound: maxSlide);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Container navDrawer = Container(color: Colors.pinkAccent,);
    Container hymnsPanel = Container(color: Colors.greenAccent,);



    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Hymns'),
          leading: Icon(Icons.menu, color: Color(0x00AEF9), ),
          actions: [Icon(Icons.search, )],
        ),
        body: GestureDetector(
          onTap: toggle,
          child: AnimatedBuilder(
            animation: ac,
            builder: (context, aa) {
              double slide = ac.value - maxSlide;
              double scale = 1 - (ac.value * 0.3);

              return Stack(
                children: [
                  navDrawer,
                  Transform(
                    transform: Matrix4.identity()..translate(slide)..scale(scale)
                    ,
                    child: hymnsPanel,
                    alignment: Alignment.centerLeft,

                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
