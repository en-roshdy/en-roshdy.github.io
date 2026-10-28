import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static Future<void> launchUrlString(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  static Future<void> launchEmail(String email, {String? subject}) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: subject != null ? {'subject': subject} : null,
    );
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch mailto:$email');
    }
  }

  static Future<void> launchPhone(String phone) async {
    final Uri uri = Uri(scheme: 'tel', path: phone.replaceAll(' ', ''));
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch tel:$phone');
    }
  }
}
