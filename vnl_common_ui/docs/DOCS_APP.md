# Docs App — update demo cho `vnl_common_ui`

`vnl_ui_docs/` là app Flutter dùng để hiển thị docs + preview components/theme từ `vnl_common_ui`.

## Chạy local

```bash
cd vnl_ui_docs
flutter pub get
flutter run -d chrome
```

## Thêm demo cho component mới

1. Tạo folder + tile/example trong:
   - `vnl_ui_docs/lib/pages/docs/components/<component_name>/...`
2. Gắn tile vào catalog:
   - `vnl_ui_docs/lib/pages/docs/components_page.dart`
3. Nếu cần trang riêng theo format “ComponentPage”:
   - Xem `vnl_ui_docs/lib/pages/docs/component_page.dart`

## Tham khảo hệ thống docs navigation/layout

- Guide example: `vnl_ui_docs/vnl_docs_guide.md`
