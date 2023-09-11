class Itemtype {
  static Map ItemType = {
    'Dual axe': 1,
    'Dagger': 1,
    'Light staff': 1,
    'Crossbow': 1,
    'Harp': 1,
    'Onehand sword': 1,
    'Shield': 2,
    'Twohand staff': 1,
    'Twohand sword': 1,
    'Dark staff': 1,
    'Blade': 1,
    'Bow': 1,
    'Glavie': 1,
    'Spear': 1,
    'Sword': 1,
  };

  static int getitemtype(String type) {
    if (type == null) {
      return 0;
    } else {
      return ItemType[type];
    }
  }
}
