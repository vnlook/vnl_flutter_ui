# `vnl_common_ui`

VNL Common UI là package Flutter cung cấp hệ thống component/theme theo phong cách Shadcn UI, dùng prefix `VNL*`/`VNLook*` để tránh nhầm với Material widgets.

## Entry points

- Preferred: `import 'package:vnl_common_ui/vnl_ui.dart';`
- Source-of-truth exports: `import 'package:vnl_common_ui/shadcn_flutter.dart';`
- Extensions only: `import 'package:vnl_common_ui/vnl_ui_extension.dart';`

## Install

### Local path (recommended trong monorepo)

```yaml
dependencies:
  vnl_common_ui:
    path: ../vnl_common_ui
```

### Git

```yaml
dependencies:
  vnl_common_ui:
    git:
      url: "<your-repo-url>"
      path: vnl_common_ui
```

## Minimal usage

```dart
import 'package:vnl_common_ui/vnl_ui.dart';

void main() {
  runApp(
    const VNLookApp(
      title: 'My App',
      home: Placeholder(),
    ),
  );
}
```

## Docs / Guidelines

- Package docs index: `docs/INDEX.md`
- Contribution guideline: `docs/GUIDELINES.md`
- Component catalog (Markdown): `../vnl_guide/components_guide.md`
- Docs app (playground): `../vnl_ui_docs/` (guide: `../vnl_ui_docs/vnl_docs_guide.md`)
