import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LauncherHelper {
  static Future<void> openUrl(String url) async {
    try {
      final launched = await launchUrl(Uri.parse(url));

      if (!launched) {
        throw Exception("Could not launch URL");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> sendEmail(String email) async {
    try {
      final launched = await launchUrl(Uri(scheme: "mailto", path: email));

      if (!launched) {
        throw Exception("Could not launch email");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
