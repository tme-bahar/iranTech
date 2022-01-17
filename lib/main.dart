
import 'package:flutter/material.dart';

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
      appBar: AppBar(titleTextStyle: const TextStyle(color: Colors.white,fontSize: 25,)
      ,backgroundColor: back,title: Align(alignment: Alignment.centerRight,child: Text('خوش آمدید'),)),
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [back,back,back,back,back,Colors.black,
                Colors.black],transform: GradientRotation(1.57))
          ),
          child: Stack(
            children: [
              Positioned(top: 350,right: -120,
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
              Positioned(top: 175,left: -120,
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
              Center(child: SizedBox(width: 260,child: Image.asset('assets/logo.png'),)),
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
    return Scaffold(resizeToAvoidBottomInset: false,
      appBar: AppBar(titleTextStyle: const TextStyle(color: Colors.white,fontSize: 25,)
          ,backgroundColor: back,title: Align(alignment: Alignment.centerRight,child: Text('ورود'),)),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [back,back,back, Colors.black],
              transform: GradientRotation(1.57))
          ),
          child: Stack(children: [
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
    return Scaffold(resizeToAvoidBottomInset: false,
        appBar: AppBar(titleTextStyle: const TextStyle(color: Colors.white,fontSize: 25,)
          ,backgroundColor: back,title: Align(alignment: Alignment.centerRight,child: Text('ثبت نام'),)),
        body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [back,back,back, Colors.black],
                    transform: GradientRotation(1.57))
            ),
            child: Stack(children: [
              Button(text: 'ثبت نام',color: orange,onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));},),
              EditText(margin : 480,hint : 'نام'),
              EditText(margin : 320,hint : 'شماره تلفن همراه'),
              EditText(margin : 400,hint :  'پست الکترونیکی'),
              EditText(hint: 'رمز عبور', margin: 240)
            ])
        )
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
 void startAdd(){
   (context) => const Login();

   print("search button clicked");
 }
  @override
  Widget build(BuildContext context) {
    const Color back = Color.fromARGB(255, 27, 40, 69);
    const Color orange = Color.fromARGB(255, 255, 74, 28);
    return Scaffold(
        appBar: AppBar(actions:  const [ Align(alignment: Alignment.centerRight,
            child: Padding(padding: EdgeInsets.only(right: 20),
              child: Text('خانه',style: TextStyle(fontSize: 25),),)),],
            automaticallyImplyLeading: false,
            backgroundColor: back
            ,title:Row(children: [
              IconButton(icon:const Icon(Icons.menu), onPressed: () {  },),
              IconButton(icon:const Icon(Icons.add), onPressed : (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCentralDevice()));})],))
        ,resizeToAvoidBottomInset: false,
        body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [back, Colors.black],
                    transform: GradientRotation(1.57))
            ),
            child: Stack(children: [
              MaterialApp(
                home: DefaultTabController(
                  length: 3,
                  child: Scaffold(backgroundColor: const Color.fromARGB(0, 0, 0, 0) ,
                    bottomNavigationBar: menu(),
                    body: TabBarView(
                      children: [
                        Container(child: Center(child: Text('موردی برای نمایش وجود ندارد',style: TextStyle(color: Colors.white),),)),
                        Container(child: Icon(Icons.directions_transit)),
                        Container(child: Icon(Icons.directions_bike)),
                      ],
                    ),
                  ),
                ),
              )
            ])
        )
    );
  }
  Widget menu() {
    const Color orange = Color.fromARGB(255, 255, 74, 28);
    return Container(
      color: Color.fromARGB(255,77 ,87, 109),
      child: const TabBar(
        labelColor: orange,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: orange,
        tabs: [
          Tab(
            text: "خانه",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "علاقه مندی",
            icon: Icon(Icons.star_border),
          ),
          Tab(
            text: "جست و جو",
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );}
}

class AddCentralDevice extends StatelessWidget {
  const AddCentralDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color back = Color.fromARGB(255, 27, 40, 69);
    const Color orange = Color.fromARGB(255, 255, 74, 28);
    return Scaffold(appBar: AppBar(backgroundColor: back,title:const Align(alignment: Alignment.centerRight,child: Text('افزودن دستگاه'),))
        ,resizeToAvoidBottomInset: false,
        body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [back, Colors.black],
                    transform: GradientRotation(1.57))
            ),
            child: Stack(children: [
              MaterialApp(
                home: DefaultTabController(
                  length: 3,
                  child: Scaffold(backgroundColor: const Color.fromARGB(0, 0, 0, 0) ,
                    bottomNavigationBar: menu(),
                    body: TabBarView(
                      children: [
                        Container(child: Center(child: Text('موردی برای نمایش وجود ندارد',style: TextStyle(color: Colors.white),),)),
                        Container(child: Icon(Icons.directions_transit)),
                        Container(child: Icon(Icons.directions_bike)),
                      ],
                    ),
                  ),
                ),
              )
            ])
        )
    );
  }
  Widget menu() {
    const Color orange = Color.fromARGB(255, 255, 74, 28);
    return Container(
      color: Color.fromARGB(255,77 ,87, 109),
      child: const TabBar(
        labelColor: orange,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: orange,
        tabs: [
          Tab(
            text: "خانه",
            icon: Icon(Icons.home),
          ),
          Tab(
            text: "علاقه مندی",
            icon: Icon(Icons.star_border),
          ),
          Tab(
            text: "جست و جو",
            icon: Icon(Icons.search),
          ),
        ],
      ),
    );}
}

class EditText extends Align{
  EditText({Key? key,required String hint,required double margin}) :
        super(key: key,alignment: Alignment.bottomCenter,
          child:Container(
              margin: EdgeInsets.only(bottom: margin),
              child:SizedBox(width: 350,child:
                TextField(decoration:
                  InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      hintText: hint,
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: const TextStyle(color: Colors.white)
                  ),
                )
              )
          ),
        );
}

class Button extends Align{
   Button({Key? key,String? text,Color? color,VoidCallback? onPressed}) : super(key: key,alignment:Alignment.bottomCenter,
      child:Container(
          margin: const EdgeInsets.only(bottom: 100),child:
        SizedBox(width: 240,height: 50,child:
          ElevatedButton(onPressed: onPressed,
            child: Text(text!,style: TextStyle(fontSize: 18,color: Colors.white)),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color!),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          )
        )
      ),
   );

}