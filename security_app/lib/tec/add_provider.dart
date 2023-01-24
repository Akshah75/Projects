import 'package:flutter/foundation.dart';
import '../tec/place.dart';

class AddProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
}
