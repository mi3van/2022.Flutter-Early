import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}
  
class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginDemo(changeTheme: _changeTheme),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
    );
  }
  
  _changeTheme(bool isDayTheme) {
    setState(() {
      _themeMode = isDayTheme ? ThemeMode.light : ThemeMode.dark;
    });
  }
}


class LoginDemo extends StatefulWidget {
  final ValueChanged<bool> changeTheme;
  
  const LoginDemo ({Key? key, required this.changeTheme}): super(key: key);
  
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  bool _isDayTheme = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: 
                SwitchListTile(
                  title: Text('Change theme'),
                  value: _isDayTheme,
                  onChanged: (isDayTheme) => {
                    setState(() {
                      _isDayTheme = isDayTheme;
                      widget.changeTheme(_isDayTheme);
                    }),
                  },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(width: 200, height: 150, child: FlutterLogo()),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}