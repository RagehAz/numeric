
import 'package:flutter/material.dart';
import 'package:numeric/src/text_checkers.dart';

import 'blog.dart';

class TextMod {
  // -----------------------------------------------------------------------------

  const TextMod();

  // -----------------------------------------------------------------------------
  /// TESTED : WORKS PERFECT
  static String removeTextBeforeLastSpecialCharacter(String verse, String specialCharacter) {
    String _result = verse;

    if (TextCheck.isEmpty(verse) == false){

      final bool _verseContainsChar = TextCheck.stringContainsSubString(
        string: verse,
        subString: specialCharacter,
      );

      if (_verseContainsChar == true) {
        final int _position = verse?.lastIndexOf(specialCharacter);
        _result = verse == null ? null
            :
        (_position != -1) ? verse.substring(_position + 1, verse.length)
            :
        verse;
      }

    }

    return _result;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static String removeNumberOfCharactersFromEndOfAString(String string, int numberOfCharacters) {

    // if (numberOfCharacters > string.length){
    //   blog('can not remove ($numberOfCharacters) from the given string because : numberOfCharacters > string.length');
    //   throw('can not remove ($numberOfCharacters) from the given string because');
    // } else {}
    // blog('string length ${string.trim().length} and : numberOfCharacters : $numberOfCharacters');

    if (string != null && string.trim().isNotEmpty) {

      if (string.trim().length == numberOfCharacters) {
        return '';
      }

      else if (string.trim().length > numberOfCharacters) {
        return string.substring(0, string.trim().length - numberOfCharacters);
      }

      else {
        return '';
      }

    }

    else {
      return null;
    }

  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static String removeNumberOfCharactersFromBeginningOfAString({
    @required String string,
    @required int numberOfCharacters,
  }) {
    String _stringTrimmed;
    if (numberOfCharacters > string.length) {
      blog('can not remove ($numberOfCharacters) from the given string because : numberOfCharacters > string.length');
      final Error _error = ArgumentError(
          'can not remove ($numberOfCharacters) from the given string because',
          'removeNumberOfCharactersFromBeginningOfAString');
      throw _error;
    }

    else {
      _stringTrimmed = string.isNotEmpty ? string?.substring(numberOfCharacters) : null;
    }

    return _stringTrimmed;
  }
  // --------------------
  /// TESTED : WORKS PERFECT
  static String removeTextBeforeFirstSpecialCharacter(String verse, String specialCharacter) {
    String _result = verse;

    if (TextCheck.isEmpty(verse) == false){

      final bool _verseContainsChar = TextCheck.stringContainsSubString(
        string: verse,
        subString: specialCharacter,
      );

      if (_verseContainsChar == true) {
        final int _position = verse?.indexOf(specialCharacter);
        _result = verse == null ?
        null
            :
        (_position != -1) ?
        verse.substring(_position + 1, verse.length)
            :
        verse;
      }

    }

    return _result;
  }
  // --------------------
}
