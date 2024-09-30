import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/classlink/repo.dart';
import 'package:flutter_application_1/utils/extentions/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? token;
  dynamic userInfo;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    token = prefs.getString("token");
                    setState(() {});
                  },
                  child: const Text("Token")),
              SelectableText("$token"),
              ElevatedButton(
                  onPressed: () async {
                    Logger("ttt $token");
                    userInfo = await getProfileInfo(
                        "https://nodeapi.classlink.com/v2/my/info", token);
                    Logger("innnnfoooo $userInfo");
                    setState(() {});
                  },
                  child: const Text("get Profile Info")),
              SelectableText("$userInfo")
            ],
          ),
        ),
      ),
    ));
  }
}
