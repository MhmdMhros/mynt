// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/presentation/pages/email%20verification/email_verfication.dart';
import 'package:mynt/presentation/pages/layout/cubit/layout_cubit.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController nameController;
  late TextEditingController genderController;
  int selectedGender = 0;
  IconData selectedIcon = Icons.person;

  @override
  void initState() {
    super.initState();
    emailController =
        TextEditingController(text: LayoutCubit.get(context).user?.email ?? '');
    phoneController =
        TextEditingController(text: LayoutCubit.get(context).user?.phone ?? '');
    nameController =
        TextEditingController(text: LayoutCubit.get(context).user?.name ?? '');
    genderController = TextEditingController(
      text: LayoutCubit.get(context).user?.gender == 1
          ? 'Male'
          : LayoutCubit.get(context).user?.gender == 2
              ? 'Female'
              : 'Nothing',
    );
    selectedGender = LayoutCubit.get(context).user?.gender == 1
        ? 1
        : LayoutCubit.get(context).user?.gender == 2
            ? 2
            : 0;
    selectedIcon = LayoutCubit.get(context).user?.gender == 1
        ? Icons.male
        : LayoutCubit.get(context).user?.gender == 2
            ? Icons.female
            : Icons.person;
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    nameController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(builder: (context, state) {
      var cubit = LayoutCubit.get(context);
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: AppColors.text1),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          title: Text(
            "My Profile",
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              color: AppColors.text1,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // // Circular User Image with Camera Icon
                // Stack(
                //   children: [
                //     ClipOval(
                //       child: CachedNetworkImage(
                //         imageUrl:
                //             "https://s3-alpha-sig.figma.com/img/5f8b/1e3c/e7b3657f2652263b0ef7a745a66e0f2a?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=G7iTfjPpl79oCwQ~4SV4vXG8Nm7RWpAwsaWYNrMIoHdcbWFit3azy-zf2l8588OyZFXvWnwRBKZtBgh3tnt9GHAT~Qzp0Wgsbd3DKeQv0Ntn1bLaWTQv~1EEWG94i8F3v1ra9huJw2~UVtTBJIr7BLBIDU1Zt5sfosNI7ggpgD0uM5ZYYFSV8ehLgSUj-r9K5ouq7T8dLQn16LqJK4txA3yYDBqSKoM6cojXC~BBDsP1tagVTDGK~OH~TLHMvNpu22g1YN89YS3xp5-VshSrYBfa~Q7C7mVF5Oy7yij~MZqadYUsMxwZ1dFvXhCU5NXpjlkywe5JDOLeI2ob2Nc5CQ__", // Replace with actual URL
                //         placeholder: (context, url) =>
                //             const CircularProgressIndicator(
                //                 color: AppColors.text1),
                //         errorWidget: (context, url, error) => Icon(
                //             Icons.person,
                //             size: 60.r,
                //             color: AppColors.text1),
                //         width: 120.r,
                //         height: 120.r,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //     // Camera Icon for Changing Profile Picture
                //     Positioned(
                //       bottom: 0,
                //       right: 0,
                //       child: GestureDetector(
                //         onTap: () {},
                //         child: Container(
                //           padding: EdgeInsets.all(6.r),
                //           decoration: const BoxDecoration(
                //             color: AppColors.primary,
                //             shape: BoxShape.circle,
                //             boxShadow: [
                //               BoxShadow(
                //                 color: Colors.black26,
                //                 blurRadius: 4,
                //                 spreadRadius: 2,
                //               ),
                //             ],
                //           ),
                //           child: Icon(
                //             Icons.camera_alt,
                //             size: 20.r,
                //             color: Colors.white,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 20.h), // Space between image and text fields
                // Profile Information Widgets
                _buildInfoWidget("Name", Icons.person, "name"),
                _buildInfoWidget(
                  "Gender",
                  cubit.user!.gender == 1 ? Icons.male : Icons.female,
                  "data",
                ),
                _buildInfoWidget("Email", Icons.email, "email"),
                _buildInfoWidget("Phone Number", Icons.phone, "phone"),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildInfoWidget(
    String label,
    IconData icon,
    String type,
  ) {
    String buttonText = '';
    VoidCallback onPressed = () {};

    if (type == 'email') {
      buttonText = 'Edit Email';
      onPressed = () async {
        final success =
            await LayoutCubit.get(context).sendOtp(emailController.text);
        if (success) {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EmailVerification(
                  emailController.text, '', '', '', '', 'edit_email'),
            ),
          );

          if (result != null) {
            LayoutCubit.get(context).editData();
          }
        }
      };
    } else if (type == 'phone') {
      buttonText = 'Edit Phone';
      onPressed = () async {
        final success =
            await LayoutCubit.get(context).sendOtp(emailController.text);
        if (success) {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => EmailVerification(emailController.text,
                  phoneController.text, '', '', '', 'edit_phone'),
            ),
          );

          if (result != null) {
            LayoutCubit.get(context).editData();
          }
        }
      };
    } else if (type == 'data') {
      return Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                color: AppColors.text1,
              ),
            ),
            SizedBox(height: 8.h),
            DropdownButtonFormField<int>(
              value: selectedGender,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  selectedIcon,
                  color: AppColors.text1,
                  size: 20.sp,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
              ),
              items: const [
                DropdownMenuItem(value: 0, child: Text('Nothing')),
                DropdownMenuItem(value: 1, child: Text('Male')),
                DropdownMenuItem(value: 2, child: Text('Female')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedGender = value!;
                  selectedIcon = value == 1
                      ? Icons.male
                      : value == 2
                          ? Icons.female
                          : Icons.person;
                  genderController.text = value == 1
                      ? 'Male'
                      : value == 2
                          ? 'Female'
                          : 'Nothing';
                });
              },
            ),
            SizedBox(height: 10.h),
            _buildEditButton(
              'Edit Data',
              Colors.white,
              AppColors.primary,
              () async {
                final success = await LayoutCubit.get(context)
                    .sendOtp(emailController.text);
                if (success) {
                  final editSuccess = await LayoutCubit.get(context)
                      .editAccountData(
                          nameController.text, selectedGender.toString());
                  if (editSuccess) {
                    LayoutCubit.get(context).editData();
                  }
                }
              },
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              color: AppColors.text1,
            ),
          ),
          SizedBox(height: 8.h),
          TextFormField(
            controller: type == 'email'
                ? emailController
                : type == 'phone'
                    ? phoneController
                    : type == 'name'
                        ? nameController
                        : type == 'data'
                            ? genderController
                            : null,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: AppColors.text1,
                size: 20.sp,
              ),
              hintText: label,
              hintStyle: TextStyle(
                fontFamily: "Montserrat",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          if (buttonText.isNotEmpty)
            _buildEditButton(
                buttonText, Colors.white, AppColors.primary, onPressed),
        ],
      ),
    );
  }

  Widget _buildEditButton(
    String text,
    Color textColor,
    Color backColor,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backColor,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
            side: const BorderSide(
              color:
                  AppColors.primary, // Change this to your desired border color
              width: 1, // Change this to your desired border width
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
