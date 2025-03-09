import 'package:flutter/cupertino.dart';
import 'package:vnl_common_ui/vnl_ui.dart' as vnlui;

class CupertinoExample1 extends StatefulWidget {
  const CupertinoExample1({super.key});

  @override
  State<CupertinoExample1> createState() => _CupertinoExample1State();
}

class _CupertinoExample1State extends State<CupertinoExample1> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('My Cupertino App'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            Text(
              '$_counter',
              style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
            ),
            const vnlui.Gap(16),
            CupertinoButton.filled(
              onPressed: () => setState(() => _counter++),
              child: const Icon(CupertinoIcons.add),
            ),
            const vnlui.Gap(64),
            vnlui.ShadcnUI(
                child: vnlui.Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('You can also use shadcn_flutter widgets inside Material widgets'),
                  const vnlui.Gap(16),
                  vnlui.PrimaryButton(
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: const Text('Hello'),
                            content: const Text('This is Cupertino dialog'),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Open Cupertino Dialog'),
                  ),
                  const vnlui.Gap(8),
                  vnlui.SecondaryButton(
                    onPressed: () {
                      vnlui.showDialog(
                        context: context,
                        builder: (context) {
                          return vnlui.AlertDialog(
                            title: const Text('Hello'),
                            content: const Text('This is shadcn_flutter dialog'),
                            actions: [
                              vnlui.PrimaryButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Open shadcn_flutter Dialog'),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
