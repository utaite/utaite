import 'package:flutter/material.dart';
import 'package:utaite/util/util.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: UI.borderRadiusCircle,
                child: Image.network(
                  Const.profileImage,
                  height: 125,
                  width: 125,
                  fit: BoxFit.cover,
                ),
              ),
              Text(Const.name),
            ],
          ),
        ),
      ),
    );
  }
}
