import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_nfc_reader/flutter_nfc_reader.dart';

class NfcDemo extends StatefulWidget {
  @override
  _NfcDemoState createState() => _NfcDemoState();
}

class _NfcDemoState extends State<NfcDemo> {
  final String _title = 'NFC';

  NfcData _nfcData;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text(
                '- NFC Status -\n',
                textAlign: TextAlign.center,
              ),
              Text(
                _nfcData != null ? 'Status: ${_nfcData.status}' : '',
                textAlign: TextAlign.center,
              ),
              Text(
                _nfcData != null ? 'Identifier: ${_nfcData.id}' : '',
                textAlign: TextAlign.center,
              ),
              Text(
                _nfcData != null ? 'Content: ${_nfcData.content}' : '',
                textAlign: TextAlign.center,
              ),
              Text(
                _nfcData != null ? 'Error: ${_nfcData.error}' : '',
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                child: Text('Start NFC'),
                onPressed: startNFC,
              ),
              RaisedButton(
                child: Text('Stop NFC'),
                onPressed: stopNFC,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> startNFC() async {
    NfcData response;

    setState(() {
      _nfcData = NfcData();
      _nfcData.status = NFCStatus.reading;
    });

    print('NFC: Scan started');

    try {
      print('NFC: Scan readed NFC tag');
      response = await FlutterNfcReader.read;
    } on PlatformException {
      print('NFC: Scan stopped exception');
    }

    setState(() {
      _nfcData = response;
    });
  }

  Future<void> stopNFC() async {
    NfcData response;

    try {
      print('NFC: Stop scan by user');
      response = await FlutterNfcReader.stop;
    } on PlatformException {
      print('NFC: Stop scan exception');
      response = NfcData(
        id: '',
        content: '',
        error: 'NFC scan stop exception',
        statusMapper: '',
      );
      response.status = NFCStatus.error;
    }

    setState(() {
      _nfcData = response;
    });
  }


}
