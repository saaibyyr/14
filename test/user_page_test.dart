import 'package:flutter_firebase/presentation/pages/user_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserProfile Tests', () {
    test('Should update the full name', () {
      final profile =
          UserProfile(fullName: 'Сайбыр Айерке', phoneNumber: '88888888888');
      profile.updateFullName('Айерке Сайбыр');
      expect(profile.fullName, 'Айерке Сайбыр');
    });

    test('Should update the phone number', () {
      final profile =
          UserProfile(fullName: 'Сайбыр Айерке', phoneNumber: '88888888888');
      profile.updatePhoneNumber('87777777777');
      expect(profile.phoneNumber, '87777777777');
    });
  });
}
