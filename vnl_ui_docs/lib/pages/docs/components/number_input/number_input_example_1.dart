import 'package:vnl_common_ui/vnl_ui.dart';

class NumberInputExample1 extends StatefulWidget {
  const NumberInputExample1({super.key});

  @override
  State<NumberInputExample1> createState() => _NumberInputExample1State();
}

class _NumberInputExample1State extends State<NumberInputExample1> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          child: VNLTextField(
            initialValue: value.toString(),
            onChanged: (value) {
              setState(() {
                this.value = double.tryParse(value) ?? 0;
              });
            },
            features: const [
              InputFeature.spinner(),
            ],
            submitFormatters: [
              TextInputFormatters.mathExpression(),
            ],
          ),
        ),
        gap(8),
        Text('Value: $value'),
      ],
    );
  }
}
