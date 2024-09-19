import 'package:flutter/material.dart';

class LuancherPage extends StatefulWidget {
  static const String routeName = '/';
  const LuancherPage({super.key});

  @override
  State<LuancherPage> createState() => _LuancherPageState();
}
class _LuancherPageState extends State<LuancherPage> {
  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
