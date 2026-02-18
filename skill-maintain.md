---
name: vnl-common-ui
description: Workflow & conventions for maintaining `vnl_common_ui` (components/theme/exports) and keeping `vnl_ui_docs` + Markdown docs in sync.
metadata:
  short-description: Maintain VNL Common UI + docs
---

# VNL Common UI Maintainer

Use skill này khi bạn cần:

- Thêm/sửa UI component trong `vnl_common_ui/`.
- Chỉnh theme/typography/icons trong `vnl_common_ui/`.
- Update docs app `vnl_ui_docs/` và tài liệu Markdown (`vnl_guide/`, `vnl_common_ui/docs/`).

## Repo map (quick)

- Monorepo root: `VNLook/flutter-libs/vnl_flutter_ui/`
- Package: `vnl_common_ui/`
- Docs app: `vnl_ui_docs/`
- Markdown catalog: `vnl_guide/components_guide.md`
- Package guideline/docs: `vnl_common_ui/docs/`

## Default workflow

1. **Locate public API impact**
   - Public entrypoints: `vnl_common_ui/lib/vnl_ui.dart` + `vnl_common_ui/lib/shadcn_flutter.dart`
   - Nếu thêm component public: update export trong `vnl_common_ui/lib/shadcn_flutter.dart`
2. **Keep docs in sync**
   - Update/add demo page/tile trong `vnl_ui_docs/lib/pages/docs/components/...`
   - Register tile trong `vnl_ui_docs/lib/pages/docs/components_page.dart`
3. **Update docs files when needed**
   - Guidelines: `vnl_common_ui/docs/GUIDELINES.md`
   - Architecture notes: `vnl_common_ui/docs/ARCHITECTURE.md`
   - (Optional) update Markdown catalog: `vnl_guide/components_guide.md`

## Commands (local)

```bash
# Run docs app (fastest QA)
cd vnl_ui_docs
flutter pub get
flutter run -d chrome
```

## Guardrails

- Ưu tiên prefix `VNL*`/`VNLook*` để tránh nhầm với Material widgets.
- Tránh đổi tên public symbols nếu không cần (breaking change).
- Thay đổi UI nên có demo trong docs app để review nhanh.
