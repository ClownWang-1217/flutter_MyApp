import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Code Sample for Navigator',
      // MaterialApp contains our top-level Navigator
      initialRoute: '/',
      //home: WeChartLoading(),
      routes: {
        '/': (BuildContext context) => WeChartLoading(),
        '/signup': (BuildContext context) => MyAppFul(),
      },
    );
  }
}

class WeChartLoading extends StatefulWidget {
  WeChartLoading({Key key}) : super(key: key);

  _WeChartLoadingState createState() => _WeChartLoadingState();
}

class _WeChartLoadingState extends State<WeChartLoading> {
  @override
  Widget build(BuildContext context) {
    return new Container(
          child: Image.asset('images/loading.jpg'),
        );
  }

  var _duration = new Duration(seconds: 3);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    new Future.delayed(_duration, () {
      //设置定时执行
      //handleTimeout();
       Navigator.pushNamed(context, '/signup');
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => MyAppFul()
      ));
    });
  }

  // startTimeout([int milliseconds]) {
  //   var duration = _duration;
  //   return new Timer(duration, handleTimeout);
  // }

  // void handleTimeout() {
  //   // callback function
  // }
}

class MyAppFul extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyAppFulState();
  }
}

class MyAppFulState extends State<MyAppFul> {
  var length = 10;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        title: 'hahahahah',
        theme: ThemeData(primaryColor: Colors.yellow),
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('title'),
            ),
            body: new Container(
                padding: EdgeInsets.all(10.0),
                child: new ListView.builder(
                    itemCount: length,
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                    itemBuilder: (context, index) {
                      return new Dismissible(
                          direction: DismissDirection.endToStart,
                          key: Key(index.toString()),
                          confirmDismiss: (direction) =>
                              _asyncConfirmDialog(context),
                          onDismissed: (direction) {
                            Scaffold.of(context).showSnackBar(new SnackBar(
                              content: new Text("$index dismissed"),
                            ));
                          },
                          background: new Container(color: Colors.red),
                          child: ListTile(
                              contentPadding: EdgeInsets.all(10.0),
                              title: Text("$index"),
                              subtitle: Text('data'),
                              leading: new Container(
                                child: new IconButton(
                                  icon: new Image.asset('images/01.jpg'),
                                  onPressed: () {
                                    Scaffold.of(context).showBottomSheet(
                                        (context) => new LogoApp());
                                  },
                                ),
                              )));
                    }))));
  }

  Future<bool> _asyncConfirmDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reset settings?'),
          content: const Text(
              'This will reset your device to its default factory settings.'),
          actions: <Widget>[
            FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            FlatButton(
              child: const Text('ACCEPT'),
              onPressed: () {
                Navigator.of(context).pop(false);
                setState(() {
                  length--;
                });
              },
            )
          ],
        );
      },
    );
  }
}

class LogoApp extends StatefulWidget {
  @override
  //State<StatefulWidget> createState() => LogoAppStateWidget();
  State<StatefulWidget> createState() => _LogoAppState();
}

class LogoAppStateWidget extends State<LogoApp>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 3000), vsync: this);
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    // ..addStatusListener((AnimationStatus state){
    //   if (state == AnimationStatus.completed) {
    //   controller.reverse();
    // } else if (state == AnimationStatus.dismissed) {
    //   controller.forward();
    // }
    // });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    debugPrint('buildtoooffff');
    return new Center(
        child: new Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      height: animation.value,
      width: animation.value,
      child: new FlutterLogo(),
    ));
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  void didChangeDependencies() {
    ///在initState之后调 Called when a dependency of this [State] object changes.
    super.didChangeDependencies();
    debugPrint('didChangeDependencies');
  }
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation animation;
  Animation<double> opacityAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );

    animation = new Tween(begin: 0.0, end: 300.0).animate(animationController);
    opacityAnimation =
        new Tween(begin: 0.1, end: 1.0).animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('_LogoAppState_build');
    // TODO: implement build
    return new GrowTransition(new LogoWidget(), animation, opacityAnimation);
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition(this.child, this.animation, this.opacityAnimation);

  final Widget child;
  final Animation<double> animation;
  final Animation<double> opacityAnimation;
  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, child) {
          print('AnimatedBuilder');
          return new Opacity(
            opacity: opacityAnimation.value,
            child: Container(
                height: animation.value, width: animation.value, child: child),
          );
        },
        child: child,
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  // Leave out the height and width so it fills the animating parent
  build(BuildContext context) {
    return new Container(
      //margin: new EdgeInsets.symmetric(vertical: 10.0),
      child: new Image.asset('images/lake.jpg'),
    );
  }
}

//水墨效果
