import 'package:event_app/ApiModals/event_api.dart';
import 'package:event_app/ApiModals/event_controller.dart';
import 'package:event_app/ApiModals/main/main_api_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final EventController marathonDatas = Get.put(EventController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => ListView.builder(
              itemCount: marathonDatas.marathonData.length,
              itemBuilder: (context, index) {
                return ProductTile(marathonDatas.marathonData[index]);
              }),
        ),
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final EventData product;
  const ProductTile(this.product);
  Widget build(BuildContext context) {
    return Container(
      child: Text("${product.marathon[1]?.id}"),
    );
  }
}
