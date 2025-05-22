import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/presentation/widgets/simple_toast.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL({
  required String url,
  bool isSocialMedia = false,
}) async {
  if (!url.startsWith("https")) {
    url = "https://$url";
  }
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    SimpleToast.show(
      msg:
          isSocialMedia ? "something went wrong try again" : "enter valid link",
    );
  }
}

Future<void> launchWhatsApp({
  required String phone,
  String message = 'Hello',
}) async =>
    await launchURL(
      url: "https://api.whatsapp.com/send?phone=+$phone&text=$message",
      isSocialMedia: true,
    );

Future<void> launchFacebook({
  required String user,
}) async =>
    await launchURL(
      url: "https://www.facebook.com/$user/",
      isSocialMedia: true,
    );

Future<void> launchInstagram({
  required String user,
}) async =>
    await launchURL(
      url: "https://www.instagram.com/$user/",
      isSocialMedia: true,
    );

Future<void> launchTwitter({
  required String user,
}) async =>
    await launchURL(
      url: "https://www.linkedin.com/in/$user/",
      isSocialMedia: true,
    );

Future<File?> getImageFile(
  BuildContext context, {
  bool allowMultiple = false,
}) async {
  FocusScope.of(context).requestFocus(FocusNode());
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
    allowMultiple: allowMultiple,
  );
  if (result != null) {
    File imageFile = File(result.files.single.path!);
    return imageFile;
  }
  return null;
}

Future<File?> getAttachmentFile(FileType fileType) async {
  if (fileType == FileType.any) {
    return await getAPdfFile();
  }
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: fileType,
    allowMultiple: false,
  );
  if (result != null) {
    File imageFile = File(result.files.single.path!);
    return imageFile;
  }
  return null;
}

Future<File?> getAPdfFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom, allowMultiple: false, allowedExtensions: ['pdf']);
  if (result != null) {
    File imageFile = File(result.files.single.path!);
    return imageFile;
  }
  return null;
}

Future<String> fileToBase64(File file) async {
  List<int> bytes = await file.readAsBytes();
  return base64Encode(bytes);
}

Future<void> downloadToDocuments(String url, String fileName) async {
  try {
    Directory? directory;

    if (Platform.isAndroid || Platform.isWindows || Platform.isLinux) {
      directory = Directory('/storage/emulated/0/Documents');
    } else if (Platform.isMacOS) {
      directory = Directory('${Platform.environment['HOME']}/Documents');
    } else if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    }

    if (!await directory!.exists()) {
      await directory.create(recursive: true);
    }

    String savePath = '${directory.path}/$fileName';

    Dio dio = Dio();
    await dio.download(url, savePath);

    showToast("Downloaded to: $savePath", ToastType.success);
  } catch (e) {
    print(e);
    showToast("Download error: $e", ToastType.error);
  }
}

bool isEmail(String email) => RegExp(
      '^(([\\w-]+\\.)+[\\w-]+|([a-zA-Z]|[\\w-]{2,}))@((([0-1]?'
      '[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.'
      '([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])'
      ')|([a-zA-Z]+[\\w-]+\\.)+[a-zA-Z]{2,4})\$',
    ).hasMatch(email);

String? getSexValue(String? sex) {
  return sex == null || sex.isEmpty
      ? null
      : sex == 'MALE'
          ? 'male'
          : 'female';
}

bool isValidYouTubeUrl(String url) {
  // Regular expression for matching YouTube video URLs
  RegExp regExp = RegExp(
    r'^https?:\/\/(?:www\.)?(?:youtube\.com\/watch\?v=([a-zA-Z0-9_-]+)|youtu\.be\/([a-zA-Z0-9_-]+))',
    caseSensitive: false,
    multiLine: false,
  );

  return regExp.hasMatch(url);
}

Future<File> changeFileNameOnly(File file, String newFileName) async {
  var path = file.path;

  var lastSeparator = path.lastIndexOf(Platform.pathSeparator);
  var newPath = path.substring(0, lastSeparator + 1) + newFileName;
  if (path == newPath) return Future.value(file);
  return await file.rename(newPath);
}

bool areListsEqual(List<String> list1, List<String> list2) {
  if (list1.length != list2.length) {
    return false;
  }

  for (int i = 0; i < list1.length; i++) {
    if (list1[i] != list2[i]) {
      return false;
    }
  }
  return true;
}

String formatDateWithSlashed(DateTime date) =>
    DateFormat('dd/MM/yyyy').format(date);

String generateRandomToken(int length) {
  const chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789#';
  final rand = Random();
  return List.generate(length, (_) => chars[rand.nextInt(chars.length)]).join();
}

enum ToastType { success, error, warning, info }

void showToast(String message, ToastType type) {
  Color bgColor;
  IconData icon;

  switch (type) {
    case ToastType.success:
      bgColor = Colors.green;
      icon = Icons.check_circle;
      break;
    case ToastType.error:
      bgColor = Colors.red;
      icon = Icons.error;
      break;
    case ToastType.warning:
      bgColor = Colors.orange;
      icon = Icons.warning;
      break;
    case ToastType.info:
      bgColor = Colors.blue;
      icon = Icons.info;
      break;
  }

  showToastWidget(
    Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 75),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    ),
    duration: const Duration(seconds: 3),
    position: ToastPosition.bottom,
  );
}

String normalizeEgyptianPhoneNumber(String phoneNumber) {
  String cleaned = phoneNumber.replaceAll(RegExp(r'\D'), '').trim();

  if (cleaned.startsWith('+20')) {
    return cleaned;
  } else if (cleaned.startsWith('20')) {
    return '+$cleaned';
  } else if (cleaned.startsWith('0')) {
    return '+20${cleaned.substring(1)}';
  } else {
    return '+20$cleaned';
  }
}

// Helper functions to get colors based on status
Color getStatusBackgroundColorById(int statusId) {
  switch (statusId) {
    case 0: // Assuming 0 = OPEN
      return const Color(0xFFE9F9FB);
    case 1: // PENDING
      return const Color(0xFFFFF8E5);
    case 2: // TAKEN (you had TAKEN = 2)
      return Colors.blue.shade100;
    case 3: // SOLVED (3)
      return Colors.green.shade100;
    case 4: // REJECTED
      return const Color(0xFFFFE8E5);
    case 5: // IN PROGRESS (if applicable)
      return const Color(0xFFEDF8EE);
    case 6: // CANCELED
      return const Color(0xFFF0F0F0);
    default:
      return Colors.grey[200]!;
  }
}

Color getStatusTextColorById(int statusId) {
  switch (statusId) {
    case 0: // OPEN
      return AppColors.primary;
    case 1: // PENDING
      return const Color(0xFFCC9D00);
    case 2: // TAKEN
      return Colors.blue.shade800;
    case 3: // SOLVED
      return Colors.green.shade800;
    case 4: // REJECTED
      return const Color(0xFFBF4C43);
    case 5: // IN PROGRESS
      return const Color(0xFF328039);
    case 6: // CANCELED
      return const Color(0xFF666666);
    default:
      return Colors.black;
  }
}

Future<bool> initialyConnectivity() async {
  final List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());

  if (connectivityResult.contains(ConnectivityResult.mobile)) {
    return true;
  } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
    return true;
  } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
    return true;
  } else {
    return false;
  }
}
