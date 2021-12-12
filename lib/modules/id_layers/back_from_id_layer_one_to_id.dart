/*
* This class provides two mothods that works together to get the real [ID]
* from the [ID layer one], the returned [ID] will be reversed and used as the [IV] value
* in both [encryption] and [decryption] processes.
*/

class BackFromIdLayerOneToId {
  // get [ID layer one] digits in a list
  splitIDLayerOne(String idLayerOne) {
    List<String> idLayerOneDigits = idLayerOne.split('');

    String concat = '';
    List<String> idLayerDigits = [];

    for (int i = 2; i <= idLayerOneDigits.length + 1; i += 2) {
      concat = idLayerOneDigits[i - 2] + idLayerOneDigits[i - 1];
      idLayerDigits.add(concat);
      concat = '';
    }
    return idLayerDigits;
  }

  // turning [ID layer one] digits into the real [ID]
  String backFromIdLayerOneToId(List<String> idLayerDigits) {
    // store 'idLayerDigits' in a list as separate characters
    List<String> storeIdLayerDigits = idLayerDigits;

    // asign new values to list elements
    for (var element in storeIdLayerDigits) {
      switch (element.toLowerCase()) {
        case 'd7':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = '0';
          break;
        case 'f5':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = '1';
          break;
        case 'h7':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = '2';
          break;
        case 'j5':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = '3';
          break;
        case 'l6':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = '4';
          break;
        case 'n4':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = '5';
          break;
        case 'p6':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = '6';
          break;
        case 'r4':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = '7';
          break;
        case 't6':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = '8';
          break;
        case 'v4':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = '9';
          break;
        case '9a':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = '-';
          break;
        // start of alphabit
        case 'ko':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'a';
          break;
        case '4r':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'b';
          break;
        case '9m':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'c';
          break;
        case 'wa':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'd';
          break;
        case 'h8':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'e';
          break;
        case '6a':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'f';
          break;
        case 'dq':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'g';
          break;
        case 'sr':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'h';
          break;
        case 'vu':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'i';
          break;
        case 'l0':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'j';
          break;
        case 'va':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'k';
          break;
        case 'mz':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'l';
          break;
        case 'sa':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'm';
          break;
        case '6p':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'n';
          break;
        case 'sb':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'o';
          break;
        case 'um':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'p';
          break;
        case 'iu':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'q';
          break;
        case 'lb':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'r';
          break;
        case '7q':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 's';
          break;
        case 'h9':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 't';
          break;
        case 'os':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'u';
          break;
        case 'ys':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'v';
          break;
        case 'ga':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'w';
          break;
        case 'ea':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'x';
          break;
        case '10':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'y';
          break;
        case 'xe':
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = 'z';
          break;
        // end of alphabit
        default:
          storeIdLayerDigits[storeIdLayerDigits.indexOf(element)] = ' ';
          break;
      }
    }
    // join [ID] digits into one value.
    String id = storeIdLayerDigits.join();
    return id;
  }
}
