import 'package:vnl_common_ui/vnl_ui.dart';

class StepsExample1 extends StatelessWidget {
  const StepsExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return const VNLSteps(
      children: [
        StepItem(
          title: Text('Create a project'),
          content: [
            Text('Create a new project in the project manager.'),
            Text('Add the required files to the project.'),
          ],
        ),
        StepItem(
          title: Text('Add dependencies'),
          content: [
            Text('Add the required dependencies to the project.'),
          ],
        ),
        StepItem(
          title: Text('Run the project'),
          content: [
            Text('Run the project in the project manager.'),
          ],
        ),
      ],
    );
  }
}
