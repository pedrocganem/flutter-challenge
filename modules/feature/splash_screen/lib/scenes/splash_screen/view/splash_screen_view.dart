import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:splash_screen/scenes/splash_screen/view/splash_screen_view_model.dart';

class SplashScreenView extends StatefulWidget {
  final _viewModel = Modular.get<SplashScreenViewModel>();
  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    widget._viewModel.viewDidLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
          decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/splash_screen.png',
                package: "splash_screen"), fit: BoxFit.cover),
      )),
    );
  }
}
