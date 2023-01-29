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
}
