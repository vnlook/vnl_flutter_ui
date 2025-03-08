import 'package:docs/pages/docs/components/date_picker/date_picker_example_1.dart';
import 'package:docs/pages/docs/components/date_picker/date_picker_example_2.dart';
import 'package:vnl_common_ui/vnl_ui.dart';

import '../../widget_usage_example.dart';
import '../component_page.dart';
import 'date_picker/date_picker_example_3.dart';

class DatePickerExample extends StatelessWidget {
  const DatePickerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentPage(
      name: 'date_picker',
      description: 'A widget that lets users select dates and date ranges.',
      displayName: 'Date Picker',
      children: [
        WidgetUsageExample(
          title: 'Date Picker Example',
          path: 'lib/pages/docs/components/date_picker/date_picker_example_1.dart',
          child: DatePickerExample1(),
        ),
        WidgetUsageExample(
          title: 'Date Range Picker Example',
          path: 'lib/pages/docs/components/date_picker/date_picker_example_2.dart',
          child: DatePickerExample2(),
        ),
        WidgetUsageExample(
          title: 'Date Input Example',
          path: 'lib/pages/docs/components/date_picker/date_picker_example_3.dart',
          child: DatePickerExample3(),
        ),
      ],
    );
  }
}
