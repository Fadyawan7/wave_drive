import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

class TermsCheckbox extends StatelessWidget {
  // final TermsController controller = Get.put(TermsController());

  TermsCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey.shade400, width: 2),
                  color: AppColors.primarycolor
                  // controller.isAccepted.value
                  //     ? AppColors.primarycolor
                  //     : Colors.transparent,
                ),
                child: Icon(Icons.check, size: 16, color: Colors.white)
                // controller.isAccepted.value
                //     ? Icon(Icons.check, size: 16, color: Colors.white)
                //     : null,
              ),
              SizedBox(width: 15),
              Expanded(
                child: Text(
                  "By registering, you agree to our Terms of Service and Privacy policy, commit to comply with obligations under the European Union and local legislation and provide only legal services and content on the Bolt Platform",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ],
          ),
        );
  }
}
