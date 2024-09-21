import 'package:flutter/material.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: Container(
                width: 600,
                child: TextFormField(
                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      hintText: "Enter your Name",
                      //prefixIcon: Icon(Icons),

                    )),
              ),
            )

          ],
        ));
  }
}
