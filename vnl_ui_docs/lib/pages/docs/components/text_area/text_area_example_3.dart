import 'package:vnl_common_ui/vnl_ui.dart';

class TextAreaExample3 extends StatelessWidget {
  const TextAreaExample3({super.key});

  @override
  Widget build(BuildContext context) {
    return const VNLTextArea(
      initialValue: 'Hello, World!',
      expandableWidth: true,
      expandableHeight: true,
      initialWidth: 500,
      initialHeight: 300,
    );
  }
}
