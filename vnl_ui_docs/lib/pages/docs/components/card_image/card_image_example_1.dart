import 'dart:ui';

import 'package:vnl_common_ui/vnl_ui.dart';

class CardImageExample1 extends StatelessWidget {
  const CardImageExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < 10; i++)
                VNLCardImage(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return VNLAlertDialog(
                          title: const Text('Card Image'),
                          content: const Text('You clicked on a card image.'),
                          actions: [
                            VNLPrimaryButton(
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
                  image: Image.network(
                    'https://picsum.photos/200/300',
                  ),
                  title: Text('Card Number ${i + 1}'),
                  subtitle: const Text('Lorem ipsum dolor sit amet'),
                ),
            ],
          ).gap(8),
        ),
      ),
    );
  }
}
