import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.deepPurpleAccent,
        ),
      ),
      home: const HomeActivity(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({Key? key});

  MySnackBar(message, context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void dismissSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventory App'),
        titleSpacing: 2,
        centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {
              MySnackBar("This is Home Icon", context);
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
     body: Stack(
        children: [
          const Center(
            child: Text("hello"),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                dismissSnackBar(context);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child:Icon(Icons.add) ,
        onPressed: (){
         MySnackBar("This is floating button", context);
        },
        backgroundColor: Colors.pink,
      ),
    );
  }
}
