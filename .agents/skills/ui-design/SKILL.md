---
name: ui-design
description: Design Flutter UI screens and widgets for The Holy Qur'an app. Use when asked to build, design, create, or prototype a screen, widget, tile, dialog, or UI component. Enforces this app's configs layer (AppTheme, AppText, Space, AppDimensions, UIProps), fonts (Poppins / Noor), Screen wrapper, and class-widget rules.
argument-hint: <what to design>
---

# UI Design — The Holy Qur'an

Everything goes through the configs layer (`lib/configs/`). Never hardcode colors, font sizes or pixel values. Full API reference: `docs/architecture/configs.md`.

## Brand at a glance
Calm, reading-first. Soft coral accent on white (light) or near-black (dark). Arabic Qur'an text in the **Noor** font, UI text in **Poppins**. Light and dark themes are both first-class (toggle in the drawer, persisted by `AppProvider`).

## Every widget
```dart
class _Header extends StatelessWidget {          // class, never a function
  const _Header();
  @override
  Widget build(BuildContext context) {
    App.init(context);                            // always first
    final appProvider = Provider.of<AppProvider>(context);   // if you need isDark
    return …;
  }
}
```
Screens wrap their body in `Screen(...)` (`lib/ui/widgets/core/screen/screen.dart`): it sets status-bar brightness, optional `keyboardHandler`, `PopScope`, drawers and FABs. Screen-private widgets are `part` files under `widgets/`.

## Color tokens — `AppTheme.c!.<token>`
| Token | Light | Dark | Use |
|---|---|---|---|
| `accent` | `#EE8F8B` coral | same | CTAs, FAB, dividers, highlights |
| `primary` | `#5BA897` teal | same | borders (`UIProps.borderButton`), secondary accents |
| `primaryDark` | `#896277` | same | rare, deep accent |
| `background` | white | `#212121` | cards, surfaces |
| `backgroundSub` | `#F0F0F0` | `#1C1C1E` | secondary surfaces |
| `scaffold` / `scaffoldDark` | `#FEFEFE` / `#FCFCFC` | `#0E0E0E` | page backgrounds |
| `text` / `textSub` / `textSub2` | black87 / greys | white70 | body, secondary, hints |
| `shadow` / `shadowSub` | black 20% / 12% | same | `UIProps.cardShadow` |

Rules: no `Color(0xff…)` inline (the coral `#ee8f8b` still appears in legacy dividers — use `AppTheme.c!.accent` instead); no `Colors.white`/`Colors.black` for surfaces/text — use `background`/`text`; `.withValues(alpha:)` not `.withOpacity`.

## Typography — `AppText.<style>` (sizes scale with `AppDimensions.font`)
| Style | Base | Use |
|---|---|---|
| `h1` / `h1b` | 20 | screen titles (`CustomTitle`) |
| `h2` / `h2b` | 14 | section headers, juz names |
| `h3` / `h3b` | 8 | sub-headers, error titles |
| `b1` / `b1b` | 8 | body, surah Arabic name in tiles |
| `b2` / `b2b` | 6.25 | secondary labels, hints |
| `l1` / `l1b`, `l2` / `l2b` | 5 / 4 | captions, ayah numbers |

`b` = weight 600. Extensions: `AppText.b1!.cl(AppTheme.c!.textSub!)`, `.s(18)`, `.tsc(1.2)`, `.w(5)`.
Qur'an text: `TextStyle(fontFamily: 'Noor', fontSize: AppDimensions.normalize(…))`, `textAlign: TextAlign.right`.

## Spacing & sizing — `Space` / `AppDimensions`
- Gaps: `Space.y!` (½ unit), `Space.y1!` (1), `Space.y2!` (2), `Space.x…` for rows, `Space.xm!`/`Space.ym!` expanding spacers, `Space.yf(1.5)` custom, `Space.top!`/`Space.bottom!` safe-area.
- Padding: `Space.z!` zero, `Space.h!`/`Space.v!` (½), `Space.h1!`/`Space.v1!`, `Space.h2!`/`Space.v2!`, `Space.all(1)`, `Space.hf(0.5)`; extensions `.st()`/`.sb()`/`.sv()` add safe-area, `.t(n)/.b(n)/.l(n)/.r(n)` set a side.
- Sizes: `AppDimensions.normalize(n)` for icons/images/heights, `AppDimensions.font(n)` for text. Never raw `SizedBox(height: 16)`.
- Radii/shadows/decorations: `UIProps.radius`, `buttonRadius`, `cardRadius`, `cardShadow`, `boxCard`, `borderButton`, durations `UIProps.duration`/`duration2`.

## Reuse before building
`AppButton` (primary CTA), `AppBackButton`, `CustomTitle`, `AppName`/`DrawerAppName`, `AppVersion`, `CustomImage` (faded header image), `LoadingShimmer`, `WidgetAnimator` (list entrance), `EntranceFader`, `Flare` (dark-mode particles), `QuranRail`, `Calligraphy`, `FocusHandler`, `ScrollColumnExpandable`. Icons: `iconsax`.

## Patterns to copy
- Index screens: `Stack` inside `SafeArea` → `CustomImage` header + `AppBackButton` + `CustomTitle` + search field + list/grid (see `surah_index_screen.dart`, `juz_index_screen.dart`).
- Reading screen: `CustomScrollView` with pinned `SliverAppBar` + `SliverList` of `ListTile`s (see `page_screen.dart`).
- States: `BlocBuilder` branches on `XFetchLoading` → `LoadingShimmer`, `XFetchFailed` → message + retry, `XFetchSuccess` → content.

## Output
Write the widget as a class in the right place (`lib/ui/widgets/…` if shared, `lib/ui/screens/<screen>/widgets/` if private), wire routes via `AppRoutes` if it's a screen, add/extend the widget test, run `fvm flutter analyze`.
