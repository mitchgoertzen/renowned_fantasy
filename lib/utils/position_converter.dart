class PositionConverter {
  static String positionIntToString(int i) {
    String s = '';

    switch (i) {
      case -1: s = 'x';
        break;
      case 0: s = 'RP';
        break;
      case 1:
        s = 'SP';
        break;
      case 2:
        s = 'C';
        break;
      case 3:
        s = '1B';
        break;
      case 4:
        s = '2B';
        break;
      case 5:
        s = '3B';
        break;
      case 6:
        s = 'SS';
        break;
      case 7:
      case 8: 
      case 9:
        s = 'OF';
        break;
    }
    return s;
  }

  static int positionStringToInt(String s) {
    int i = 10;

    switch (s) {
      case 'RP': i = 0;
        break;
      case 'SP': i = 1;
        break;
      case 'C': i = 2;
        break;
      case '1B': i = 3;
        break;
      case '2B': i = 4;
        break;
      case '3B': i = 5;
        break;
      case 'SS': i = 6;
        break;
      case 'OF': i = 7;
        break;
    }

    return i;
  }
}
