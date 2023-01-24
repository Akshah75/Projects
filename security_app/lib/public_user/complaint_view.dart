import 'package:flutter/material.dart';
import 'package:security_app/provider/complaint_data_modal.dart';

class Complaintview extends StatelessWidget {
  // final user;
  // List<GetComplaintData>? user;
  GetComplaintData? user;
  Complaintview(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Complaint"),
      ),
      body: SingleChildScrollView(
        child: Container(
          // decoration: BoxDecoration( ),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    " Cno no:",
                  ),
                  Text("  ${user!.ctsno}")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Allotted to:"), Text("  ${user!.allotted}")],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Nature:"), Text("  ${user!.nature}")],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Name:"),
                  Text("${user!.firstname} ${user!.lastname}")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Cts no:"), Text("  ${user!.ctsno}")],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Survey no:"), Text("  ${user!.surveyno}")],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Device address:"),
                  Text("  ${user!.deviceaddress}")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Contact:"), Text("  ${user!.primarycontact}")],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ownership Type:"),
                  Text("  ${user!.ownershiptype}")
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Status:"), Text("  ${user!.status}")],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("District:"), Text("  ${user!.district}")],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Taluka:"), Text("  ${user!.taluka}")],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Landmark:"), Text("  ${user!.landmark}")],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Latitude:"), Text("  ${user!.latitude}")],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Longitude:"), Text("  ${user!.logitude}")],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Description:"),
                  Text("  ${user!.description}")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
