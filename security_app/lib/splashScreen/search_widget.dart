import 'package:flutter/material.dart';

//
class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          return close(context, null);
        },
        icon: const Icon(Icons.arrow_back),
      );

  @override
  Widget buildResults(BuildContext context) {
    return const Center(
      child: Text("serech complaint"),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text("complaint search"),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear),
        ),
      ];
}
                       // : Container(),
////////////////////////////////////////////////////////////////////////////////
                        // OutlinedButton(
                        //     onPressed: () {
                        //       if (currentPage == totalpage) {
                        //         getComplaintData();
                        //       }
                        //     },
                        //     child: Text("Last")),
//////////////////////////////////////////////////////////////////////////////