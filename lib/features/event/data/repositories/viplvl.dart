class VIPLvlRW {
  static List lvl(point) {
    if (point < 1000) {
      return lvl1;
    } else if (point < 3000 && point >= 1000) {
      return lvl2;
    } else if (point < 6000 && point >= 3000) {
      return lvl3;
    } else if (point < 10000 && point >= 6000) {
      return lvl4;
    } else if (point <= 15000 && point >= 10000) {
      return lvl5;
    } else {
      return lvl1;
    }
  }

  static List lvl1 = [
    {"codeitem": "25834", "count": "2"},
    {"codeitem": "24669", "count": "1"},
    {"codeitem": "24668", "count": "1"},
    {"codeitem": "35592", "count": "2"},
  ];
  static List lvl2 = [
    {"codeitem": "25834", "count": "5"},
    {"codeitem": "24669", "count": "2"},
    {"codeitem": "24668", "count": "2"},
    {"codeitem": "35592", "count": "3"},
  ];
  static List lvl3 = [
    {"codeitem": "25834", "count": "7"},
    {"codeitem": "24669", "count": "3"},
    {"codeitem": "24668", "count": "3"},
    {"codeitem": "35592", "count": "5"},
    {"codeitem": "60517", "count": "1"},
  ];
  static List lvl4 = [
    {"codeitem": "25834", "count": "10"},
    {"codeitem": "24669", "count": "4"},
    {"codeitem": "24668", "count": "4"},
    {"codeitem": "60602", "count": "3"},
    {"codeitem": "60520", "count": "2"},
  ];
  static List lvl5 = [
    {"codeitem": "25834", "count": "12"},
    {"codeitem": "24669", "count": "5"},
    {"codeitem": "24668", "count": "5"},
    {"codeitem": "60599", "count": "4"},
    {"codeitem": "60521", "count": "3"},
  ];
}
