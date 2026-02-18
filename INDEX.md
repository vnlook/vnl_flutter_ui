# Project Index — `vnl_flutter_ui`

## Packages / Apps

### `vnl_common_ui/` (Flutter package)

- Public entrypoints:
  - `package:vnl_common_ui/vnl_ui.dart` (preferred)
  - `package:vnl_common_ui/shadcn_flutter.dart` (source-of-truth exports)
  - `package:vnl_common_ui/vnl_ui_extension.dart` (extensions only)
- Docs:
  - `vnl_common_ui/README.md`
  - `vnl_common_ui/docs/INDEX.md`

### `vnl_ui_docs/` (Flutter docs app)

- App chạy local để preview components/theme.
- Docs navigation example: `vnl_ui_docs/vnl_docs_guide.md`
- Run:
  - `cd vnl_ui_docs && flutter pub get`
  - `flutter run -d chrome`

### `vnl_guide/` (Markdown docs)

- Component catalog (Markdown): `vnl_guide/components_guide.md`
- Images: `vnl_guide/docs_images/`

## Dev notes

- Nếu chỉnh UI components: ưu tiên update demo trong `vnl_ui_docs/` để QA nhanh.
- Nếu thêm component mới: update docs/guidelines theo `vnl_common_ui/docs/GUIDELINES.md`.
