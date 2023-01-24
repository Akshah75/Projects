import 'package:flutter/material.dart';

class BottomNavigationBars extends StatelessWidget {
  const BottomNavigationBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: const Color(0xfff8f8f8),
      child: IconTheme(
        data: const IconThemeData(color: Color(0xffabadb4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.add_chart),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
              child: Transform.translate(
                offset: const Offset(0, -15),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      colors: [
                        Color(0xff92e2ff),
                        Color(0xff1ebdf8),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(3, 3),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/detail');
                },
                child: const Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}
