import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({Key? key}) : super(key: key);

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrResult = 'Scanned Data Will Appear Here';
  bool scanning = false;

   Future<void> scanQr() async {
    if (scanning) return; // If scanning is already in progress, return
    setState(() {
      scanning = true; // Set scanning to true to indicate scanning is in progress
    });
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        this.qrResult = qrCode.toString();
      });
    } on PlatformException {
      setState(() {
        qrResult = 'Fail to read Qr Code';
      });
    } finally {
      setState(() {
        scanning = false; // Set scanning back to false after scanning is completed
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qr Code Scanner"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text('$qrResult',style:TextStyle(color: Colors.blue,fontSize: 20),),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: scanQr, child: Text("Scan Code"))
          ],
        ),
      ),
    );
  }
}
