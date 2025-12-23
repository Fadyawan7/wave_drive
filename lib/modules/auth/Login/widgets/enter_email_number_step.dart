part of '../login_screen.dart';

class EnterEmailPhoneStep extends StatefulWidget {
  const EnterEmailPhoneStep({super.key});

  @override
  State<EnterEmailPhoneStep> createState() => _EnterEmailPhoneStepState();
}

class _EnterEmailPhoneStepState extends BaseScreen<EnterEmailPhoneStep>
    with FormMixin, TickerProviderStateMixin {
  late TabController tabController;
  bool _isHide = true;
  int _selectedTabIndex = 0;

  SigninCubit get _cubit => context.read<SigninCubit>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {
        setState(() {
          _selectedTabIndex = tabController.index;
        });
      }
    });
  }

  void toogleVisiblity() => setState(() {
    _isHide = !_isHide;
  });

  @override
  Widget buildBody(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          const Gap(24),

          // Custom Selection TabBar
          CustomSelectionTabBar(
            tabs: const ['Phone number', 'Email or username'],
            selectedIndex: _selectedTabIndex,
            onTabChanged: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
              tabController.animateTo(index);
            },
          ),

          const Gap(36),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                // Phone Tab
                _buildPhoneTab(context),

                // Email Tab
                _buildEmailTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailTab() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "We’ll use it to verify your account and send updates about nearby ride requests.",
            style: AppTextStyles.text14.copyWith(
              fontWeight: FontWeight.w300,
              color: AppColors.grayA9,
            ),
          ),
          const Gap(18),
          FormBuilderFillTextField(
            autofocus: true,
            name: 'email',
            hintText: "Email address or username",
            validator: emailValidators,
          ),

          const Gap(54),
          PrimaryButton(text: "Login", onPressed: _onSubmitEmailLogin),
        ],
      ),
    );
  }

  Widget _buildPhoneTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 30),
      child: Column(
        children: [
          Text(
            "We’ll use it to verify your account and send updates about nearby ride requests.",
            style: AppTextStyles.text14.copyWith(
              fontWeight: FontWeight.w300,
              color: AppColors.grayA9,
            ),
          ),
          const Gap(18),
          FormBuilderPhoneField(
            height: 58,
            label: "Phone number",
            name: 'phone',
            validator: requiredValidators,
          ),

          // FormBuilderFillTextField(
          //   name: 'passwordPhone',
          //   hintText: "Password",
          //   validator: requiredValidators,
          //   obscureText: _isHide,
          //   suffixIcon: IconButton(
          //     onPressed: toogleVisiblity,
          //     icon: Icon(_isHide ? Icons.visibility : Icons.visibility_off),
          //   ),

          //   prefixIcon: Icon(Icons.lock, color: AppColors.blackcolor),
          // ),
          // Gap(12),
          // // forget pass
          // _buildForgetPass(),
          const Gap(54),
          PrimaryButton(text: "Continue", onPressed: _onSubmitPhomeLogin),
        ],
      ),
    );
  }

  Widget _buildForgetPass() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Forget Password?',
        style: AppTextStyles.text16.copyWith(color: AppColors.black),
      ),
    ).centerRight;
  }

  Future<void> _onSubmitEmailLogin() async {
    FocusScope.of(context).unfocus();
    final isFormValid = formKey.currentState!.saveAndValidate();
    if (!isFormValid) return;
    final formFields = formKey.currentState!.value;
    final email = formFields["email"] as String;

    loading(true);

    final result = await _cubit.sendEmailOtp(email);

    loading(false);
    if (!result.isSuccess) {
      toastError(result.errorText ?? "Internal Server Error");
      return;
    }

    if (mounted) {
      _cubit.changeStep(SigninStep.verify);
    }
  }

  Future<void> _onSubmitPhomeLogin() async {
    FocusScope.of(context).unfocus();
    final isFormValid = formKey.currentState!.saveAndValidate();
    if (!isFormValid) return;
    final formFields = formKey.currentState!.value;
    final phone = formFields["phone"] as String;

    loading(true);
    final result = await _cubit.sendOtpNumber(phone);

    loading(false);
    if (!result.$1) {
      toastError(result.$2 ?? "Otp Send Failed");

      return;
    }

    if (mounted) {
      _cubit.changeStep(SigninStep.verify);
    }
  }
}
