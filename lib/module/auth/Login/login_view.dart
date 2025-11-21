// packages
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/app_bar/app_bar_field.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
import 'package:wave_drive/core/shared/widgets/textfield/text_field.dart';
import 'package:wave_drive/module/auth/Login/otp_view.dart';
import 'package:wave_drive/module/auth/Login/otp_view2.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primarycolor,
      body: SafeArea(
        child: Column(
          children: [
            const Gap(20),
            AppBarField(
              text: 'Login',
              onpress: () {
                Navigator.pop(context);
              },
            ),
            const Gap(27),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whitecolor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    const Gap(30),
                    // Add the TabBar here
                    Column(
                      children: [
                        TabBar(
                          controller: tabController,
                          indicator: UnderlineTabIndicator(
                            borderSide: BorderSide(
                              width: 3,
                              color: AppColors.primarycolor,
                            ),
                          ),
                          labelColor: AppColors.primarycolor,
                          unselectedLabelColor: Colors.black,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          unselectedLabelStyle: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                          tabs: const [
                            Tab(text: 'Email'),
                            Tab(text: 'Phone Number'),
                          ],
                        ),
                        Container(height: 1, color: AppColors.inputboxcolor),
                      ],
                    ),

                    const Gap(24),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            // Email Tab
                            _buildEmailTab(),
                            // Phone Tab
                            _buildPhoneTab(context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldCustom(
          controller: TextEditingController(),
          hintText: 'Enter your email',
          maxLines: 1,
          prefixIcon: Icon(Icons.email, color: AppColors.blackcolor, size: 20),
        ),
        const Gap(24),
        TextFieldCustom(
          controller: TextEditingController(),
          hintText: 'password',
          obscureText: false,
          maxLines: 1,
          prefixIcon: Icon(Icons.lock, color: AppColors.blackcolor, size: 20),
        ),
        // forget pass
        _buildForgetPass(),
        const Gap(40),
        RoundedButton(
          title: 'Login',
          onpress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OtpView()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPhoneTab(BuildContext context) {
    return Column(
      children: [
        // AppBarField(
        //   text: 'Country Code',
        //   onpress: () {
        //     Navigator.pop(context);
        //   },
        // ),
        // phone number input
        Row(
          children: [
            // Country Code Picker
            GestureDetector(
              onTap: () {
                showCountryPicker(
                  context: context,
                  showPhoneCode: true,
                  useSafeArea: true,

                  countryListTheme: CountryListThemeData(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                    ),

                    inputDecoration: InputDecoration(
                      hintText: 'Start typing to search',
                      labelText: 'Search',
                    ),
                  ),
                  favorite: ['PK'],
                  onSelect: (Country value) {
                    // phoneController.setCountry(value);
                  },
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.26,
                height: 52,
                decoration: BoxDecoration(
                  color: AppColors.inputboxcolor,
                  border: Border.all(color: AppColors.inputboxcolor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('🇵🇰 92'),
                      // phoneController.selectedCountry.value == null
                      //     ? const Text('🇵🇰 92')
                      //     : Text(
                      //         '${phoneController.selectedCountry.value?.flagEmoji} ${phoneController.countryCode.value}',
                      //       ),
                      const Gap(8),
                      Icon(
                        Icons.expand_more,
                        color: AppColors.primarycolor,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 10), // Spacing between fields
            // Phone Number Field
            Container(
              width:
                  MediaQuery.of(context).size.width *
                  0.6, // 60% of screen width
              height: 52,
              decoration: BoxDecoration(
                color: AppColors.inputboxcolor,
                border: Border.all(color: AppColors.inputboxcolor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Mobile Number',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        Gap(24),
        TextFieldCustom(
          hintText: 'password',
          obscureText: false,
          maxLines: 1,
          prefixIcon: Icon(Icons.lock, color: AppColors.blackcolor, size: 20),
        ),
        // forget pass
        _buildForgetPass(),
        const Gap(40),
        RoundedButton(
          title: 'Login',
          onpress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OtpView()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildForgetPass() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: Text('Forget Password?', style: AppTextStyles.bodytext1),
        ),
      ],
    );
  }
}
