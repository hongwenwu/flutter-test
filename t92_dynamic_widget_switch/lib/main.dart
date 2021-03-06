import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: WidgetList(),
    );
  }
}

class WidgetList extends StatefulWidget {
  WidgetList({Key key}) : super(key: key);

  @override
  _WidgetListState createState() => _WidgetListState();
}

class _WidgetListState extends State<WidgetList> {
  TargetPlatform selectedPlatform;

  double testSlider = 0.0;
  bool testSwitch;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        platform: selectedPlatform,
        adaptiveWidgetTheme: AdaptiveWidgetThemeData.bundled,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dynamic Widgets'),
          // This is just for toggling between platforms. The actual consumption
          // is in the body.
          leading: Builder(
            builder: (BuildContext context) {
              return Switch(
                value: Theme.of(context).platform == TargetPlatform.iOS,
                onChanged: (bool iOS) {
                  setState(
                    () => selectedPlatform =
                        iOS ? TargetPlatform.iOS : TargetPlatform.android,
                  );
                },
              );
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: Text('test'),
                onPressed: () {},
              ),
              RaisedButton(
                child: Text('test 2'),
                onPressed: () {},
              ),
              Slider(
                value: testSlider,
                onChanged: (double value) => setState(() => testSlider = value),
              ),
              Switch(
                value: testSwitch == true,
                onChanged: (bool value) {
                  setState(() => testSwitch = value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
