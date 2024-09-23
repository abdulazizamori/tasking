import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back,color: Colors.white,)
          ),
          Image.asset('assets/images/logo1.png',width: 60,height: 30,),
          Text('E-commerce App',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
        ],
      ),
    );
  }
}
