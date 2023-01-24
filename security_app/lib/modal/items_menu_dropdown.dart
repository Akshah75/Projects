import '../modal/menu_dropdown.dart';

//
class ItemMenuDropdown {
  static final List<MenuDropdownItem> itemFirst = [
    itemListing,
    itemMitting,
    itemComplidance,
    itemResoureces,
    itemActionTaken
  ];

  static final itemListing = MenuDropdownItem(
    text: 'Listing',
  );
  static final itemMitting = MenuDropdownItem(
    text: 'Mitting',
  );
  static final itemComplidance = MenuDropdownItem(
    text: 'Complidance',
  );
  static final itemResoureces = MenuDropdownItem(
    text: 'Resoureces',
  );

  static final itemActionTaken = MenuDropdownItem(
    text: 'Action taken',
  );
}
