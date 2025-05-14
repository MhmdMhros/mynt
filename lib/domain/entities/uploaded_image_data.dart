class UploadedImageData {
  final int id;
  final String fileName;
  final String dir;
  final String mimeType;
  final String url;
  final String uploadPath;
  final String background;
  final String field;

  const UploadedImageData({
    required this.id,
    required this.fileName,
    required this.dir,
    required this.mimeType,
    required this.url,
    required this.uploadPath,
    required this.background,
    required this.field,
  });
}
