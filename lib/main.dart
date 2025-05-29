import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: GoogleFonts.notoSansThai().fontFamily,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const Color kPrimaryPurple = Color.fromRGBO(103, 37, 113, 1);

class _MyHomePageState extends State<MyHomePage> {
  int batteryPercent = 0;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 246, 244),
      appBar: AppBar(
        toolbarHeight: 70,
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: kPrimaryPurple,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Image.asset('assets/images/logo.png', height: 100),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            log("Menu icon pressed");
          },
          icon: Icon(Icons.menu, color: Colors.white),
        ),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Text(
                  "PEA VOLTA บางจาก นาโคก (ขาออก #1)",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryPurple,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        FractionallySizedBox(
                                          widthFactor: 0.3,
                                          child: Image.asset(
                                            'assets/images/battery.png',
                                          ),
                                        ),
                                        Text(
                                          "%แบตเตอรี่",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: kPrimaryPurple,
                                          ),
                                        ),
                                        Text(
                                          "$batteryPercent %",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: batteryPercent <= 10
                                                ? Colors.red
                                                : batteryPercent <= 30
                                                ? Colors.orange
                                                : batteryPercent <= 80
                                                ? Colors.yellow
                                                : Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        FractionallySizedBox(
                                          widthFactor: 0.3,
                                          child: Image.asset(
                                            'assets/images/battery.png',
                                          ),
                                        ),
                                        Text(
                                          "กำลังไฟฟ้า",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: kPrimaryPurple,
                                          ),
                                        ),
                                        Text(
                                          "11 kW",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: kPrimaryPurple,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  FractionallySizedBox(
                                    widthFactor: 0.4,
                                    child: Image.asset('assets/images/car.png'),
                                  ),
                                  Text(
                                    "หากต้องการหยุดชาร์จ",
                                    style: TextStyle(
                                      color: kPrimaryPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    "กรุณากดปุ่ม \"หยุดการชาร์จ\" ก่อนถอดหัวชาร์จ ",
                                    style: TextStyle(
                                      color: kPrimaryPurple,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8),
                          color: Colors.white,
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("รายละเอียดการชาร์จ"),
                              ),
                              SizedBox(height: 8),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Image.asset(
                                      'assets/images/electric.png',
                                    ),
                                  ),
                                  Expanded(flex: 7, child: Text("สถานีชาร์จ")),
                                  Expanded(
                                    flex: 6,
                                    child: Text(
                                      "PEA VOLTA บางจาก นาโคก (ขาออก #1)",
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Image.asset(
                                      'assets/images/electric.png',
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Text("ประเภทหัวชาร์จ"),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Text(
                                      "CCS2",
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Image.asset(
                                      'assets/images/electric.png',
                                    ),
                                  ),
                                  Expanded(flex: 7, child: Text("กำลังไฟฟ้า")),
                                  Expanded(
                                    flex: 6,
                                    child: Text(
                                      "50 kW",
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Image.asset(
                                      'assets/images/electric.png',
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Text("ระยะเวลาการชาร์จ"),
                                  ),
                                  Expanded(
                                    flex: 6,
                                    child: Text(
                                      "00:03:19",
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        if (batteryPercent < 100) batteryPercent += 1;
                      });
                    },
                    backgroundColor: const Color.fromARGB(255, 176, 255, 239),
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.electric_bolt,
                      color: Color.fromARGB(255, 45, 217, 182),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  log("Button Pressed");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryPurple,
                ),
                child: Text(
                  "หยุดการชาร์จ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ],
      ),
    );
  }
}
