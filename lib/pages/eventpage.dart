import 'package:event_corner/pages/scanPage.dart';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  final Map<String, dynamic> pluginParameters = {
  };

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String> _barcodeString;
//  Future<String> futureString = new QRCodeReader()
//      .setAutoFocusIntervalInMs(200) // default 5000
//      .setForceAutoFocus(true) // default false
//      .setTorchEnabled(true) // default false
//      .setHandlePermissions(true) // default true
//      .setExecuteAfterPermissionGranted(true) // default true
//      .scan();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('QRCode Reader Example'),
        ),
        body: new Center(
            child: new FutureBuilder<String>(
                future: _barcodeString,
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                  return new Text(snapshot.data != null ? snapshot.data : '');
                })),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (_) => ScanPage()
            ));
//            setState(() {
//              _barcodeString = new QRCodeReader()
//                  .setAutoFocusIntervalInMs(200)
//                  .setForceAutoFocus(true)
//                  .setTorchEnabled(true)
//                  .setHandlePermissions(true)
//                  .setExecuteAfterPermissionGranted(true)
//                  .scan();
//            });
          },
          tooltip: 'Reader the QRCode',
          child: new Icon(Icons.add_a_photo),
        ),
      ),
    );
  }
}