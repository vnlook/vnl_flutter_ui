import 'package:vnl_common_ui/vnl_ui.dart';

class VNLMenubar extends StatefulWidget {
  final List<MenuItem> children;
  final Offset? popoverOffset;
  final bool border;

  const VNLMenubar({super.key, this.popoverOffset, this.border = true, required this.children});

  @override
  State<VNLMenubar> createState() => MenubarState();
}

class MenubarState extends State<VNLMenubar> {
  @override
  Widget build(BuildContext context) {
    final theme = VNLTheme.of(context);
    if (widget.border) {
      return OutlinedContainer(
        borderColor: theme.colorScheme.border,
        backgroundColor: theme.colorScheme.background,
        borderRadius: theme.borderRadiusMd,
        child: AnimatedPadding(
          duration: kDefaultDuration,
          padding: const EdgeInsets.all(4) * theme.scaling,
          child: buildContainer(context, theme),
        ),
      );
    }
    return buildContainer(context, theme);
  }

  Widget buildContainer(BuildContext context, VNLThemeData theme) {
    return Data.inherit(
      data: this,
      child: MenuGroup(
        regionGroupId: this,
        direction: Axis.vertical,
        itemPadding: EdgeInsets.zero,
        subMenuOffset: (widget.border ? const Offset(-4, 8) : const Offset(0, 4)) * theme.scaling,
        builder: (context, children) {
          return IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: children,
            ),
          ).medium();
        },
        children: widget.children,
      ),
    );
  }
}
