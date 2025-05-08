import 'signed_url_data.dart';

class SignedUrl {
  final SignedUrlData? video;
  final SignedUrlData? thumbnail;

  SignedUrl({
    required this.video,
    required this.thumbnail,
  });
}
