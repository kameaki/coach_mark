import 'package:coach_mark/test_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      disableBarrierInteraction: true,
      builder: Builder(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => TestChangeNotifier(context),
          child: Consumer<TestChangeNotifier>(
            builder: (_, cn, child) {
              return SafeArea(
                child: Scaffold(
                    appBar: AppBar(
                      title: const Text('テスト'),
                    ),
                    body: cn.body(),
                    bottomNavigationBar: cn.navigationBar()),
              );
            },
          ),
        ),
      ),
    );
  }
}
