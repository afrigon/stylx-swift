# stylx-swift

Design-system primitives for SwiftUI. `stylx` packages the pieces an app
needs to look consistent — a themed color system with semantic roles, a
typography scale, spacing and radius tokens, and a set of ready-made
components built on top of them — so screens compose from named tokens
instead of ad-hoc values.

## Install

Add the package to `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/afrigon/stylx-swift.git", branch: "main")
]
```

Then add `stylx` to the target's dependencies:

```swift
.product(name: "stylx", package: "stylx-swift")
```

## Usage

Tokens plug into the standard SwiftUI modifiers. Spacing constants extend
`CGFloat` (`.xxxs` through `.xxxxxxxl`), text styles apply through
`textStyle(_:)`, and colors resolve per color scheme and contrast setting
through `ShapeStyle` tokens such as `.backgroundDefault`,
`.foregroundMuted`, and `.borderEmphasis`:

```swift
import stylx

VStack(spacing: .m) {
    Text("Transactions")
        .textStyle(.heading2)
    Text("All payments settled.")
        .textStyle(.body(.l, .regular))
        .foregroundStyle(.foregroundMuted)
}
.padding(.l)
.background(.backgroundDefault)
```

### Buttons

Three button styles — `default`, `emphasis`, and `muted` — each taking a
scale (`.xs` to `.l`) and a format (`.regular`, `.circle`, `.square`,
`.capsule`). The `loading(_:)` modifier swaps the label for a spinner:

```swift
Button("Save") { save() }
    .buttonStyle(.emphasis(scale: .m, format: .capsule))
    .loading(isSaving)
```

### Color roles

Semantic roles — `.neutral`, `.information`, `.success`, `.warning`,
`.critical`, `.magic` — flow through the environment, and the
role-relative tokens `.roleEmphasis`, `.roleMuted`, `.roleForeground`,
`.roleBorderEmphasis`, and `.roleBorderMuted` resolve against whichever
role is active:

```swift
Text("Approved")
    .foregroundStyle(.roleForeground)
    .background(.roleMuted)
    .environment(\.colorRole, .success)
```

Custom roles build from `ColorRole` and `ThemedColor`, which pair light
and dark variants with increased-contrast fallbacks, on top of a fixed
`Palette` of hues in ten tints (`ColorIdentifier`, e.g. `.blue.value7`).

### Components

- `Separator` — a horizontal or vertical rule in three sizes
- `Skeleton`, `SkeletonParagraph`, `SkeletonCard`, `SkeletonCode`,
  `SkeletonForm` — shimmering loading placeholders
- `QRCodeView` — renders a QR code from a `String`, `URL`, or `Data`
- `WebView` — a `WKWebView` wrapper for iOS and macOS

### Typography

`textStyle(_:)` covers `heading1` through `heading3`, `subtitle`,
`body(scale, weight)`, `code(scale)`, `overline`, and `disclaimer`,
scaled with Dynamic Type. A custom `TextRole` in the environment swaps
the font family; `FontRegister` loads bundled font files and
`VariableFont` builds fonts from variable-font axes.

## Development

```sh
mise run build
mise run lint
mise run format
```
