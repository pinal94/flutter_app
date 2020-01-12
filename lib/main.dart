import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: "Login"),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Heebo', fontSize: 20);

  @override
  Widget build(BuildContext context) {
    final txtEmail = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );

    final txtPassword = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Pasword",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
    );

    final btnLogin = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xff01A0C7),
      child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NavigationActivty()));
          },
          child: Text("Login",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold))),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 150,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45),
                txtEmail,
                SizedBox(height: 25),
                txtPassword,
                SizedBox(height: 35),
                btnLogin,
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationActivty extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Menu Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyNavigationPage(title: 'Dashboard'),
    );
  }
}

class MyNavigationPage extends StatefulWidget {
  MyNavigationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyNavigationState createState() => new MyNavigationState();
}

class MyNavigationState extends State<MyNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[new Text("Dashboard")],
        ),
      ),
      drawer: new Container(
        constraints: new BoxConstraints.expand(
            width: MediaQuery.of(context).size.width - 80),
        color: Colors.white,
        alignment: Alignment.center,
        child: new ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              padding: const EdgeInsets.all(0),
              child: new UserAccountsDrawerHeader(
                accountName: new Text(
                  "Pinal Gangani",
                  style: TextStyle(color: Colors.lightBlue),
                ),
                accountEmail: new Text(
                  "pinal.gangani@gmail.com",
                  style: TextStyle(color: Colors.lightBlue),
                ),
                decoration: new BoxDecoration(color: Color(0xffF5F5F5)),
                currentAccountPicture: FlutterLogo(),
              ),
            ),
            new ListTile(
                leading: new Icon(Icons.info),
                title: new Text("Dashboard"),
                onTap: () {OnClickNavigation("Dashboard");}),
            new ListTile(
              leading: new Icon(Icons.shopping_cart),
              title: new Text("Cart"),
              onTap: () {OnClickNavigation("Cart");},
            ),
            new ListTile(
              leading: new Icon(Icons.favorite_border),
              title: new Text("Watch List"),
              onTap: () {OnClickNavigation("Watch List");},
            ),
            new ListTile(
              leading: new Icon(Icons.settings_power),
              title: new Text("Logout"),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }


  void OnClickNavigation(s) {
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Success"),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 19),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 19),
                      child: FlutterLogo(size: 70),
                    ),
                    Text(
                      s,
                      textAlign: TextAlign.center,
                      style: new TextStyle(fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }));
  }
}
