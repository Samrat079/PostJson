import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> openUrl(String url) async {
    final Uri link = Uri.parse(url);

    if (await canLaunchUrl(link)) {
      await launchUrl(link, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $link';
    }
  }
}