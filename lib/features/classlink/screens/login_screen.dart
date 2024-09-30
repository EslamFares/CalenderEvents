import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/classlink/redirect_page.dart';
import 'package:flutter_application_1/features/classlink/repo.dart';
import 'package:flutter_application_1/utils/extentions/logger.dart';
import 'package:flutter_application_1/utils/extentions/spacing_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Repo authentecator = Repo();
  dynamic launchBrowser() async {
    try {
      Uri url = Uri(scheme: 'https', path: "www.classlink.com/login");

      await launchUrl(url);
    } catch (e) {
      Logger(e.toString());
    }
  }

  Future<void> signIn(
      Future<Uri> Function(Uri authorizationUrl) authorizationCallback) async {
    final grant = authentecator.createGrant();
    final redirectUrl =
        await authorizationCallback(authentecator.getAuthorizatioURl(grant));
    await authentecator.handelAuthorizationResponse(
        grant, redirectUrl.queryParameters);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(title: const Text("Classlink login")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      final Completer comp = Completer<Uri>();
                      signIn((authorizationUrl) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RedirectPage(
                                authorizationUrl: authorizationUrl,
                                onredirectAttep: (redirectedUrl) {
                                  Logger("Url to redirected $redirectedUrl");
                                  comp.complete(redirectedUrl);
                                })));

                        Logger("takallamUrl   $authorizationUrl");
                        return comp.future as Future<Uri>;
                      });
                    },
                    child: const Text("Login via classLink")),
              ),
              gapVertical(20),
              ElevatedButton(
                  onPressed: () async {
                    final grant = authentecator.createGrant();

                    final authorizationUrl =
                        authentecator.getAuthorizatioURl(grant);

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RedirectPage(
                            authorizationUrl: authorizationUrl,
                            onredirectAttep: (redirectedUrl) async {
                              await authentecator.handelAuthorizationResponse(
                                  grant, redirectedUrl.queryParameters);
                              Logger("Url to redirected $redirectedUrl");
                            })));
                  },
                  child: const Text("login")),
              gapVertical(20),
              ElevatedButton(
                  onPressed: () {
                    launchBrowser();
                  },
                  child: const Text("New Login "))
            ],
          )),
    );
  }
}
