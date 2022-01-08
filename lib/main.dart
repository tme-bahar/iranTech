import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    const Color orange = Color.fromARGB(255, 255, 74, 28);
    const Color back = Color.fromARGB(255, 27, 40, 69);
    const Color blue = Color.fromARGB(255,96, 172, 247);
    final Widget svgLogo = SvgPicture.asset('asset_name.svg');
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [back,back,back,back,back,Colors.black,
                Colors.black],transform: GradientRotation(1.57))
          ),
          child: Stack(
            children: [
              Positioned(top: 400,right: -120,
                    child:
                  Transform.rotate(angle: -3.14 / 4, child:
                      SizedBox(width: 330,height: 320,child:
                        Container(
                          decoration: const BoxDecoration(color: back,borderRadius: BorderRadius.all(Radius.circular(40))
                            ,boxShadow: [
                              BoxShadow(
                                 color: orange,
                                 spreadRadius: -30,
                                 blurRadius: 40,
                                 offset: Offset(-15, -15), // changes position of shadow
                              )
                            ]),
                        )
                      )
                  )
                ),
              Positioned(top: 225,left: -120,
                  child:
                  Transform.rotate(angle: -3.14 / 4, child:
                    SizedBox(width: 320,height: 320,child:
                      Container(
                        decoration: const BoxDecoration(color: back,borderRadius: BorderRadius.all(Radius.circular(40))
                            ,boxShadow: [
                              BoxShadow(
                                color: blue,
                                spreadRadius: -30,
                                blurRadius: 40,
                                offset: Offset(15, 15), // changes position of shadow
                              )
                            ]),
                      )
                    )
                  )
              ),
              Center(child: SvgPicture.asset('assets/logo.svg',width: 250,)),
              Align(alignment: Alignment.topRight,
                child: Container(margin: const EdgeInsets.only(top: 60.0,right: 20),child:
                  const Text("خوش آمدید",style: TextStyle(color: Colors.white,fontSize: 30),),),),
            ],
      ),
      ),
    );
  }

  Widget? butt(){
    return null;
  }
}
