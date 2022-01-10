
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
              Align(alignment: Alignment.bottomCenter,child:
                Container(
                  margin: const EdgeInsets.only(bottom: 100),child:
                    SizedBox(width: 240,height: 50,child:
                      ElevatedButton(onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                      }, child: const Text('ورود',style: TextStyle(fontSize: 18,color: Colors.black)),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                      )
                    )
                ),
              ),
              Align(alignment: Alignment.bottomCenter,child:
                Container(
                    margin: const EdgeInsets.only(bottom: 170),child:
                    SizedBox(width: 240,height: 50,child:
                      ElevatedButton(onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
                      }, child: const Text('ثبت نام',style: TextStyle(fontSize: 18,color: Colors.white)),
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(orange),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                        ),
                      )
                    )
                ),
              )
            ],
      ),
      ),
    );
  }
}


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color back = Color.fromARGB(255, 27, 40, 69);
    const Color blue = Color.fromARGB(255,96, 172, 247);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [back,back,back, Colors.black],
              transform: GradientRotation(1.57))
          ),
          child: Stack(children: [
            Align(alignment: Alignment.topRight,
              child: Container(margin: const EdgeInsets.only(top: 60.0,right: 20),child:
                const Text("ورود",style: TextStyle(color: Colors.white,fontSize: 30),),),),
            Align(alignment: Alignment.bottomCenter,child:
              Container(
                  margin: const EdgeInsets.only(bottom: 100),child:
                SizedBox(width: 240,height: 50,child:
                  ElevatedButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));},
                    child: const Text('ورود',style: TextStyle(fontSize: 18,color: Colors.black)),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  )
                )
              ),
            ),
            Align(alignment: Alignment.bottomCenter,child:
              Container(
                  margin: const EdgeInsets.only(bottom: 320),child:
                  const SizedBox(width: 350,child:
                    TextField(decoration:
                      InputDecoration(
                        enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        hintText: 'رمز عبور',
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(color: Colors.white)
                      ),
                    )
                  )
              ),
            ),
            Align(alignment: Alignment.bottomCenter,child:
              Container(
                  margin: const EdgeInsets.only(bottom: 400),child:
                  const SizedBox(width: 350,child:
                    TextField(decoration:
                      InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 2.0),
                          ),
                          hintText: 'پست الکترونیکی',
                          hintTextDirection: TextDirection.rtl,
                          hintStyle: TextStyle(color: Colors.white)
                      ),
                    )
                  )
              ),
            ),
            Align(alignment: Alignment.bottomCenter,child:
              Container(
                  margin: const EdgeInsets.only(bottom: 290),child:
                    const SizedBox(width: 350,child:
                      Text('رمز عبور خود را فراموش کرده اید ؟',textDirection: TextDirection.rtl,
                        style: TextStyle(color: Colors.white),) ,
                  )
              ),
            ),
          ])
      )
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color back = Color.fromARGB(255, 27, 40, 69);
    const Color orange = Color.fromARGB(255, 255, 74, 28);
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [back,back,back, Colors.black],
                    transform: GradientRotation(1.57))
            ),
            child: Stack(children: [
              Align(alignment: Alignment.topRight,
                child: Container(margin: const EdgeInsets.only(top: 60.0,right: 20),child:
                const Text("ثبت نام",style: TextStyle(color: Colors.white,fontSize: 30),),),),
              Align(alignment: Alignment.bottomCenter,child:
                Container(
                    margin: const EdgeInsets.only(bottom: 100),child:
                  SizedBox(width: 240,height: 50,child:
                    ElevatedButton(onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));},
                      child: const Text('ثبت نام',style: TextStyle(fontSize: 18,color: Colors.white)),
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(orange),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    )
                  )
                ),
              ),
              Align(alignment: Alignment.bottomCenter,child:
                Container(
                    margin: const EdgeInsets.only(bottom: 480),child:
                    const SizedBox(width: 350,child:
                      TextField(decoration:
                        InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 2.0),
                            ),
                            hintText: 'نام',
                            hintTextDirection: TextDirection.rtl,
                            hintStyle: TextStyle(color: Colors.white)
                        ),
                      )
                    )
                ),
              ),
              Align(alignment: Alignment.bottomCenter,child:
                Container(
                    margin: const EdgeInsets.only(bottom: 320),child:
                    const SizedBox(width: 350,child:
                      TextField(decoration:
                        InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 2.0),
                            ),
                            hintText: 'شماره تلفن همراه',
                            hintTextDirection: TextDirection.rtl,
                            hintStyle: TextStyle(color: Colors.white)
                        ),
                      )
                    )
                ),
              ),
              Align(alignment: Alignment.bottomCenter,child:
                Container(
                    margin: const EdgeInsets.only(bottom: 400),child:
                    const SizedBox(width: 350,child:
                      TextField(decoration:
                        InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 2.0),
                            ),
                            hintText: 'پست الکترونیکی',
                            hintTextDirection: TextDirection.rtl,
                            hintStyle: TextStyle(color: Colors.white)
                        ),
                      )
                    )
                ),
              ),
              Align(alignment: Alignment.bottomCenter,child:
                Container(
                    margin: const EdgeInsets.only(bottom: 240),child:
                    const SizedBox(width: 350,child:
                      TextField(decoration:
                        InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey, width: 2.0),
                            ),
                            hintText: 'رمز عبور',
                            hintTextDirection: TextDirection.rtl,
                            hintStyle: TextStyle(color: Colors.white)
                        ),
                      )
                    )
                ),
              ),
            ])
        )
    );
  }
}
