/*
* This class provides two mothods to encrypt the [ID layer one], this is the second
* protection layer for the [ID]. the returned [ID layer two] will be used as
* the [Key] value in both [encryption] and [decryption] processes.
* This layer will not be available to share with anyone.
*/

class IdLayerTwo {
/*
* [splitIDLayerOne] method takes the [ID layer one]
* and split it into digits, and return it in a list 
*/

  splitIDLayerOne(String idLayerOne) {
    List<String> idLayerOneDigits = idLayerOne.split('');

    String concat = '';
    List<String> idLayerTwoDigits = [];

    for (int i = 2; i <= idLayerOneDigits.length + 1; i += 2) {
      concat = idLayerOneDigits[i - 2] + idLayerOneDigits[i - 1];
      idLayerTwoDigits.add(concat);
      concat = '';
    }
    return idLayerTwoDigits;
  }

/*
* [concatIdLayerTwoDigits] method takes the [idLayerOne] digits in a list
* then encrypt it, after, it joins all digits into one value, which is [idLayerTwo]
*/

  concatIdLayerTwoDigits(List<String> idLayerTwoDigits) {
    // store 'id' in a list as separate characters
    List<String> storeIdLayerTwoDigits = idLayerTwoDigits;

    // asign new values to list elements
    for (var element in storeIdLayerTwoDigits) {
      switch (element.toLowerCase()) {
        case 'd7':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '!;';
          break;
        case 'f5':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '"P';
          break;
        case 'h7':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '#=';
          break;
        case 'j5':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = 'w>';
          break;
        case 'l6':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '%R';
          break;
        case 'n4':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '&K';
          break;
        case 'p6':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = 'c[';
          break;
        case 'r4':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '9\\';
          break;
        case 't6':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = 'e]';
          break;
        case 'v4':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '^7';
          break;
        case '9a':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = 'T_';
          break;
        // start of alphabit
        case 'ko':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = ',`';
          break;
        case '4r':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = 'j{';
          break;
        case '9m':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = 'i|';
          break;
        case 'wa':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = 'D}';
          break;
        case 'h8':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = ':3';
          break;
        case '6a':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = 'C!';
          break;
        case 'dq':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '<"';
          break;
        case 'sr':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '=g';
          break;
        case 'vu':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '>\$';
          break;
        case 'l0':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '5%';
          break;
        case 'va':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = 'q&';
          break;
        case 'mz':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '[O';
          break;
        case 'sa':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '\\(';
          break;
        case '6p':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = ']M';
          break;
        case 'sb':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '^6';
          break;
        case 'um':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '_+';
          break;
        case 'iu':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = 'h,';
          break;
        case 'lb':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '{-';
          break;
        case '7q':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '|4';
          break;
        case 'h9':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '}/';
          break;
        case 'os':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '~A';
          break;
        case 'ys':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '|1';
          break;
        case 'ga':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '2?';
          break;
        case 'ea':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '7\$';
          break;
        case '10':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '&8';
          break;
        case 'xe':
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '0:';
          break;
        // end of alphabit
        default:
          storeIdLayerTwoDigits[storeIdLayerTwoDigits.indexOf(element)] = '<>';
          break;
      }
    }
    // join new values into one value
    String idLayerTwo = storeIdLayerTwoDigits.join();
    return idLayerTwo;
  }
}
