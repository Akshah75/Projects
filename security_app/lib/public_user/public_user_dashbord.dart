import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:security_app/widget/grid_view.dart';
import '../provider/auth.dart';
import '../widget/listview.dart';

class PublicUserDashbord extends StatefulWidget {
  const PublicUserDashbord({Key? key}) : super(key: key);

  @override
  State<PublicUserDashbord> createState() => _PublicUserDashbordState();
}

class _PublicUserDashbordState extends State<PublicUserDashbord> {
  int? totalcase;
  @override
  void initState() {
    super.initState();
    // getdashData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: const Color.fromARGB(227, 211, 207, 207),
      body: GridViewScreen(),
    );
  }
}
//        GridView(
//         padding: const EdgeInsets.all(20),
//         gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//             maxCrossAxisExtent: 200,
//             childAspectRatio: 3 / 2,
//             crossAxisSpacing: 20,
//             mainAxisSpacing: 20),
//         children: [
//           // DashbordItems(
//           //     title: "totalCases", count: totalcase, color: Colors.green),
//         ],
//         // children: DUMMY_PUBLIC_USER_DASHBORD_DATA
//         //     .map((dashData) => DashbordItems(
//         //         title: dashData.title,
//         //         count: dashData.count,
//         //         color: dashData.color))
//         //     .toList(),
//       ),
//     );

//     //
//   }

//   void getdashData() {
//     print("work");
//     final userData = Provider.of<Auth>(context, listen: false).totalCase;
//     print(userData);
//     setState(() {
//       totalcase = userData;
//     });
//   }
// }
