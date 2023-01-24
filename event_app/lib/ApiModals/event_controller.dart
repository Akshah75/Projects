import 'package:event_app/ApiModals/api_services.dart';
import 'package:event_app/ApiModals/event_api.dart';
import 'package:event_app/ApiModals/main/main_api_modal.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  final eventList = <Event>[].obs;
  final marathonData = <EventData>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
    fetchUserDetail();
  }

  //
  void fetchProduct() async {
    final event = await RemoteServices.fetchEvent();
    if (event != null) {
      eventList.value = event;
    }
  }

  // void fetchUserDetail() async {
  //   final userDetail =
  //       Userdetail(userName: "accomplish10k", password: "accomplish10k123");
  //   EventData event = await RemoteServices.fetchUser(userDetail);
  //   // print(event.message);
  //   print(event.marathon);

  //   if (event != null) {
  //     marathonData.value = event.marathon as List<EventData>;
  //   }
  void fetchUserDetail() async {
    final userDetail =
        Userdetail(userName: "accomplish10k", password: "accomplish10k123");
    EventData event = await RemoteServices.fetchUser(userDetail);
    print(event.marathon);

    // for (var i = 1; i < event.marathon.length; i++) {
    //   print
    // (event.marathon["$i"]);
    // }
    final marathon = event.marathon;
    marathon.forEach((key, value) {
      print(value);
    });

    // marathonData.value = event.marathon[1]?.id as List<EventData>;
    // print(marathonData);

    // print(event.marathon);

    // print(event['user']);
    // print(event['marathon']);
    // print(event['token']);
    // print(event['message']);
    // print(event['succecss']);
  }
}
