import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  var texts;
  int ocrCam;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ocrCam = FlutterMobileVision.CAMERA_BACK;
  }

  Future<Null> read() async {
    List<OcrText> texts = [];
    OcrText errorText = OcrText('Error scannign text');
    //errorText.

    try {
      texts = await FlutterMobileVision.read(waitTap: true, camera: ocrCam);

      setState(() {});
    } on Exception {
      texts.add(errorText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: RaisedButton(
        onPressed: () {
          read();
        },
        child: Text('Scan'),
      ),
    ));
  }
}
