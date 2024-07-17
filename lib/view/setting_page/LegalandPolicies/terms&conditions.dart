import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';

import '../../../helpers/color_sheet.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.tranceparent,
        leadingWidth: 30,
        title: Text(
          'Terms & Conditions',
          style: GetTextTheme.fs16_regular,
        ),
        leading: IconButton(
            onPressed: () {
              Appservices.goback(context);
            },
            icon: Icon(
              Icons.keyboard_arrow_left_rounded,
              size: 30,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms & Conditions of Company Name',
                style: GetTextTheme.fs14_medium,
              ),
              Gap(5.h),
              Text(
                'Company Name operates the Website Name website, which provides the SERVICE. This page is used to inform website visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service, the Website Name website. If you choose to use our Service, then you agree to the collection and use of information in relation with this policy. The Personal Information that we collect are used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy. The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Website URL, unless otherwise defined in this Privacy Policy.',
                style: GetTextTheme.fs12_regular,
              ),
              Gap(5.h),
              Text(
                'Information Collection and Use',
                style: GetTextTheme.fs14_medium,
              ),
              Gap(5.h),
              Text(
                'For a better experience while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to your name, phone number, and postal address. The information that we collect will be used to contact or identify you.',
                style: GetTextTheme.fs12_regular,
              ),
              Gap(5.h),
              Text(
                'Information Collection and Use',
                style: GetTextTheme.fs14_medium,
              ),
              Gap(5.h),
              Text(
                'We want to inform you that whenever you visit our Service, we collect information that your browser sends to us that is called Log Data. This Log Data may include information such as your computer s Internet Protocol  address, browser version, pages of our Service that you visit, the time and date of your visit, the time spent on those pages, and other statistics',
                style: GetTextTheme.fs12_regular,
              ),
              Gap(5.h),
              Text(
                'Information Collection and Use',
                style: GetTextTheme.fs14_medium,
              ),
              Gap(5.h),
              Text(
                'Cookies are files with small amount of data that is commonly used an anonymous unique identifier. These are sent to your browser from the website that you visit and are stored on your computer s hard drive. Our website uses these “cookies” to collection information and to improve our Service. You have the option to either accept or refuse these cookies  and know when a cookie is being sent to your computer. If you choose to refuse our cookies, you may not be able to use some portions of our Service',
                style: GetTextTheme.fs12_regular,
              )
            ],
          ),
        ),
      ),
    );
  }
}
