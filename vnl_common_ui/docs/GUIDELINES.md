# Guidelines — `vnl_common_ui`

## Mục tiêu

- UI consistency: ưu tiên `VNL*`/`VNLook*` thay vì Material tương đương nếu đã có.
- Public API rõ ràng: export tập trung qua `lib/shadcn_flutter.dart` (và `lib/vnl_ui.dart`).
- Demo-first: thêm/đổi component thì update demo trong `vnl_ui_docs/` để QA nhanh.

## Checklist khi thêm component mới

1. **Chọn nhóm đúng** trong `lib/src/components/`:
   - `control/`, `display/`, `form/`, `layout/`, `menu/`, `navigation/`, `overlay/`, `text/`, `icon/`
2. **Naming**
   - Widget public dùng prefix `VNL` hoặc `VNLook`.
   - Tránh trùng tên Material widget (hoặc bọc/wrap với tên VNL).
3. **Export**
   - Thêm export vào `lib/shadcn_flutter.dart` (source-of-truth).
   - Không export file nội bộ/experimental nếu chưa cần public.
4. **Docs app**
   - Thêm example page/tile trong `vnl_ui_docs/lib/pages/docs/components/...`
   - Gắn vào `vnl_ui_docs/lib/pages/docs/components_page.dart` (catalog).
5. **Catalog Markdown (optional nhưng khuyến khích)**
   - Update `vnl_guide/components_guide.md` nếu cần public-facing docs nhanh.
6. **Tests (nếu có/đang dùng)**
   - Ưu tiên widget test tối thiểu trong `test/` của package.

## Checklist khi chỉnh theme/typography/icons

- Theme nằm tại `lib/src/theme/` và được dùng xuyên suốt bởi `VNLookApp` / `VNLookUI`.
- Nếu thêm icon set/font:
  - Update `pubspec.yaml` `flutter/fonts` hoặc assets tương ứng.
  - Đảm bảo docs app render được trên web (chạy `vnl_ui_docs`).

## Tài liệu tham khảo

- Docs navigation/layout example: `../../vnl_ui_docs/vnl_docs_guide.md`
