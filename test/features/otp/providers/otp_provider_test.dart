import 'package:learnify_app/features/otp/providers/otp_provider.dart';
import 'package:test/test.dart';

void main() {
  late OtpProvider provider;

  const countryCode = '+91';
  const phoneNumber = '9988776655';

  setUp(() {
    provider = OtpProvider();
  });

  test('should create [OtpProvider]', () {
    expect(provider, isA<OtpProvider>());
  });

  test(
      'should create [OtpProvider] validate countryCode and  phoneNumber not null',
      () {
    provider.setCountryCode(countryCode);
    provider.setPhoneNumber(phoneNumber);
    expect(provider.countryCode, equals(countryCode));
    expect(provider.phoneNumber, equals(phoneNumber));
    expect(provider.validate(), false);

    provider.setCountryCode('');
    provider.setPhoneNumber('');
    expect(provider.countryCode, equals(''));
    expect(provider.phoneNumber, equals(''));
    expect(provider.validate(), true);
  });
}
