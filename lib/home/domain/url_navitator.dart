import 'package:url_launcher/url_launcher.dart' as urlLauncher;
import 'dart:html' as html; // Solo para Flutter Web

class UrlNavigator{
  
  UrlNavigator();

  Future<void> loadLink(String url)async{
    if (!await urlLauncher.launchUrl(Uri.parse(url))) {
      throw Exception('No se pudo cargar la url');
    }
  }

  Future<void> loadOneUniqueLink(String url)async{
    if (!await urlLauncher.launchUrl(
      Uri.parse(url),
      mode: urlLauncher.LaunchMode.externalApplication
    )) {
      throw Exception('No se pudo cargar el link');
    }
  }

  Future<void> sendMessage(String recipient, String body)async{
    final mailToUri = Uri(
      scheme: 'mailto',
      path: recipient,
      queryParameters: {
        'subject': 'Mensaje del portafolio web',
        'body': body
      }
    );
    html.window.location.href = mailToUri.toString();
  }

}