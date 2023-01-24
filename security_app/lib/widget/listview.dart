import 'package:flutter/material.dart';

//
class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, inx) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 2,
                  child: Container(
                    height: 150,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          );
        });
  }
}
