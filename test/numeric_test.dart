import 'package:flutter_test/flutter_test.dart';
import 'package:numeric/numeric.dart';

// write a flutter test group that includes several tests for following function

void main(){
  // -----------------------------------------------------------------------------

  /// checkStringsContainString

  // --------------------
  group('formatNumToSeparatedKilos() tests', () {

    test('returns the correct string for int values less than 1000', () {
      expect(Numeric.formatNumToSeparatedKilos(number: 999), equals('999'));
      expect(Numeric.formatNumToSeparatedKilos(number: 123), equals('123'));
    });

    test('returns the correct string for int values greater than 1000', () {
      expect(Numeric.formatNumToSeparatedKilos(number: 123456), equals("123'456"));
      expect(Numeric.formatNumToSeparatedKilos(number: 123456789), equals("123'456'789"));
    });

    test('returns the correct string for double values with 2 decimal places', () {
      expect(Numeric.formatNumToSeparatedKilos(number: 123456.78), equals("123'456.78"));
      expect(Numeric.formatNumToSeparatedKilos(number: 123456.789), equals("123'456.79"));
    });

    test('returns the correct string for negative values', () {
      expect(Numeric.formatNumToSeparatedKilos(number: -123456), equals("-123'456"));
      expect(Numeric.formatNumToSeparatedKilos(number: -123456.78), equals("-123'456.78"));
    });

    test('returns the correct string when separator is set to a custom value', () {
      expect(Numeric.formatNumToSeparatedKilos(number: 123456, separator: ':'), equals('123:456'));
      expect(Numeric.formatNumToSeparatedKilos(number: 123456.78, separator: ':'),
          equals('123:456.78'));
    });

    test('returns the correct string for double values with 4 decimal places', () {
      expect(Numeric.formatNumToSeparatedKilos(number: 123456.789, fractions: 4), equals("123'456.789"));
    });

    test('returns the correct string for double values with 0 decimal places', () {
      expect(
          Numeric.formatNumToSeparatedKilos(number: 123456.789, fractions: 0), equals("123'457"));
    });

    test('returns the correct string for negative double values with 2 decimal places', () {
      expect(Numeric.formatNumToSeparatedKilos(number: -123456.789), equals("-123'456.79"));
    });

    test('returns the correct string for positive int values', () {
      expect(Numeric.formatNumToSeparatedKilos(number: 123456), equals("123'456"));
    });

    test('returns the correct string for negative int values', () {
      expect(Numeric.formatNumToSeparatedKilos(number: -123456), equals("-123'456"));
    });

    test('returns the correct string for values close to 0', () {
      expect(Numeric.formatNumToSeparatedKilos(number: 0), equals('0'));
      expect(Numeric.formatNumToSeparatedKilos(number: 0.0001), equals('0'));
      expect(Numeric.formatNumToSeparatedKilos(number: -0.0001), equals('0'));
    });

    test('returns the correct string for values close to 1000', () {
      expect(Numeric.formatNumToSeparatedKilos(number: 1000), equals("1'000"));
      expect(Numeric.formatNumToSeparatedKilos(number: 999.9999), equals("1'000"));
      expect(Numeric.formatNumToSeparatedKilos(number: -999.9999), equals("-1'000"));
    });

  });
  // -----------------------------------------------------------------------------

  /// formatNumToCounterCaliber

  // --------------------
  group('formatNumToCounterCaliber', () {

    test('0 returns 0', () {
      final result = Numeric.formatNumToCounterCaliber(x: 0);
      expect(result, equals('0'));
    });

    test('999 returns 999', () {
      final result = Numeric.formatNumToCounterCaliber(x: 999);
      expect(result, equals('999'));
    });

    test('1000 returns 1 thousand', () {
      final result = Numeric.formatNumToCounterCaliber(x: 1000);
      expect(result, equals('1 thousand'));
    });

    test('1001 returns 1 thousand', () {
      final result = Numeric.formatNumToCounterCaliber(x: 1001);
      expect(result, equals('1 thousand'));
    });

    test('1999 returns 2 thousand', () {
      final result = Numeric.formatNumToCounterCaliber(x: 1999);
      expect(result, equals('2 thousand'));
    });

    test('99999 returns 100 thousand', () {
      final result = Numeric.formatNumToCounterCaliber(x: 99999);
      expect(result, equals('100 thousand'));
    });

    test('100000 returns 100 thousand', () {
      final result = Numeric.formatNumToCounterCaliber(x: 100000);
      expect(result, equals('100 thousand'));
    });

    test('1000000 returns 1 million', () {
      final result = Numeric.formatNumToCounterCaliber(x: 1000000);
      expect(result, equals('1 million'));
    });

    test('10000000 returns 10 million', () {
      final result = Numeric.formatNumToCounterCaliber(x: 10000000);
      expect(result, equals('10 million'));
    });

    test('custom thousands and millions returns custom values', () {
      final result = Numeric.formatNumToCounterCaliber(x: 1000, thousand: 'k', million: 'm');
      expect(result, equals('1 k'));

      final result2 = Numeric.formatNumToCounterCaliber(x: 1000000, thousand: 'k', million: 'm');
      expect(result2, equals('1 m'));
    });

  });
  // -----------------------------------------------------------------------------

  /// formatNumToCounterCaliber

  // --------------------
  group('Numeric.formatNumberWithinDigits tests', () {

    test('Case 1: Format 0 within 4 digits', () {
      const int num = 0;
      const int digits = 4;
      const String expectedResult = '0000';

      final String result = Numeric.formatNumberWithinDigits(num: num, digits: digits);

      expect(result, expectedResult);
    });

    test('Case 2: Format 100 within 4 digits', () {
      const int num = 100;
      const int digits = 4;
      const String expectedResult = '0100';

      final String result = Numeric.formatNumberWithinDigits(num: num, digits: digits);

      expect(result, expectedResult);
    });

    test('Case 3: Format 10 within 4 digits', () {
      const int num = 10;
      const int digits = 4;
      const String expectedResult = '0010';

      final String result = Numeric.formatNumberWithinDigits(num: num, digits: digits);

      expect(result, expectedResult);
    });

    test('Case 4: Format 9999 within 4 digits', () {
      const int num = 9999;
      const int digits = 4;
      const String expectedResult = '9999';

      final String result = Numeric.formatNumberWithinDigits(num: num, digits: digits);

      expect(result, expectedResult);
    });

    test('Case 5: Format 10000 within 4 digits', () {
      const int num = 10000;
      const int digits = 4;
      const String expectedResult = 'XXXX';

      final String result = Numeric.formatNumberWithinDigits(num: num, digits: digits);

      expect(result, expectedResult);
    });
  });
  // -----------------------------------------------------------------------------

  /// concludeNumberOfDigits

  // --------------------
  group('concludeNumberOfDigits', () {
    test('returns 0 for negative or null input', () {
      expect(Numeric.concludeNumberOfDigits(-5), 1);
      expect(Numeric.concludeNumberOfDigits(null), 0);
    });

    test('returns 1 for input 1', () {
      expect(Numeric.concludeNumberOfDigits(1), 1);
    });

    test('returns 1 for input 10', () {
      expect(Numeric.concludeNumberOfDigits(10), 2);
    });

    test('returns 2 for input 100', () {
      expect(Numeric.concludeNumberOfDigits(100), 3);
    });

    test('returns the number of digits minus 1', () {
      expect(Numeric.concludeNumberOfDigits(12345), 5);
    });
  });
  // -----------------------------------------------------------------------------

  /// formatIndexDigits

  // --------------------
  group('Numeric.formatIndexDigits', () {
    test('returns correct format for index 0 with list length 1', () {
      expect(Numeric.formatIndexDigits(index: 0, listLength: 1), '0');
    });

    test('returns correct format for index 0 with list length 10', () {
      expect(Numeric.formatIndexDigits(index: 0, listLength: 10), '00');
    });

    test('returns correct format for index 1 with list length 10', () {
      expect(Numeric.formatIndexDigits(index: 1, listLength: 10), '01');
    });

    test('returns correct format for index 11 with list length 100', () {
      expect(Numeric.formatIndexDigits(index: 11, listLength: 100), '011');
    });

    test('returns correct format for index 100 with list length 1000', () {
      expect(Numeric.formatIndexDigits(index: 100, listLength: 1000), '0100');
    });
  });
  // -----------------------------------------------------------------------------

  /// formatIndexDigits

  // --------------------
  group('transformStringToInt', () {
    test('returns null for null input', () {
      expect(Numeric.transformStringToInt(null), null);
    });

    test('returns null for non-integer string input', () {
      expect(Numeric.transformStringToInt('abc'), null);
    });

    test('returns integer value for integer string input', () {
      expect(Numeric.transformStringToInt('123'), 123);
    });

    test('returns integer value for negative integer string input', () {
      expect(Numeric.transformStringToInt('-123'), -123);
    });

    test('returns integer value for negative integer string input', () {
      expect(Numeric.transformStringToInt('-123.25'), -123);
    });

    test('returns integer value for negative integer string input', () {
      expect(Numeric.transformStringToInt('0.0'), 0);
    });

    test('returns integer value for negative integer string input', () {
      expect(Numeric.transformStringToInt('0'), 0);
    });

    test('returns integer value for negative integer string input', () {
      expect(Numeric.transformStringToInt('0.1'), 0);
    });

    test('returns integer value for negative integer string input', () {
      expect(Numeric.transformStringToInt('0.9'), 0);
    });

    test('returns integer value for negative integer string input', () {
      expect(Numeric.transformStringToInt('10.99'), 10);
    });
  });
  // -----------------------------------------------------------------------------

  /// transformStringToDouble

  // --------------------
  group('transformStringToDouble', () {

    test('returns a double when string is valid', () {
      const double expectedValue = 10.5;
      const String string = '10.5';

      final double result = Numeric.transformStringToDouble(string);

      expect(result, expectedValue);
    });

    test('returns null when string is null', () {
      const String string = null;

      final double result = Numeric.transformStringToDouble(string);

      expect(result, null);
    });

    test('returns null when string is an empty string', () {
      const String string = '';

      final double result = Numeric.transformStringToDouble(string);

      expect(result, null);
    });

    test('returns null when string is not a valid double', () {
      const String string = 'not a valid double';

      final double result = Numeric.transformStringToDouble(string);

      expect(result, null);
    });

    test('a', () {
      const String string = '-125.25';

      final double result = Numeric.transformStringToDouble(string);

      expect(result, -125.25);
    });

    test('b', () {
      const String string = '-0.0';

      final double result = Numeric.transformStringToDouble(string);

      expect(result, 0);
    });

  });
  // -----------------------------------------------------------------------------

  /// createRandomIndex

  // --------------------
  group('createRandomIndex', () {

    test('returns a random index within the default list length of 1001', () {
      final int result = Numeric.createRandomIndex();

      expect(result, lessThan(1001));
    });

    test('returns a random index within the specified list length', () {
      const int listLength = 10;
      final int result = Numeric.createRandomIndex(listLength: listLength);

      expect(result, lessThan(listLength));
    });

  });
  // -----------------------------------------------------------------------------

  /// createUniqueIndex

  // --------------------
  group('createUniqueIndex', () {

    test('returns a unique index within the max index of 999999', () {
      final List<int> existingIndexes = [];
      final int result = Numeric.createUniqueIndex(existingIndexes: existingIndexes);

      expect(result, lessThan(1000000));
      expect(existingIndexes.contains(result), isFalse);
    });

    test('returns a unique index within the specified max index', () {
      final List<int> existingIndexes = [];
      const int maxIndex = 10;
      final int result =
          Numeric.createUniqueIndex(existingIndexes: existingIndexes, maxIndex: maxIndex);

      expect(result, lessThan(maxIndex + 1));
      expect(existingIndexes.contains(result), isFalse);
    });

    test('returns a unique index when all possible indexes have been used', () {
      final List<int> existingIndexes = [0, 1, 2, 3, 4];
      const int maxIndex = 5;

      final int result = Numeric.createUniqueIndex(
          existingIndexes: existingIndexes,
          maxIndex: maxIndex,
      );

      expect(result, 5);
      expect(existingIndexes.contains(result), isFalse);
    });

  });
  // -----------------------------------------------------------------------------

  /// createUniqueID

  // --------------------
  group('createUniqueID', () {

    test('returns a unique ID with the default max digits count of 16', () {
      final int result = Numeric.createUniqueID();

      expect(result, greaterThan(0));
      expect(result.toString().length, lessThanOrEqualTo(16));
    });

    test('returns a unique ID with the specified max digits count', () {
      const int maxDigitsCount = 10;
      final int result = Numeric.createUniqueID(maxDigitsCount: maxDigitsCount);

      expect(result, greaterThan(0));
      expect(result.toString().length, lessThanOrEqualTo(maxDigitsCount));
    });

  });
  // -----------------------------------------------------------------------------

  /// createUniqueKeyFrom

  // --------------------
  /*
  group('createUniqueKeyFrom', () {

    test('returns a unique ValueKey with int value not in existing keys', () {
      final List<ValueKey<int>> existingKeys = [const ValueKey(1), const ValueKey(2)];
      final ValueKey<int> result = Numeric.createUniqueKeyFrom(existingKeys: existingKeys);

      expect(existingKeys, isNot(contains(result)));
    });

    test('returns a unique ValueKey with int value not in existing keys', () {
      final List<ValueKey<int>> existingKeys = [const ValueKey(1), const ValueKey(2)];
      final ValueKey<int> result = Numeric.createUniqueKeyFrom(existingKeys: existingKeys);

      expect(existingKeys, isNot(contains(result)));
    });

    test('returns a unique ValueKey even if all existing keys have been used', () {
      /// NOTE : IT THROWS STACK OVER FLOW WHEN LENGTH > 100000
      const int length = 99999;
      final List<ValueKey<int>> existingKeys = [for (int i = 0; i < length; i++) ValueKey(i)];
      final ValueKey<int> result = Numeric.createUniqueKeyFrom(
        existingKeys: existingKeys,
      );

      expect(result, null);
    });

    test('returns a unique ValueKey even if all existing keys have been used', () {
      /// NOTE : IT THROWS STACK OVER FLOW WHEN LENGTH > 100000
      const int length = 1000000;
      final List<ValueKey<int>> existingKeys = [for (int i = 0; i < length; i++) ValueKey(i)];
      final ValueKey<int> result = Numeric.createUniqueKeyFrom(
        existingKeys: existingKeys,
      );

      expect(result, throwsAssertionError);
    });

    test('throws an exception if existing keys list is empty', () {
      final List<ValueKey<int>> existingKeys = [];
      final ValueKey<int> result = Numeric.createUniqueKeyFrom(existingKeys: existingKeys);

      expect(result, isNot(contains(result)));
    });

  });

   */
  // -----------------------------------------------------------------------------

  /// createListWithDummyValue

  // --------------------
  /*
  group("createListWithDummyValue", () {
    test("returns list with given length", () {
      final list = Numeric.createListWithDummyValue(length: 5, value: 0);
      expect(list.length, 5);
    });

    test("returns list filled with given value", () {
      final list = Numeric.createListWithDummyValue(length: 5, value: 0);
      for (int i = 0; i < 5; i++) {
        expect(list[i], 0);
      }
    });

    // test("throws error when length argument is missing", () {
    //   expect(() => Numeric.createListWithDummyValue(value: 0), throwsAssertionError);
    // });
    //
    // test("throws error when value argument is missing", () {
    //   expect(() => Numeric.createListWithDummyValue(length: 5), throwsAssertionError);
    // });
  });
   */
  // -----------------------------------------------------------------------------

  /// createRandomIndexes

  // --------------------
  group('createRandomIndexes', () {

    test('returns list with given numberOfIndexes', () {
      final list = Numeric.createRandomIndexes(numberOfIndexes: 5, maxIndex: 10);
      expect(list.length, 5);
    });

    test('returns list filled with unique indexes', () {
      final list = Numeric.createRandomIndexes(numberOfIndexes: 5, maxIndex: 10);
      expect(Set<int>.from(list).length, 5);
    });

    // test('returns list filled with indexes in range [0, maxIndex)', () {
    //   final list = Numeric.createRandomIndexes(numberOfIndexes: 5, maxIndex: 10);
    //   for (int i = 0; i < 5; i++) {
    //     expect(list[i], inExclusiveRange(0, 10));
    //   }
    // });

  });
  // -----------------------------------------------------------------------------

  /// cipherBool

  // --------------------
  group('cipherBool', () {

    test('returns 1 for true', () {
      final result = Numeric.cipherBool(bool: true);
      expect(result, 1);
    });

    test('returns 0 for false', () {
      final result = Numeric.cipherBool(bool: false);
      expect(result, 0);
    });

    test('returns 0 for any other value', () {
      final result = Numeric.cipherBool(bool: null);
      expect(result, 0);
    });

  });
  // -----------------------------------------------------------------------------

  /// decipherBool

  // --------------------
  group('decipherBool', () {

    test('returns true for 1', () {
      final result = Numeric.decipherBool(1);
      expect(result, true);
    });

    test('returns false for 0', () {
      final result = Numeric.decipherBool(0);
      expect(result, false);
    });

    test('returns false for any other value', () {
      final result = Numeric.decipherBool(2);
      expect(result, false);
    });

  });
  // -----------------------------------------------------------------------------
}
