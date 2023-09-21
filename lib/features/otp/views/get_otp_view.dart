import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learnify_app/features/otp/providers/otp_provider.dart';
import 'package:learnify_app/features/otp/views/verify_otp_view.dart';
import 'package:learnify_app/views/widgets/app_widgets.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/assets_constants.dart';
import '../../../core/utils/common_utils.dart';

class GetOtpView extends StatelessWidget {
  const GetOtpView({super.key});

  static const routeName = '/';
  @override
  Widget build(BuildContext context) => createView(context);

  Widget createView(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppBarText(title: AppConstants.getOtpTitle),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: Paddings.all_20,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Center(
                    child: ImageViewer(imagePath: Assets.users),
                  ),
                  const SizedBox(height: 100),
                  const PhoneNumberField(),
                  const SizedBox(height: 40),
                  RoundedRedButton(
                    onPressed: () {
                      _onPressed(context);
                    },
                    title: AppConstants.btnGetOtp,
                  ),
                  const SizedBox(height: 40),
                  const Padding(
                    padding: Paddings.all_22,
                    child: TextViews(
                      title: AppConstants.termAndCondition,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  void _onPressed(BuildContext context) {
    if (context.read<OtpProvider>().validate()) {
      showSnackBar(context, AppConstants.phoneNumberRequired);
      return;
    }
    showSnackBar(context, AppConstants.otpMessage);
    Future.delayed(const Duration(milliseconds: 4500), () {
      Navigator.pushNamed(context, VerifyOtpView.routeName);
    });
  }
}

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({super.key});

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  final List<String> _items = ['+91', '+42', '+666', '+17', '+228'];
  final _phoneNumberController = TextEditingController();
  late String _value;

  @override
  void initState() {
    super.initState();
    _value = _items.first;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final otpController = context.read<OtpProvider>();
      otpController.setCountryCode(_value);
      otpController.setPhoneNumber(_phoneNumberController.text);
    });
  }

  @override
  Widget build(BuildContext context) => Container(
        height: const Size.fromHeight(60).height,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade700),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: <Widget>[
            DropdownButtonHideUnderline(
              child: Container(
                padding: const EdgeInsets.fromLTRB(32, 8, 16, 8),
                child: DropdownButton<String>(
                  value: _value,
                  items: _items.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: Styles.appPhoneNumberHint,
                      ),
                    );
                  }).toList(),
                  onChanged: _onDropDownChanged,
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: _phoneNumberController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                ],
                maxLines: 1,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintStyle: Styles.appPhoneNumberHint,
                  hintText: 'Phone Number',
                  contentPadding: Paddings.from_0_16_8_16,
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  context.read<OtpProvider>().setPhoneNumber(value);
                },
              ),
            ),
          ],
        ),
      );
  void _onDropDownChanged(String? value) {
    if (value != null) {
      context.read<OtpProvider>().setCountryCode(value);
    }
  }
}
