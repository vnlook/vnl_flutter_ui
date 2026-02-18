---
name: skill-using
description: Cheat sheet để invoke các Codex skills khi làm việc với repo `vnl_flutter_ui` (maintain package + dùng UI components).
---

# Skill using (Codex agents)

File này là “cheat sheet” để agents/dev biết **invoke skill nào** khi làm việc với repo `vnl_flutter_ui`.

## Skills cho repo này

### 1) Maintain package + docs: `$vnl-common-ui`

Dùng khi:
- Thêm/sửa UI component/theme trong `vnl_common_ui/`
- Update docs app `vnl_ui_docs/` hoặc docs Markdown (`vnl_guide/`, `vnl_common_ui/docs/`)

Ví dụ prompt:
- “Use `$vnl-common-ui` to add a new `VNL...` component and wire it into `vnl_ui_docs` catalog.”

### 2) Implement screen using components: `$vnl-ui-components-usage`

Dùng khi:
- Viết UI screen trong app dùng `vnl_common_ui`
- Cần pattern import/setup `VNLookApp`/`VNLookApp.router`
- Tìm ví dụ component usage theo `vnl_ui_docs`

Ví dụ prompt:
- “Use `$vnl-ui-components-usage` to build a login screen with `VNLTextField` + `VNLPrimaryButton`.”

## Notes

- Skills được cài ở máy local: `~/.codex/skills/`
- Khi không chắc usage của component, ưu tiên reference code trong `vnl_ui_docs/` (examples/tiles).
