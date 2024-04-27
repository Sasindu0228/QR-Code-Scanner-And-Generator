import 'package:flutter/material.dart';
import 'package:qr_code_scanner_gen/generate_qr_code.dart';
import 'package:qr_code_scanner_gen/scan_qr_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Qr Code Scanner',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Scanner And Generator"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(child: 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            setState(() {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ScanQRCode(),),);
              
            });
          }, child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text("Scan QR Code",style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            ),
          )),
          const SizedBox(height: 40,),
          ElevatedButton(onPressed: () {
            setState(() {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>GenerateQRCode(),),);
            });
          }, child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Text("Qr Code Generator",
                style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),),
          ))
        ],
      ),),
    );
  }
}
