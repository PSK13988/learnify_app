import 'package:flutter/material.dart';
import 'package:learnify_app/features/otp/providers/otp_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/assets_constants.dart';
import '../../../core/utils/common_utils.dart';
import '../../../views/widgets/app_widgets.dart';

class VerifyOtpView extends StatefulWidget {
  const VerifyOtpView({super.key});

  static const routeName = '/verify-otp';

  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  @override
  Widget build(BuildContext context) => createView(context);

  Widget createView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarText(title: AppConstants.verifyOtpTitle),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: Paddings.all_20,
            child: Column(
              children: [
                const SizedBox(height: 15),
                const Center(child: ImageViewer(imagePath: Assets.users)),
                const SizedBox(height: 25),
                const PhoneNumberView(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _textFieldOTP(first: true, last: false),
                    _textFieldOTP(first: false, last: false),
                    _textFieldOTP(first: false, last: false),
                    _textFieldOTP(first: false, last: true),
                  ],
                ),
                const SizedBox(height: 30),
                RoundedRedButton(
                  onPressed: _onPressed,
                  title: AppConstants.btnVerifyOtp,
                ),
                const SizedBox(height: 30),
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
  }

  void _onPressed() {
    showSnackBar(context, AppConstants.dataSubmitted);
  }

  Widget _textFieldOTP({required bool first, required bool last}) {
    return SizedBox(
      height: 65,
      width: 80,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          obscureText: true,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.black12),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.red),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}

class PhoneNumberView extends StatelessWidget {
  const PhoneNumberView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppConstants.otpSendTo, style: Styles.textStyle_1),
        const SizedBox(height: 5),
        Text(
          '${context.watch<OtpProvider>().countryCode} '
          '${context.watch<OtpProvider>().phoneNumber}',
          style: Styles.textStyle,
        ),
      ],
    );
  }
}
