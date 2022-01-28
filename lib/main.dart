
import 'package:flutter/material.dart';
import 'dart:developer';
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
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [back, Colors.black],
                                      transform: GradientRotation(1.57))
                              ),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  Column(children: [
                                    const SizedBox(height: 30,),
                                    Device(iconDir: 'Icon_coffee maker.png', name: 'قهوه ساز',con: context,ID: '0',),
                                  ],),
                                  const SizedBox(width: 20,),
                                  Column(children: [
                                    const SizedBox(height: 30,),
                                    Device(iconDir: 'Icon_television.png', name: 'صوتی تصویری',con: context,ID: '1',),
                                  ],)
                                ],),
                          ),
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
                Button(width: 250,margin: 40,onPressed: ()=>{Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDevice()))
                  },textColor: Colors.white,color: blue,text: 'مرحله بعد',),
              ],)
            ])
        )
    );
  }
}

class AddDevice extends StatelessWidget {
  const AddDevice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color blue = Color.fromARGB(255,96, 172, 247);
    const Color back = Color.fromARGB(255, 27, 40, 69);
    const Color orange = Color.fromARGB(255, 255, 74, 28);
    return Scaffold(appBar: AppBar(backgroundColor: back,
        title: const Align(
          alignment: Alignment.centerRight, child: Text('اضافه کنید'),))
        , resizeToAvoidBottomInset: false,
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [back, Colors.black],
                    transform: GradientRotation(1.57))
            ),
            child:SingleChildScrollView(child:
              Column(children: [
                Align(alignment: Alignment.topRight,child: SpecialText('لطفا دستگاه مورد نظر خود را از بین دسته بندی ها انتخاب کنید'),),
                EditText(hint: 'جست و جو بین محصولات',),
                const SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Column(children: [
                      DeviceType(iconDir: 'Icon_sockets.png', text: 'پریز برق و فیوز',K: 'power',con: context,),
                      const SizedBox(height: 20,),
                      DeviceType(iconDir: 'Icon_refrigerator.png', text: 'یخچال',K: 'refrigerator',con: context,),
                      const SizedBox(height: 20,),
                      DeviceType(iconDir: 'Icon_washing machine.png', text: 'لباس شویی',K: 'washing machine',con: context),
                      const SizedBox(height: 20,),
                      DeviceType(iconDir: 'Icon_router.png', text: 'شبکه و وسایل هوشمند',K: 'router',con: context,),
                      const SizedBox(height: 20,),
                      DeviceType(iconDir: 'Icon_electricity.png', text: 'روشنایی',K: 'electricity',con: context,),
                      const SizedBox(height: 20,),
                      DeviceType(iconDir: 'Icon_television.png', text: 'صوتی تصویری',K: 'television',con: context,),
                    ],),
                      const SizedBox(width: 20,),
                    Column(children: [
                      DeviceType(iconDir: 'Icon_coffee maker.png', text: 'قهوه ساز',K: 'coffee maker',con: context,),
                      const SizedBox(height: 20,),
                      DeviceType(iconDir: 'Icon_dishwater.png', text: 'ظرف شویی',K: 'dishwater',con: context,),
                      const SizedBox(height: 20,),
                      DeviceType(iconDir: 'Icon_water.png', text: 'شیر آلات',K: 'water',con: context,),
                      const SizedBox(height: 20,),
                      DeviceType(iconDir: 'Icon_stove.png', text: 'فر و گرمایش',K: 'stove',con: context,),
                      const SizedBox(height: 20,),
                      DeviceType(iconDir: 'Icon_mirror closet.png', text: 'سایر',K: 'other',con: context,),
                      const SizedBox(height: 20,),
                      DeviceType(iconDir: 'Icon_closet.png', text: 'دستگاه سفارشی',K: 'special',con: context,),
                    ],)
                  ],),
                const SizedBox(height: 20,),
              ],)
            )
        )
    );
  }
}

class ListPage extends StatelessWidget {
  final String K1;
  final String? K2;
  Map<String,Map<String,Map<String,String>>> table;
  Iterable<String>? data;
  ListPage({Key? key,required this.table,required String this.K1,this.K2}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    dataManaging();
    const Color blue = Color.fromARGB(255,96, 172, 247);
    const Color back = Color.fromARGB(255, 27, 40, 69);
    const Color orange = Color.fromARGB(255, 255, 74, 28);
    return Scaffold(appBar: AppBar(backgroundColor: back,
        title: const Align(
          alignment: Alignment.centerRight, child: Text('اضافه کنید'),))
        , resizeToAvoidBottomInset: false,
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [back, Colors.black],
                    transform: GradientRotation(1.57))
            ),
            child:SingleChildScrollView(child:
              Column(children: [
                Align(alignment: Alignment.topRight,child: SpecialText('لطفا دستگاه مورد نظر خود را از بین دسته بندی ها انتخاب کنید'),),
                EditText(hint: 'جست و جو بین محصولات',),
                const SizedBox(height: 20,),
                  Column(children: list(context)??[]),
              ],)
            )
        )
    );
  }
  void dataManaging(){
    if(K2 == null) {
      data = table[K1]?.keys ;
    } else {
      data = table[K1]![K2]?.keys ;
    }
  }
  List<Widget>? list(BuildContext context) {
    int j =  data?.length ?? 0;
    List<Widget>? result = [];
    for(int i = 0; i < j;i++){
      ListElement lm;
      lm = (K2 == null) ?
        ListElement(context: context,table: table,K1: K1,K2:data?.elementAt(i)??"") :
        ListElement(context: context,table: table,K1: K1,K2:K2??"",K3:data?.elementAt(i)??"");
      result.add(lm);
      result.add(const SizedBox(height: 15,),);
    }
    return result;
  }
}

class ControlPage extends StatelessWidget {
  final String ID;
  final String name;
  ControlPage({Key? key,required this.ID,required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const Color blue = Color.fromARGB(255,96, 172, 247);
    const Color back = Color.fromARGB(255, 27, 40, 69);
    const Color orange = Color.fromARGB(255, 255, 74, 28);
    return Scaffold(appBar: AppBar(backgroundColor: back,
        title: Align(
          alignment: Alignment.centerRight, child: Text(name),))
        , resizeToAvoidBottomInset: false,
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [back, Colors.black],
                    transform: GradientRotation(1.57))
            ),
            child:Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 85,
                        child: ElevatedButton(onPressed: ()=>{},
                          child: Icon(Icons.power_settings_new),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(orange),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  )
                              )),
                        ),
                      ),
                      SizedBox(width: 40,),
                      SizedBox(width: 85,
                        child: ElevatedButton(onPressed: ()=>{},
                          child: Icon(Icons.star_border),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255,77, 87, 109)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      side: BorderSide(color: Color.fromARGB(255, 96, 172, 247)),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  )
                              )),
                        ),
                      ),
                      SizedBox(width: 40,),
                      SizedBox(width: 85,
                          child: ElevatedButton(onPressed: ()=>{},
                            child: Icon(Icons.mic_rounded),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255,77, 87, 109)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                        side: BorderSide(color: Color.fromARGB(255, 96, 172, 247)),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    )
                                )),
                          ),
                      )
                    ]),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                    ]),
              ],),
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
    style: textStyle ?? TextStyle(fontSize: fountSize !=null ? fountSize : 20,color: Colors.white),
      textDirection: TextDirection.rtl);
}

class DeviceType extends SizedBox{
  final String K ;

  DeviceType({Key? key,required BuildContext con,required String text,required String iconDir, required this.K}) :
        super(key: key,width: 170,height: 110,child:
    ElevatedButton(style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color.fromARGB(255,77, 87, 109)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
            )
        )),
      onPressed: () {
        Map<String,Map<String,Map<String,String>>> table = {
          'power':{
            'pow':{'ug-265':'id'},
            'pow1':{'ug-265':'id'},
            'pow2':{'ug-265':'id'},
            'pow3':{'ug-265':'id'},
            'pow4':{'ug-265':'id'},
            'pow5':{'ug-265':'id'},
            'pow6':{'ug-265':'id'},
            'pow7':{'ug-265':'id'},
            'pow8':{'ug-265':'id'},
            'pow9':{'ug-265':'id'},
            'pow10':{'ug-265':'id'},
          }
        };
      Navigator.of(con).push(MaterialPageRoute(builder: (context) => ListPage(K1: K,table: table,) ));},
      child: Center(child:
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          SizedBox(width: 50 ,child: Image.asset('assets/$iconDir')),
          const SizedBox(height: 5,),
          SpecialText(text,fountSize : 15)
        ],),),
    )
  );

}

class ListElement extends SizedBox{
  String K1;
  String K2;
  String? K3;
  Map<String,Map<String,Map<String,String>>> table;
  ListElement({Key? key,required BuildContext context,required this.table
    ,required this.K1,required this.K2,this.K3})
      : super(key: key,width: 350,height: 60,child:
    ElevatedButton(style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,77, 87, 109)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
        )),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
            K3 == null ?
            ListPage(K1: K1,K2:K2,table: table,):
            Home()));},
      child: Align(alignment: Alignment.centerRight,child:
        SpecialText(K3 ?? K2,fountSize : 15)
      ,),
    )
  );
}

class Device extends SizedBox{
  final String ID ;
  final String name;
  final String iconDir;
  Device( {Key? key,required BuildContext con,required this.iconDir,required this.ID,required this.name,}) :
        super(key: key,width: 170,height: 110,child:
      ElevatedButton(style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255,77, 87, 109)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )
          )),
        onPressed: () {
          Navigator.of(con).push(MaterialPageRoute(builder: (context) => ControlPage(ID: ID, name: name) ));
          },
        child: Center(child:
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          SizedBox(width: 50 ,child: Image.asset('assets/$iconDir')),
          const SizedBox(height: 5,),
          SpecialText(name,fountSize : 15)
        ],),),
      )
      );
}