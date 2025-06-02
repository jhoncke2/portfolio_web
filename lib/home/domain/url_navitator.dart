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
    final String subject = Uri.encodeComponent('Mensaje del portafolio Web');
    final String encodedBody = Uri.encodeComponent(body);
    final String mailtoLink = 'mailto:$recipient?subject=$subject&body=$encodedBody';
    final mailToUri = Uri(
      scheme: 'mailto',
      path: recipient,
      query: Uri.encodeFull(
        'subject=$subject&body=$encodedBody'
      )
    );
    print('*************\n$mailtoLink');
    //html.AnchorElement(href: mailtoLink)
    //  ..target = '_blank'
    //  ..click();
    //html.window.open(mailtoLink, '_blank');
    html.window.location.href = mailToUri.toString();
  }

}