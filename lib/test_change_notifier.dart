import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class TestChangeNotifier extends ChangeNotifier {
  GlobalKey _one = GlobalKey();

  int index = 0;

  final BuildContext _context;

  TestChangeNotifier(this._context);

  Widget body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Showcase.withWidget(
            key: _one,
            container: Container(
              color: Colors.blueGrey,
              child: TextButton(
                onPressed: () {
                  ShowCaseWidget.of(_context).completed(_one);
                },
                child: const Text("ボタンです"),
              ),
            ),
            height: 150,
            width: 200,
            disableDefaultTargetGestures: true,
            child: const ColoredBox(
              color: Colors.red,
              child: SizedBox(
                height: 100,
                width: 100,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              ShowCaseWidget.of(_context).startShowCase([_one]);
            },
            child: const Text("ボタンです"),
          ),
        ],
      ),
    );
  }

  Widget navigationBar() {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: onTapItem,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'お気に入り'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'お知らせ'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'アカウント'),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }

  void onTapItem(int value) {
    index = value;
    notifyListeners();
  }
}
