/*
* This class provides a mothod to encrypt the real [ID], this is the first
* protection layer for the [ID].
* This layer will be available to share with anyone.
*/

class IdLayerOne {
/*
* [concatIdLayerOneDigits] method takes the real [ID]
* and split it into digits, then encrypt it, after,
* it joins all digits into one value, which is [idLayerOne]
*/

  concatIdLayerOneDigits(String id) {
    // store 'id' in a list as separate characters
    List<String> idDigits = id.split('');

    // asign new values to list elements
    for (var element in idDigits) {
      switch (element.toLowerCase()) {
        case '0':
          idDigits[idDigits.indexOf(element)] = 'd7';
          break;
        case '1':
          idDigits[idDigits.indexOf(element)] = 'f5';
          break;
        case '2':
          idDigits[idDigits.indexOf(element)] = 'h7';
          break;
        case '3':
          idDigits[idDigits.indexOf(element)] = 'j5';
          break;
        case '4':
          idDigits[idDigits.indexOf(element)] = 'l6';
          break;
        case '5':
          idDigits[idDigits.indexOf(element)] = 'n4';
          break;
        case '6':
          idDigits[idDigits.indexOf(element)] = 'p6';
          break;
        case '7':
          idDigits[idDigits.indexOf(element)] = 'r4';
          break;
        case '8':
          idDigits[idDigits.indexOf(element)] = 't6';
          break;
        case '9':
          idDigits[idDigits.indexOf(element)] = 'v4';
          break;
        case '-':
          idDigits[idDigits.indexOf(element)] = '9a';
          break;
        case 'a':
          idDigits[idDigits.indexOf(element)] = 'ko';
          break;
        case 'b':
          idDigits[idDigits.indexOf(element)] = '4r';
          break;
        case 'c':
          idDigits[idDigits.indexOf(element)] = '9m';
          break;
        case 'd':
          idDigits[idDigits.indexOf(element)] = 'wa';
          break;
        case 'e':
          idDigits[idDigits.indexOf(element)] = 'h8';
          break;
        case 'f':
          idDigits[idDigits.indexOf(element)] = '6a';
          break;
        case 'g':
          idDigits[idDigits.indexOf(element)] = 'dq';
          break;
        case 'h':
          idDigits[idDigits.indexOf(element)] = 'sr';
          break;
        case 'i':
          idDigits[idDigits.indexOf(element)] = 'vu';
          break;
        case 'j':
          idDigits[idDigits.indexOf(element)] = 'l0';
          break;
        case 'k':
          idDigits[idDigits.indexOf(element)] = 'va';
          break;
        case 'l':
          idDigits[idDigits.indexOf(element)] = 'mz';
          break;
        case 'm':
          idDigits[idDigits.indexOf(element)] = 'sa';
          break;
        case 'n':
          idDigits[idDigits.indexOf(element)] = '6p';
          break;
        case 'o':
          idDigits[idDigits.indexOf(element)] = 'sb';
          break;
        case 'p':
          idDigits[idDigits.indexOf(element)] = 'um';
          break;
        case 'q':
          idDigits[idDigits.indexOf(element)] = 'iu';
          break;
        case 'r':
          idDigits[idDigits.indexOf(element)] = 'lb';
          break;
        case 's':
          idDigits[idDigits.indexOf(element)] = '7q';
          break;
        case 't':
          idDigits[idDigits.indexOf(element)] = 'h9';
          break;
        case 'u':
          idDigits[idDigits.indexOf(element)] = 'os';
          break;
        case 'v':
          idDigits[idDigits.indexOf(element)] = 'ys';
          break;
        case 'w':
          idDigits[idDigits.indexOf(element)] = 'ga';
          break;
        case 'x':
          idDigits[idDigits.indexOf(element)] = 'ea';
          break;
        case 'y':
          idDigits[idDigits.indexOf(element)] = '10';
          break;
        case 'z':
          idDigits[idDigits.indexOf(element)] = 'xe';
          break;
        default:
          idDigits[idDigits.indexOf(element)] = ' ';
          break;
      }
    }
    // join [ID] digits into one value
    String idLayerOne = idDigits.join();
    return idLayerOne;
  }
}
