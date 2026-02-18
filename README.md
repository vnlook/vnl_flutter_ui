# VNL Flutter UI

Monorepo cho UI library của VNLook (Flutter) + app docs + tài liệu hướng dẫn.

## Index

- `vnl_common_ui/`: Flutter package (UI components + theme + extensions).
- `vnl_ui_docs/`: Flutter app hiển thị docs + component playground (tham khảo `vnl_ui_docs/vnl_docs_guide.md`).
- `vnl_guide/`: Tài liệu Markdown (ví dụ: `vnl_guide/components_guide.md`).

File index chi tiết: `INDEX.md`.

## Quick start

### 1) Chạy docs app

```bash
cd vnl_ui_docs
flutter pub get
flutter run -d chrome
```

### 2) Dùng `vnl_common_ui` trong project khác (path dependency)

Trong `pubspec.yaml`:

```yaml
dependencies:
  vnl_common_ui:
    path: ../vnl_common_ui
```

## Documents & guidelines

- `vnl_common_ui/README.md`: Usage + entrypoints.
- `vnl_common_ui/docs/`: Guidelines + docs index cho package.
- `vnl_ui_docs/vnl_docs_guide.md`: Example hệ thống docs navigation/layout.
