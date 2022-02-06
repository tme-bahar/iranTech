
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iran tech',
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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  late AnimationController rotationController = AnimationController(duration: const Duration(milliseconds: 5000), vsync: this);
  @override
  Widget build(BuildContext context) {

    const Color orange = Color.fromARGB(255, 255, 74, 28);
    const Color back = Color.fromARGB(255, 27, 40, 69);
    const Color blue = Color.fromARGB(255,96, 172, 247);
    rotationController.repeat();
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
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginState()));
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

class LoginState extends StatefulWidget {
  @override
  State<LoginState> createState() => Login();
}

class Login extends State<LoginState> {
  Login({Key? key}) : super();
  String username = "";
  String password = "";
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    const Color back = Color.fromARGB(255, 27, 40, 69);
    const Color blue = Color.fromARGB(255,96, 172, 247);
    return Scaffold(resizeToAvoidBottomInset: false,
      appBar: AppBar(titleTextStyle: const TextStyle(color: Colors.white,fontSize: 25,)
          ,backgroundColor: back,title:const Align(alignment: Alignment.centerRight,child: Text('ورود'),)),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [back,back,back, Colors.black],
              transform: GradientRotation(1.57))
          ),
          child: Stack(children: [
            //login button
            Button(text:'ورود' ,margin: 100,color: blue,textColor: Colors.black,onPressed: () {
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
              username = usernameController.text;
              password = passwordController.text;
              login();
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  WaitingState()));
              },),
            //password text filed
            AlignEditText(hint: 'رمز عبور', margin: 320,controler: passwordController,),
            AlignEditText(hint: 'نام کاربری', margin: 400,controler: usernameController,),
            Align(alignment: Alignment.bottomCenter,child:
              Container(
                  margin: const EdgeInsets.only(bottom: 270),child:
                  SizedBox(width: 350,child:
                      MaterialButton(onPressed: ()=>{
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const Forget()))
                      },child: SpecialText('رمز عبور خود را فراموش کرده اید ؟'),) ,
                  )
              ),
            ),
          ])
      )
    );
  }

  void login() async {
    String url = 'https://bsite.net/irantech/ParlarProject/login.aspx?field=$username&password=$password';
    final response = await http.get(Uri.parse(url));
    // final client = RetryClient(http.Client());
    // log(await client.read(Uri.parse(url)));
    log(url);
    // var response = await http.get(Uri.parse(url), headers: {
    //   "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    //   "Access-Control-Allow-Credentials":
    //   'true', // Required for cookies, authorization headers with HTTPS
    //   "Access-Control-Allow-Headers":
    //   "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    //   "Access-Control-Allow-Methods": "POST, OPTIONS"
    // });
    //log(response.statusCode.toString());
    if (response.statusCode == 200) {
      log(response.body);
      List<UserDevice> list =  UserDevice.allFromJson(jsonDecode(response.body));
      if(list.elementAt(0).exception.toString().isEmpty)
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  Home(list: list)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  String username = "";
  String password = "";
  String name = "";
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
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
                username = usernameController.text;
                password = passwordController.text;
                name = nameController.text;
                sign_up(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  WaitingState()));},),
              AlignEditText(margin : 420,hint : 'نام',controler: nameController,),
              AlignEditText(margin : 340,hint :  'نام کاربری',controler: usernameController,),
              AlignEditText(hint: 'رمز عبور', margin: 260,controler: passwordController,)
            ])
        )
    );
  }
  void sign_up(BuildContext context) async {
    String url = 'https://bsite.net/irantech/ParlarProject/sign_up.aspx?username=$username&password=$password&name=$name';
    final response = await http
        .get(Uri.parse(url));
    if (response.statusCode == 200) {
      log(response.body);
      Message message =  Message.fromJson(jsonDecode(response.body));
      if(message.exception.toString().isEmpty) {
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class Home extends StatelessWidget {
  List<UserDevice> list ;
  Home({Key? key,required this.list}) : super(key: key);
 void startAdd(){
   (context) =>  Login();
 }
  @override
  Widget build(BuildContext context) {
    const Color back = Color.fromARGB(255, 27, 40, 69);
    const Color orange = Color.fromARGB(255, 255, 74, 28);
    return Scaffold(appBar:
        AppBar(
            actions:  const [
              Align(alignment: Alignment.centerRight,
                  child: Padding(padding: EdgeInsets.only(right: 20),
                    child: Text('خانه',style: TextStyle(fontSize: 25),),)),],
            automaticallyImplyLeading: false,
            backgroundColor: back,
            title:
            Row(children: [
              IconButton(icon:const Icon(Icons.help), onPressed: () {  },),
              IconButton(icon:const Icon(Icons.add), onPressed : (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddCentralDevice()));})],
            )
        ),
        resizeToAvoidBottomInset: false,
        body: MaterialApp(
                home: DefaultTabController(
                  length: 3,
                  child: Scaffold(backgroundColor: const Color.fromARGB(0, 0, 0, 0) ,
                    bottomNavigationBar: rooms(),
                    body: TabBarView(
                      children: tabViewChildren(context)
                    ),
                  ),
                ),
              )
    );
  }
  Widget rooms() {
    const Color orange = Color.fromARGB(255, 255, 74, 28);
    const Color back = Color.fromARGB(255, 27, 40, 69);
    return Container(
      color: back,
      child: TabBar(
        labelColor: orange,
        unselectedLabelColor: Colors.white70,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: orange,
        tabs: tabs()
      ),
    );
 }
  List<Tab> tabs(){
    List<Tab> result = List.generate(0, (index) => Tab());
    result.add(const Tab(text: 'همه',),);
    result.add(const Tab(text: 'علاقه مند',),);

    List<String> rooms = List.generate(0, (index) => '');
    for(int i = 0; i < list.length; i++) {
      if(!rooms.contains(list.elementAt(i).device_name)) {
        rooms.add(list.elementAt(i).device_name);
      }
    }

    for(int i = 0; i < list.length; i++) {
      result.add(Tab(text: rooms.elementAt(i),),);
    }
    return result;
  }

  List<Widget> tabViewChildren(BuildContext context){
    const Color back = Color.fromARGB(255, 27, 40, 69);
    List<Widget> result = List.generate(0, (index) => Button(margin: 0));

    result.add(
      Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [back, Colors.black],
                  transform: GradientRotation(1.57))
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: all(context),),
        ),
      ),
    );

    result.add(
      Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [back, Colors.black],
                  transform: GradientRotation(1.57))
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: favors(context),),
        ),
      ),
    );

    List<String> rooms = List.generate(0, (index) => '');
    for(int i = 0; i < list.length; i++) {
      if(!rooms.contains(list.elementAt(i).device_name)) {
        rooms.add(list.elementAt(i).device_name);
      }
    }

    for(int i = 0; i < rooms.length; i++) {
      result.add(Scaffold(
          body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [back, Colors.black],
                    transform: GradientRotation(1.57))
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: forRooms(context, rooms.elementAt(i)),),
          ),
        ),
      );
    }

    return result;
 }

  List<Widget> forRooms(BuildContext context,String room){
    List<Widget> result = List.generate(0, (index) => Button(margin: 0));
    List<UserDevice> favorList = List.generate(0, (index) => const UserDevice(token: '', user_id: '', device_name: '', device_type: '', status: '', id: '', exception: '', device_id: ''));

    for(int i = 0; i < list.length; i ++) {
      if(list.elementAt(i).device_name == room) {
        favorList.add(list.elementAt(i));
      }
    }

    result.add(Column(children: allToWidget(partition(favorList,true), false, context),));
    result.add(const SizedBox(width: 20,));
    result.add(Column(children: allToWidget(partition(favorList,false), false, context),));
    return result;
  }

  List<Widget> favors(BuildContext context){
    List<Widget> result = List.generate(0, (index) => Button(margin: 0));
    List<UserDevice> favorList = List.generate(0, (index) => const UserDevice(token: '', user_id: '', device_name: '', device_type: '', status: '', id: '', exception: '', device_id: ''));

    for(int i = 0; i < list.length; i ++) {
      if(list.elementAt(i).status == 1) {
        favorList.add(list.elementAt(i));
      }
    }

    result.add(Column(children: allToWidget(partition(favorList,true), false, context),));
    result.add(const SizedBox(width: 20,));
    result.add(Column(children: allToWidget(partition(favorList,false), false, context),));
    return result;
  }

  List<Widget> all(BuildContext context){
    List<Widget> result = List.generate(0, (index) => Button(margin: 0));
    result.add(Column(children: allToWidget(partition(list,true), true, context),));
    result.add(const SizedBox(width: 20,));
    result.add(Column(children: allToWidget(partition(list,false), true, context),));
    return result;
  }
  List<UserDevice> partition(List<UserDevice> list,bool isFirst){
    List<UserDevice> result = List.generate(0, (index) => const UserDevice(token: '', user_id: '', device_name: '', status: '', id: '', device_type: '', exception: '', device_id: ''));
    for(int i = (isFirst?0:list.length~/2); i < (isFirst?(list.length~/2):list.length); i++) {
      result.add(list.elementAt(i));
    }
    return result;
  }
  List<Widget> allToWidget(List<UserDevice> data,bool hasRoomName,BuildContext context){
   List<Widget> result = List.generate(0, (index) => Button(margin: 0));
   result.add(const SizedBox(height: 20,));
   for(int i = 0; i < data.length; i++) {
     result.add(toWidget(data.elementAt(i), hasRoomName, context));
     result.add(const SizedBox(height: 20,));
   }
   return result;
  }

  Widget toWidget(UserDevice data,bool hasRoomName,BuildContext context){
   return Device(token: data.token,con: context, iconDir: 'Icon_television.png', ID: data.id, name: data.device_type + (hasRoomName?'\n'+data.device_name:''));
  }
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
  bool vol = false;
  final String ID;
  final String name;
  final String token;
  ControlPage({Key? key,required this.ID,required this.name,required this.token}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const Color blue = Color.fromARGB(255,96, 172, 247);
    const Color back = Color.fromARGB(255, 27, 40, 69);
    const Color orange = Color.fromARGB(255, 255, 74, 28);
    const Color button = Color.fromARGB(255,77, 87, 109);
    return Scaffold(appBar: AppBar(backgroundColor: back,
        title: Align(
          alignment: Alignment.centerRight, child: Text(name.contains('\n')?name.split('\n')[0]:name),))
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
                        child: ElevatedButton(onPressed: ()=>{funtion(context, 'power')},
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
                      const SizedBox(width: 50,),
                      SizedBox(width: 85,
                        child: ElevatedButton(onPressed: ()=>{},
                          child: const Icon(Icons.star_border),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(button),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      side: BorderSide(color: blue),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  )
                              )),
                        ),
                      ),
                      const SizedBox(width: 50,),
                      SizedBox(width: 85,
                          child: ElevatedButton(onPressed: ()=>{funtion(context, 'menu')},
                            child: SpecialText('menu'),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(button),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                        side: BorderSide(color: blue),
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    )
                                )),
                          ),
                      )
                    ]),
                const SizedBox(height: 50,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                        SizedBox(width: 55,height: 174,child:
                          Container(child:
                            Stack(children: [
                              Align(alignment: Alignment.topCenter,child:
                                SizedBox(width: 55,height: 87,child:
                                  ElevatedButton(onPressed: ()=>{funtion(context, 'ch')},
                                      child:const Center(child: Icon(Icons.keyboard_arrow_up,color: Colors.white,)),
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(button),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(20),
                                                      topRight: Radius.circular(20),
                                                      bottomLeft: Radius.circular(0),
                                                      bottomRight: Radius.circular(0),
                                                  )
                                              )
                                          )),
                                  ),
                                ),
                              ),
                              Align(alignment: Alignment.bottomCenter,child:
                                SizedBox(width: 55,height: 87,child:
                                    ElevatedButton(onPressed: ()=>{funtion(context, 'ch-')},
                                      child: const Center(child: Icon(Icons.keyboard_arrow_down,color: Colors.white,),),
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(button),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(0),
                                                    topRight: Radius.circular(0),
                                                    bottomLeft: Radius.circular(20),
                                                    bottomRight: Radius.circular(20),
                                                  )
                                              )
                                          )),
                                    ),
                                  )
                              ),
                              Center(child: SpecialText('CH',fountSize: 15,),)
                            ],),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                border: Border.all(color:blue),
                                color: button,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        SizedBox(height: 55,width: 55,child:
                          ElevatedButton(onPressed: ()=>{funtion(context, 'mute')},
                            child: const Icon(Icons.volume_off),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(button),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                        side: BorderSide(color: blue),
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    )
                                )),
                          ),
                        )
                      ],),
                      const SizedBox(width: 10,),
                      Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                        SizedBox(width: 240,height: 240,child:
                          Container(
                            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(150)),
                              color: button,),
                            child: Stack(children: [
                                Center(child:
                                  SizedBox(width: 100,height: 100,child:
                                    ElevatedButton(onPressed: ()=>{},
                                      child: SpecialText('OK'),
                                      style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,50, 55, 65)),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(150),
                                                  )
                                              )
                                          )
                                      )
                                    ),
                                  )
                                ),
                                ButtonOnControl(margin: const EdgeInsets.only(top:10), icon: Icons.arrow_drop_up, alignment: Alignment.topCenter, onPressed: () {funtion(context, 'up');  },),
                                ButtonOnControl(margin: const EdgeInsets.only(left:10), icon: Icons.arrow_left, alignment: Alignment.centerLeft, onPressed: () {funtion(context, 'left');  },),
                                ButtonOnControl(margin: const EdgeInsets.only(right:10), icon: Icons.arrow_right, alignment: Alignment.centerRight, onPressed: () {funtion(context, 'right'); },),
                                ButtonOnControl(margin: const EdgeInsets.only(bottom:10), icon: Icons.arrow_drop_down, alignment: Alignment.bottomCenter, onPressed: () {funtion(context, 'down');  },)
                              ]
                            ),
                          ),
                        ),
                      ],),
                      const SizedBox(width: 10,),

                      Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                        SizedBox(width: 55,height: 174,child:
                          Container(child:
                            Stack(children: [
                              Align(alignment: Alignment.topCenter,child:
                                SizedBox(width: 55,height: 87,child:
                                  ElevatedButton(onPressed: ()=>{funtion(context, 'vol')},
                                    child:const Center(child: Icon(Icons.volume_up,color: Colors.white,)),
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,77, 87, 109)),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                  bottomLeft: Radius.circular(0),
                                                  bottomRight: Radius.circular(0),
                                                )
                                            )
                                        )),
                                  ),
                                ),
                              ),
                              Align(alignment: Alignment.bottomCenter,child:
                                SizedBox(width: 55,height: 87,child:
                                  ElevatedButton(onPressed: ()=>{funtion(context, 'vol-')},
                                    child: const Center(child: Icon(Icons.volume_down,color: Colors.white,),),
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,77, 87, 109)),
                                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                            const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(0),
                                                  topRight: Radius.circular(0),
                                                  bottomLeft: Radius.circular(20),
                                                  bottomRight: Radius.circular(20),
                                                )
                                            )
                                        )),
                                  ),
                                )
                              ),
                              Center(child: SpecialText('Vol',fountSize: 15,),)
                            ],),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Color.fromARGB(255,77, 87, 109),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        SizedBox(height: 55,width: 55,child:
                          ElevatedButton(onPressed: ()=>{funtion(context, 'exit')},
                            child: const Icon(Icons.exit_to_app),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255,77, 87, 109)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                        side: BorderSide(color: Color.fromARGB(255, 96, 172, 247)),
                                        borderRadius: BorderRadius.all(Radius.circular(20))
                                    )
                                )),
                          ),
                        )
                      ],)
                    ]),
              ],),
        )
    );
  }
  void funtion(BuildContext context,String function) async {
    String s = token.trim();
    String url = 'https://bsite.net/irantech/ParlarProject/Running.aspx?deviceid=$ID&functionname=$function&token=$s';
    final response = await http.get(Uri.parse(url));
    // final client = RetryClient(http.Client());
    // log(await client.read(Uri.parse(url)));
    log(url.substring(0,60));
    log(url.substring(60,url.length));
    // var response = await http.get(Uri.parse(url), headers: {
    //   "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    //   "Access-Control-Allow-Credentials":
    //   'true', // Required for cookies, authorization headers with HTTPS
    //   "Access-Control-Allow-Headers":
    //   "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    //   "Access-Control-Allow-Methods": "POST, OPTIONS"
    // });
    //log(response.statusCode.toString());
    if (response.statusCode == 200) {
      log(response.body);
      //List<UserDevice> list =  UserDevice.allFromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class WaitingState extends StatefulWidget {
  @override
  State<WaitingState> createState() => Waiting();
}

class Waiting extends State<WaitingState> with SingleTickerProviderStateMixin {
  Waiting({Key? key}) : super();
  late AnimationController rotationController = AnimationController(duration: const Duration(milliseconds: 5000), vsync: this);
  @override
  Widget build(BuildContext context) {
    const Color blue = Color.fromARGB(255,96, 172, 247);
    const Color back = Color.fromARGB(255, 27, 40, 69);
    const Color orange = Color.fromARGB(255, 255, 74, 28);
    rotationController.repeat();
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [back, Colors.black],
                    transform: GradientRotation(1.57))
            ),
            child:Stack(children: [
              Positioned(top: 350,right: -120,
                  child:RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
                    child: Transform.rotate(angle: -3.14 / 4, child:BackCube(shadow: orange,back: back,offset: const Offset(-15,-15),)
                  ),
                ),
              ),
              Positioned(top: 175,left: -120,
                      child:RotationTransition(
                          turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
                          child: Transform.rotate(angle: -3.14 / 4, child:BackCube(shadow: blue,back: back,offset: const Offset(15,15),))
                  ),
              ),
              Center(child: SpecialText('لطفا صبر کنید ...'),)
            ],)
        )
    );
  }
}

class Forget extends StatelessWidget {
  const Forget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const Color blue = Color.fromARGB(255,96, 172, 247);
    const Color back = Color.fromARGB(255, 27, 40, 69);
    const Color orange = Color.fromARGB(255, 255, 74, 28);
    return Scaffold(appBar: AppBar(backgroundColor: back,
        title: const Align(
          alignment: Alignment.centerRight, child: Text('فراموشی'),))
        , resizeToAvoidBottomInset: false,
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [back, Colors.black],
                    transform: GradientRotation(1.57))
            ),
            child:Center(child: SpecialText('برای دریافت مجدد رمز عبو و نام کاربری، مشخصات دستگاه خود را به ایمیل زیر ارسال کنید\n irantech.parlar@gmail.com'),)
            )
    );
  }
}



class AlignEditText extends Align{
  AlignEditText({Key? key,required String hint,required double margin,TextEditingController? controler}) :
        super(key: key,alignment: Alignment.bottomCenter,
          child:Container(
              margin:  EdgeInsets.only(bottom: margin),
              child:EditText(hint:hint,controler: controler,)
          ),
        );
}

class EditText extends SizedBox{
   EditText({Key? key,String? hint, TextEditingController? controler}) : super(key: key,width: 350,child:
     Container(
       child:Padding(child:
         TextField(decoration:
           InputDecoration(
             hintText: hint,
             hintTextDirection: TextDirection.rtl,
             hintStyle: const TextStyle(color: Colors.white),
             focusColor: Colors.white,
             hoverColor: Colors.white,
           ),
             controller: controler,
             style:const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
           )
         , padding: const EdgeInsets.all(5),),
       decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 2)),
     ),
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
  SpecialText(String data, {Key? key,TextStyle? textStyle,double? fountSize,TextDirection? textDir,TextAlign? textAlign}) : super(data,key: key,
    style: textStyle ?? TextStyle(fontSize: fountSize ?? 20,color: Colors.white),
      textDirection: textDir ?? TextDirection.rtl,
      textAlign: textAlign);
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
            Home(list:List<UserDevice>.generate(1, (index) => UserDevice(device_name: 'device_name', id: 'id', device_type: 'device_type', device_id: 'device_id', exception: 'exception', status: 'status', token: 'token', user_id: 'user_id')))));},
      child: Align(alignment: Alignment.centerRight,child:
        SpecialText(K3 ?? K2,fountSize : 15)
      ,),
    )
  );
}

class Device extends SizedBox{
  Device( {Key? key,required BuildContext con,required String iconDir,required String token,required String ID,required String name,TextDirection? textDir}) :
        super(key: key,width: 170,height: 130,child:
      ElevatedButton(style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255,77, 87, 109)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )
          )),
        onPressed: () {
          Navigator.of(con).push(MaterialPageRoute(builder: (context) => ControlPage(ID: ID, name: name,token: token,) ));
          },
        child: Center(child:
        Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          SizedBox(width: 50 ,child: Image.asset('assets/$iconDir')),
          const SizedBox(height: 5,),
          SpecialText(name,fountSize : 15,textDir: textDir,textAlign: TextAlign.center,)
        ],),),
      )
      );
}

class ButtonOnControl extends Align{
  ButtonOnControl({Key? key,required EdgeInsetsGeometry margin,required IconData icon,required VoidCallback onPressed,required AlignmentGeometry alignment})
      : super(key: key,alignment: alignment, child:
  Container(margin: margin,
      child:
      SizedBox(width: 50,height: 50,
          child: RawMaterialButton(
            onPressed: onPressed,
            child:Icon(icon,size: 40,color: Colors.white,),
          )
      )
  ),
  );
}


class UserDevice {
  final String device_name;
  final String id;
  final String device_type;
  final String device_id;
  final String user_id;
  final String status;
  final String token;
  final String exception;

  const UserDevice({
    required this.device_name,
    required this.id,
    required this.device_type,
    required this.device_id,
    required this.exception,
    required this.status,
    required this.token,
    required this.user_id
  });

  static List<UserDevice> allFromJson(List<dynamic> json) {
    return List<UserDevice>.generate(json.length,(i)=>UserDevice.fromJson(json.elementAt(i)));
  }

  factory UserDevice.fromJson(Map<String, dynamic> json) {
    return UserDevice(
        device_name: json['device_name'],
        id: json['id'],
        device_type: json['device_type'],
        device_id: json['device_id'],
        exception: json['exception'],
        status: json['status'],
        token: json['token'],
        user_id: json['user_id']
    );
  }
}

class Message {
  final String id;
  final String text;
  final String exception;

  const Message({
    required this.id,
    required this.text,
    required this.exception,
  });
  
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
        id: json['id'],
        text: json['text'],
        exception: json['exception'],
    );
  }
}
