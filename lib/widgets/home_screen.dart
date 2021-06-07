//import 'dart:html';

import 'package:catholic_classics_hymns/bloc/hymn_bloc.dart';
import 'package:catholic_classics_hymns/model/hymn.dart';
import 'package:catholic_classics_hymns/widgets/classic_screen.dart';
import 'package:catholic_classics_hymns/widgets/wire.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

import 'hymn_screen.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum MenuItems{
  Hymns,
  Classics,
  SolfaNotation,
  Acknowledgements,
  TableOfContents
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  HymnBloc bloc;
  AnimationController ac;
  double maxSlide = 225;
  AppBar searchAppBar;

  TextEditingController tec = TextEditingController();
  String searchInput;
  TextField searchField;

  FocusNode focusNode = FocusNode();

  MenuItems selectedMenuItem = MenuItems.Hymns;

  GlobalKey<ScaffoldState> sk = GlobalKey<ScaffoldState>();

  Container navDrawer = Container(
    child: Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Positioned(
            left: 20,
            top: 25,
            child: Menu(),

        )
      ],
    ),
    color: kSecondaryColor,
  );

  Container mainPanel;

  void toggle() => ac.isDismissed ? ac.forward() : ac.reverse();

  Widget mainMenu(){
    if(selectedMenuItem == MenuItems.Hymns){
      return Stack(
        children: [ArrowIcons(), Line(), MusicNote(), HymnsSection()],
      );
    }

    if(selectedMenuItem == MenuItems.Classics){
      return ClassicScreen();
    }

    if(selectedMenuItem == MenuItems.SolfaNotation){
      return ClassicScreen();
    }

    if(selectedMenuItem == MenuItems.TableOfContents){
      return ClassicScreen();
    }

    if(selectedMenuItem == MenuItems.Acknowledgements){
      return ClassicScreen();
    }

    return ClassicScreen();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    bloc = BlocProvider.of(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    ac = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    mainPanel = Container(
      color: kPrimaryColor,
      child: Container(
        child: mainMenu(),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // bloc.
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HymnBloc, HymnState>(
      listener: (context, state) {
        if (state is HymnNotFound) {
          p(state.message + 'khyggh');
          //sk.currentState.showSnackBar(snackBar(state.message));
          Scaffold.of(context).showSnackBar(snackBar(state.message));
        }

        if (state is HymnSelected) {
          Navigator.pushNamed(context, HymnScreen.id,
              arguments: {'hymn': state.hymn});
        }
      },
      child: BlocBuilder<HymnBloc, HymnState>(
        // ignore: missing_return
        builder: (context, state) {
          if (state is HymnInitial) {
            return buildInitial();
          } else if (state is HymnSearching) {
            return buildSearch();
          } else if (state is HymnFound) {
            return buildFoundHymns(state.hymns);
          } else if (state is HymnScrolledUp) {
            return buildScroll(state.hymnIndex);
          } else if (state is HymnScrolledDown) {
            return buildScroll(state.hymnIndex);
          }
        },
      ),
    );

    //buildInitial();
  }

  Widget buildInitial() {
    return SafeArea(
      child: Scaffold(
        key: sk,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Hymns',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36),
          ),
          leading: GestureDetector(
            onTap: toggle,
            child: Icon(
              Icons.menu,
              //color: Color(0x00AEF9),
            ),
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  openKeyboard(context);
                  p('SearchIcon clicked once..');
                  bloc.add(SearchClickedEvent());
                },
                child: Padding(
                  child: Icon(
                    Icons.search,
                    size: 38,
                  ),
                  padding: EdgeInsets.all(9),
                ))
          ],
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
                    transform: Matrix4.identity()
                      ..translate(slide)
                      ..scale(scale),
                    child: mainPanel,
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

  Widget buildSearch() {
    //TextEditingController tecc = TextEditingController();

    searchAppBar = AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      centerTitle: true,
      title: TextField(
        // autofocus: true,
        controller: tec,
        //focusNode: focusNode,
      ),
      leading: GestureDetector(
        onTap: toggle,
        child: Icon(
          Icons.menu,
          //color: Color(0x00AEF9),
        ),
      ),
      actions: [
        GestureDetector(
            onTap: () {
              searchInput = tec.text;
              p('Searching 4 $searchInput ${tec.text}');
              bloc.add(GetHymn(searchInput));
            },
            child: Padding(
              child: Icon(
                Icons.search,
                size: 38,
              ),
              padding: EdgeInsets.all(9),
            ))
      ],
    );
    p('Buildin search');
    //searchField = TextField(autofocus: true, controller: tec, focusNode: focusNode,);

    return SafeArea(
      child: Scaffold(
        key: sk,
        appBar: searchAppBar,
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
                    transform: Matrix4.identity()
                      ..translate(slide)
                      ..scale(scale),
                    child: mainPanel,
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

  Widget buildFoundHymns(List<Hymn> hymns) {
    p('Buildin found hymns $hymns, lenth: ${hymns.length}');

    List<Widget> items = List<Widget>();
    for (var i in hymns) {
      p('PingFang HK ${i.title}');
      Row row = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HymnNumber(
            i.number,
            isBig: false,
          ),
          SizedBox(
            width: 9,
          ),
          HymnTitle(i.title)
        ],
      );

      Container hymnItem = Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: row,
      );

      GestureDetector gd = GestureDetector(
        onTap: () {
          bloc.add(HymnSelectedEvent(i));
        },
      );
      items.add(hymnItem);
    }
    return Scaffold(
      appBar: searchAppBar,
      body: ListView(
        children: items,
      ),
    );
  }

  Widget buildScroll(int hymnIndex) {
    return null;
  }

  void openKeyboard(BuildContext ctxt) {
    FocusScope.of(ctxt).requestFocus(focusNode);
  }
}

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  Widget menuItem({Icon icon, String title, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          child: Row(
        children: [icon, SizedBox(width: 4), HymnTitle(title)],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          menuItem(icon: Icon(Icons.menu), title: 'Classics', onTap: () {}),
          menuItem(icon: Icon(Icons.menu), title: 'Hymns', onTap: () {}),
          menuItem(
              icon: Icon(Icons.menu), title: 'Solfa Notation', onTap: () {}),
          menuItem(
              icon: Icon(Icons.menu), title: 'Table Of Contents', onTap: () {}),
          menuItem(
              icon: Icon(Icons.menu), title: 'Acknowledgements', onTap: () {}),
        ],
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

  void onInit() async {
    for (GlobalKey<_ItemFaderState> k in keys) {
      await Future.delayed(Duration(milliseconds: 40));
      k.currentState.show();
    }
  }

  void onTap() async {
    for (GlobalKey<_ItemFaderState> k in keys) {
      await Future.delayed(Duration(milliseconds: 40));
      k.currentState.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 33,
      left: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          HymnTitle("All People that on Earth"),
          SizedBox(
            height: 32,
          ),
          ItemFader(
            child: HymnNumber(1),
            key: keys[0],
          ),
          ItemFader(child: HymnTitle("edfbnfmjrfjdrtf"), key: keys[1]),
          ItemFader(
              child: HymnPreview("qwsedfbdnjytrstrrrer"),
              key: keys[2],
              onTap: onTap),
          SizedBox(
            height: 35,
          ),
          //Spacer(flex: 1,),
          ItemFader(
            child: HymnTitle("werfreasrfd"),
            key: keys[3],
          ),
          ItemFader(
            child: HymnTitle("efdweffrse"),
            key: keys[4],
          ),
          ItemFader(
            child: HymnTitle("wedsfbfawerfbfesdfd"),
            key: keys[5],
          ),
          SizedBox(height: 64)
        ],
      ),
    );
  }
}

class ItemFader extends StatefulWidget {
  final Widget child;
  final onTap;

  const ItemFader({Key key, @required this.child, @required this.onTap})
      : super(key: key);

  @override
  _ItemFaderState createState() => _ItemFaderState();
}

class _ItemFaderState extends State<ItemFader>
    with SingleTickerProviderStateMixin {
  AnimationController ac;
  Animation animation;
  int position = -1; // -1 for below, 1 for above

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ac = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = CurvedAnimation(curve: Curves.easeInOut, parent: ac);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: animation,
        child: widget.child,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, 64 * position * (1 - animation.value)),
            child: Opacity(opacity: animation.value, child: child),
          );
        },
      ),
    );
  }

  void show() {
    setState(() {
      position = -1;
      ac.forward();
    });
  }

  void hide() {
    setState(() {
      position = 1;
      ac.reverse();
    });
  }
}
