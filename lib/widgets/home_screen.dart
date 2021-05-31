import 'package:catholic_classics_hymns/widgets/wire.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  AnimationController ac;
  double maxSlide = 225;

  Container navDrawer = Container(color: kSecondaryColor,);
  Container hymnsPanel = Container(
    color: kPrimaryColor,
    child: Container(
      child: Stack(
        children: [
          ArrowIcons(),
          Line(),
          MusicNote(),
          HymnsSection()
        ],
      ),
    ),
  );


  void toggle() => ac.isDismissed? ac.forward() : ac.reverse();

  @override
  void initState() {
    // TODO: implement initState

    ac = AnimationController(duration: Duration(seconds: 1), vsync: this, );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return buildInitial();
  }

  Widget buildInitial(){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,centerTitle: true,
          title: Text('Hymns', textAlign: TextAlign.center, style: TextStyle(fontSize: 36),),
          leading: GestureDetector(
            onTap: toggle,
            child: Icon(Icons.menu,
              //color: Color(0x00AEF9),
            ),
          ),
          actions: [Padding(child: Icon(Icons.search, size: 38,), padding: EdgeInsets.all(9),)],
        ),
        body: GestureDetector(
          // onTap: toggle,
          child: AnimatedBuilder(
            animation: ac,
            builder: (context, _) {
              double slide = ac.value * maxSlide;
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

class HymnsSection extends StatefulWidget {
  @override
  _HymnsSectionState createState() => _HymnsSectionState();
}

class _HymnsSectionState extends State<HymnsSection> {

  List<Key> keys;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    keys = List.generate(6, (_) => GlobalKey<_ItemFaderState>());
    onInit();
  }

  void onInit() async{
    for(GlobalKey<_ItemFaderState> k in keys){
      await Future.delayed(Duration(milliseconds: 40));
      k.currentState.show();
    }
  }

  void onTap() async{
    for(GlobalKey<_ItemFaderState> k  in keys){
      await Future.delayed(Duration(milliseconds: 40));
      k.currentState.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 33,
      left: 80,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            HymnTitle("All People that on Earth"),
             SizedBox(height: 32,),
             ItemFader(child: HymnNumber(1), key: keys[0],),
             ItemFader(child: HymnTitle("edfbnfmjrfjdrtf"), key: keys[1]),
             ItemFader(child: HymnPreview("qwsedfbdnjytrstrrrer"), key: keys[2], onTap: onTap),
             SizedBox(height: 35,),
             //Spacer(flex: 1,),
             ItemFader(child: HymnTitle("werfreasrfd"), key: keys[3], ),
             ItemFader(child: HymnTitle("efdweffrse"), key: keys[4],),
             ItemFader(child: HymnTitle("wedsfbfawerfbfesdfd"), key: keys[5],),
             SizedBox(height: 64)
          ],
        ),
    );
  }
}


class ItemFader extends StatefulWidget {

  final Widget child;
  final  onTap;

  const ItemFader({Key key, @required this.child, @required this.onTap }) : super(key: key);

  @override
  _ItemFaderState createState() => _ItemFaderState();
}


class _ItemFaderState extends State<ItemFader> with SingleTickerProviderStateMixin{
  AnimationController ac;
  Animation animation;
  int position = -1; // -1 for below, 1 for above

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ac = AnimationController(vsync: this, duration: Duration(seconds: 2), );

    animation = CurvedAnimation(curve: Curves.easeInOut, parent: ac);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: animation,
        child: widget.child,
        builder: (context, child){

          return Transform.translate(
            offset: Offset(0, 64 * position * (1 - animation.value)),
            child: Opacity(
                opacity: animation.value,
                child: child
            ),

          );
        },
      ),
    );
  }

  void show(){
    setState(() {
      position = -1;
      ac.forward();
    });
  }

  void hide(){
    setState(() {
      position = 1;
      ac.reverse();
    });
  }

}

