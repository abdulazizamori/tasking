import 'package:flutter/material.dart';
import 'package:tasking/presentation/widgets/custom_page_indicator.dart';

class CustomOnboardPage extends StatelessWidget {
  const CustomOnboardPage({
    super.key,
    required this.img,
    required this.text,
    required this.btnText,
    this.onTap,
  });
  final String img;
  final String text;
  final String btnText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            img,
            width: 400,
            height: 250,
            fit: BoxFit.fill,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        const Spacer(
          flex: 5,
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepPurple,
            ),
            child: Center(
              child: Text(
                btnText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        const CustomPageIndicator(),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
