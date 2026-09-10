---
type: Architecture
title: Configs layer & widget catalogue
description: The responsive design-token layer under lib/configs (App.init, UI, AppDimensions, AppTheme, AppText, Space, UIProps, extensions) and the shared widgets to reuse.
tags: [architecture, configs, design-tokens, widgets]
timestamp: 2026-09-10T08:30:00Z
---

# Configs layer (`lib/configs/`)

Everything is initialised per build via `App.init(context)` (`lib/configs/app.dart`), which runs, in order: `UI.init` (MediaQuery-derived width/height/padding/breakpoints), `AppDimensions.init` (a device ratio used by `normalize`/`font`/`space`), `AppTheme.init` (picks light/dark token set from `Theme.of(context).brightness`), `UIProps.init`, `Space.init`, `AppText.init`. Import via `package:al_quran/configs/configs.dart` (barrel) and `configs/app.dart` (for `App` + extensions).

| Class | What you get |
|---|---|
| `UI` | `width`, `height`, `padding`, `vi` (view insets), breakpoints `xxs…xxlg` (width > 300…1700), `safeWidth/Height` |
| `AppDimensions` | `normalize(unit)` for sizes, `font(unit)` for text, `space(multiplier)`, `padding` |
| `AppTheme` | `AppTheme.c!` → `AppCoreTheme` tokens: `accent`, `primary`, `primaryDark`, `background`, `backgroundSub`, `scaffold`, `scaffoldDark`, `text`, `textSub`, `textSub2`, `shadow`, `shadowSub`; `AppTheme.isDark(context)` |
| `AppText` | `h1 h1b h2 h2b h3 h3b b1 b1b b2 b2b l1 l1b l2 l2b btn` (Poppins, colour = `AppTheme.c!.text`) |
| `Space` | widgets `x y x1 y1 x2 y2 xm ym top bottom`, insets `z h v h1 v1 h2 v2`, factories `xf yf hf vf all` |
| `UIProps` | `duration`, `duration2`, `radius`, `tabRadius`, `buttonRadius`, `cardRadius`, `cardShadow`, `boxCard`, `borderButton`, `btnPadSm/Med` |
| Extensions (`configs/extension/`) | `BuildContext`: `currentPath`, `canPop`, `dismissKeyboard()`, `topSafe()`, `bottomSafe()`, `modalBottomKeyboard`; `String`: `push(context)`, `pushReplace`, `pop`, `popUntil`, `available`, `splitError`; `TextStyle`: `cl(color) s(size) tsc(mult) w(3|5|6|7)`; `EdgeInsets`: `sv() st() sb() b(n) t(n) l(n) r(n)`; plus date/double/int/list/num helpers |

Theme data itself (`themeLight`/`themeDark`, `useMaterial3: false`, `fontFamily: 'Poppins'`) is in `configs/theme/core_theme.dart`.

## Shared widget catalogue (`lib/ui/widgets/`, `lib/ui/animations/`)
| Widget | File | Use |
|---|---|---|
| `Screen` | core/screen/screen.dart | Scaffold wrapper: status-bar style, padding, `keyboardHandler` (FocusHandler), `PopScope` via `onBackPressed`/`canPop`, drawers, FAB, `belowBuilders`/`overlayBuilders` |
| `AppButton` | button/app_button.dart | Primary CTA (home buttons) |
| `AppBackButton` | button/app_back_button.dart | Top-left back arrow on index screens |
| `CustomTitle` | app/title.dart | Screen title on index screens |
| `AppName`, `DrawerAppName`, `AppVersion` | app/ | Branding + version from package_info_plus |
| `CustomImage` | custom_image.dart | Faded header image (Kaaba, Sajda) |
| `LoadingShimmer` | loader/loading_shimmer.dart | Shimmer text loader |
| `WidgetAnimator` | animations/bottom_animation.dart | Slide/fade-in for list items |
| `EntranceFader` | animations/entrance_fader.dart | Delayed fade-in |
| `Flare` | flare.dart | Floating particles in dark mode |
| `QuranRail`, `Calligraphy` | | Home decoration |
| `FocusHandler`, `ScrollColumnExpandable` | headless/ | Keyboard dismiss on tap; scrollable column that expands |

Fonts: `Poppins` (UI, weights 200/400/600/900 mapped in pubspec) and `Noor` (Arabic Qur'an text). Icons: `iconsax`.
