
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
              //orange cube
              Positioned(top: 350,right: -120,
                    child:
                  Transform.rotate(angle: -3.14 / 4, child:BackCube(shadow: orange,back: back,offset: const Offset(-15,-15),)
                  )
                ),
              //blue cube
              Positioned(top: 175,left: -120,
                  child:
                  Transform.rotate(angle: -3.14 / 4, child:BackCube(shadow: blue,back: back,offset: const Offset(15,15),))
              ),
              //logo
              Center(child: SizedBox(width: 260,child: Image.asset('assets/logo.png'),)),
              //login button
              Button(color: blue,margin: 100,textColor: Colors.black,text: 'ورود',onPressed:() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                } ,
              ),
              //sign up button
              Button(color: orange,margin: 160,textColor: Colors.white,text: 'ثبت نام',onPressed:() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
              },
              ),
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
            //login button
            Button(text:'ورود' ,margin: 100,color: blue,textColor: Colors.black,onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));},),
            //password text filed
            AlignEditText(hint: 'رمز عبور', margin: 320),
            AlignEditText(hint: 'پست الکترونیکی', margin: 400),
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
              Button(text: 'ثبت نام',margin: 100,textColor: Colors.white,color: orange,onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));},),
              AlignEditText(margin : 480,hint : 'نام'),
              AlignEditText(margin : 320,hint : 'شماره تلفن همراه'),
              AlignEditText(margin : 400,hint :  'پست الکترونیکی'),
              AlignEditText(hint: 'رمز عبور', margin: 240)
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
        resizeToAvoidBottomInset: false,
        body: MaterialApp(
                home: DefaultTabController(
                  length: 3,
                  child: Scaffold(backgroundColor: const Color.fromARGB(0, 0, 0, 0) ,
                    bottomNavigationBar: menu(),
                    body: TabBarView(
                      children: [
                        Scaffold(appBar:
                          AppBar(
                              actions:  const [
                                Align(alignment: Alignment.centerRight,
                                  child: Padding(padding: EdgeInsets.only(right: 20),
                                    child: Text('خانه',style: TextStyle(fontSize: 25),),)),],
                              automaticallyImplyLeading: false,
                              backgroundColor: back,
                              title:
                                Row(children: [
                                  IconButton(icon:const Icon(Icons.menu), onPressed: () {  },),
                                  IconButton(icon:const Icon(Icons.add), onPressed : (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCentralDevice()));})],
                              )
                          ),
                          body: Container(
                              child:const Center(child: Text('موردی برای نمایش وجود ندارد',
                              style: TextStyle(color: Colors.white),),),
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [back, Colors.black],
                                      transform: GradientRotation(1.57))
                              ),),
                        ),
                        Scaffold(appBar:
                          AppBar(
                              actions:  const [
                                Align(alignment: Alignment.centerRight,
                                    child: Padding(padding: EdgeInsets.only(right: 20),
                                      child: Text('خانه',style: TextStyle(fontSize: 25),),)),],
                              automaticallyImplyLeading: false,
                              backgroundColor: back,
                              title:
                              Row(children: [
                                IconButton(icon:const Icon(Icons.menu), onPressed: () {  },),
                                IconButton(icon:const Icon(Icons.add), onPressed : (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCentralDevice()));})],
                              )
                          ),
                          body: Container(
                            child:const Center(child: Text('موردی برای نمایش وجود ندارد',
                              style: TextStyle(color: Colors.white),),),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [back, Colors.black],
                                    transform: GradientRotation(1.57))
                            ),),
                        ),
                        Scaffold(appBar:
                          AppBar(
                              actions:  const [
                                Align(alignment: Alignment.centerRight,
                                    child: Padding(padding: EdgeInsets.only(right: 20),
                                      child: Text('خانه',style: TextStyle(fontSize: 25),),)),],
                              automaticallyImplyLeading: false,
                              backgroundColor: back,
                              title:
                              Row(children: [
                                IconButton(icon:const Icon(Icons.menu), onPressed: () {  },),
                                IconButton(icon:const Icon(Icons.add), onPressed : (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCentralDevice()));})],
                              )
                          ),
                          body: Container(
                            child:const Center(child: Text('موردی برای نمایش وجود ندارد',
                              style: TextStyle(color: Colors.white),),),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [back, Colors.black],
                                    transform: GradientRotation(1.57))
                            ),),
                        ),
                      ],
                    ),
                  ),
                ),
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
    return Scaffold(appBar: AppBar(backgroundColor: back,
        title: const Align(
          alignment: Alignment.centerRight, child: Text('اضافه کنید'),))
        , resizeToAvoidBottomInset: false,
        body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [back, Colors.black],
                    transform: GradientRotation(1.57))
            ),
            child: Stack(children: [
              Align(alignment: Alignment.topRight,child: SpecialText('توکن دستگاه خود را وارد کنید'),),
              Center(child: EditText(hint: 'توکن دستگاه',),),
              IcButton(text: 'QR code',margin: 50, icon: const Icon(Icons.qr_code_outlined,color: Colors.white,),
                color:orange ,textColor: Colors.white,onPressed: ()=>{Navigator.of(context).push(MaterialPageRoute(builder: (context) => Activate1()))},)
            ])
        )
    );
  }
}

class Activate1 extends StatelessWidget {
  const Activate1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color blue = Color.fromARGB(255,96, 172, 247);
    const Color back = Color.fromARGB(255, 27, 40, 69);
    const Color orange = Color.fromARGB(255, 255, 74, 28);
    return Scaffold(appBar: AppBar(backgroundColor: back,
        title: const Align(
          alignment: Alignment.centerRight, child: Text('راه اندازی'),))
        , resizeToAvoidBottomInset: false,
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [back, Colors.black],
                    transform: GradientRotation(1.57))
            ),
            child: Stack(children: [
              Align(alignment: Alignment.topRight,child: SpecialText('لطفا اطلاعات مربوط به دستگاه مرکزی خود را وارد کنید'),),
              Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children : [
                EditText(hint: 'نام دستگاه',),
                const SizedBox(height: 20,),
                EditText(hint: 'مکان مورد استفاده',),
                const SizedBox(height: 20,),
                EditText(hint: 'رمز عبور',),
              ] ),),
              Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Button(width: 180,margin: 20,onPressed: ()=>{},textColor: Colors.white,color: blue,text: 'مرحله بعد',),
              ],)
            ])
        )
    );
  }
}

class AlignEditText extends Align{
  AlignEditText({Key? key,required String hint,required double margin}) :
        super(key: key,alignment: Alignment.bottomCenter,
          child:Container(
              margin:  EdgeInsets.only(bottom: margin),
              child:EditText(hint:hint)
          ),
        );
}

class EditText extends SizedBox{
   EditText({Key? key,String? hint}) : super(key: key,width: 350,child:
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
   );
}

class Button extends Align{
   Button({Key? key,double? width,required double margin,String? text,Color? textColor,Color? color,VoidCallback? onPressed}) : super(key: key,alignment:Alignment.bottomCenter,
      child:Container(
          margin: EdgeInsets.only(bottom: margin),child:
        SizedBox(width: width ?? 240,height: 50,child:
          ElevatedButton(onPressed: onPressed,
            child: Text(text!,style: TextStyle(fontSize: 18,color: textColor)),
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

class IcButton extends Align{
  IcButton({Key? key,required double margin,required Icon icon,String? text,Color? textColor,Color? color,VoidCallback? onPressed}) : super(key: key,alignment:Alignment.bottomCenter,
    child:Container(
        margin: EdgeInsets.only(bottom: margin),child:
        SizedBox(width: 240,height: 50,child:
          ElevatedButton(onPressed: onPressed,
            child:Align(alignment: Alignment.center,child: Row(mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
              Text(text!,style: TextStyle(fontSize: 18,color: textColor)),
              icon,
            ],),),
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

class BackCube extends SizedBox{
  BackCube({Color? back,Color? shadow,Offset? offset}) : super(width: 320,height: 320,
      child:Container(
        decoration:  BoxDecoration(color: back,borderRadius: BorderRadius.all(Radius.circular(40))
            ,boxShadow: [
              BoxShadow(
                color: shadow!,
                spreadRadius: -30,
                blurRadius: 40,
                offset: offset!, // changes position of shadow
              )
            ]),
      ) );

}

class SpecialText extends Text{
  SpecialText(String data, {Key? key,TextStyle? textStyle,double? fountSize}) : super(data,key: key,
    style: textStyle != null? textStyle :  TextStyle(fontSize: fountSize !=null ? fountSize : 35,color: Colors.white));
}