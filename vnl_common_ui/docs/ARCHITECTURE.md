# Architecture — `vnl_common_ui`

## Public API & entrypoints

- `lib/vnl_ui.dart`: preferred entrypoint (re-export `shadcn_flutter.dart`).
- `lib/shadcn_flutter.dart`: source-of-truth export list (giảm merge conflict khi sync upstream).
- `lib/vnl_ui_extension.dart` / `lib/shadcn_flutter_extension.dart`: extensions-only.

## Source layout

`lib/src/` chia theo nhóm chức năng:

- `components/`: UI building blocks (form/layout/overlay/navigation/...).
- `theme/`: theme data, color scheme, typography, density.
- `icons/`, `fonts/`: assets + generated icon fonts.
- `platform/`: platform abstractions (web/mobile/desktop).

## Docs strategy (repo-level)

Repo sử dụng 3 lớp tài liệu:

1. **Docs app** (`vnl_ui_docs/`): playground + reference live.
2. **Markdown guide** (`vnl_guide/components_guide.md`): catalog nhanh, dễ search.
3. **Package docs** (`vnl_common_ui/docs/`): guideline/architecture/contributing.
