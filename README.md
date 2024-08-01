# Hold Down Button

A Flutter package to trigger an action repeatedly when a widget is hold/pressed down.

[![pub package][package_svg]][package]
[![GitHub][license_svg]](LICENSE)

[![GitHub issues][issues_svg]][issues]
[![GitHub issues closed][issues_closed_svg]][issues_closed]

<hr />

## Features

- `HoldDownButton` displays the child widget passed to it and acts when it is pressed.
- You can customize the **_time delay curve_** to make the button trigger action more or less quickly.
- Also you can set time delay for the periodic function call.

![demo](https://user-images.githubusercontent.com/74326345/169374847-98cb7ba5-22d3-4347-b479-4f34fe77c501.gif)

## Getting started

#### Add to Dependencies

```yaml
hold_down_button: ^1.1.0
```

#### Import the package

```dart
import 'package:hold_down_button/hold_down_button.dart';
```

## Usage

#### Using the Widget with default values

```dart
HoldDownButton(
  onHoldDown: () => print('Pressed'),
  child: ElevatedButton(
    onPressed: () => print('Pressed'),
    child: const Text('ElevatedButton'),
  ),
),
```

#### Customizing initial delay curve

```dart
HoldDownButton(
  onHoldDown: () => print('Pressed'),
  longWait: const Duration(seconds: 1),
  middleWait: const Duration(milliseconds: 750),
  minWait: const Duration(milliseconds: 500),
  child: ElevatedButton(
    onPressed: () => print('Pressed'),
    child: const Text('ElevatedButton'),
  ),
),
```

#### Changing the time delay for periodic function call

```dart
HoldDownButton(
  onHoldDown: () => print('Pressed'),
  holdWait: const Duration(milliseconds: 200),
  child: ElevatedButton(
    onPressed: () => print('Pressed'),
    child: const Text('ElevatedButton'),
  ),
),
```

## Description

|    Field     |                        Description                        |      Type      |               Default               |
| :----------: | :-------------------------------------------------------: | :------------: | :---------------------------------: |
|   `child`    |           **The child widget to be displayed.**           |    _Widget_    |                  -                  |
| `onHoldDown` | **The callback to be called when the button is pressed.** | _VoidCallback_ |                  -                  |
|  `holdWait`  |      **The time delay for periodic function call.**       |   _Duration_   | `const Duration(milliseconds: 100)` |
|  `longWait`  |             **Time delay 2nd function call.**             |   _Duration_   | `const Duration(milliseconds: 500)` |
| `middleWait` |             **Time delay 3rd function call.**             |   _Duration_   | `const Duration(milliseconds: 350)` |
|  `minWait`   |             **Time delay 4th function call.**             |   _Duration_   | `const Duration(milliseconds: 200)` |

### If you liked the package, then please give it a [Like 👍🏼][package] and [Star ⭐][repository]

<!-- Badges URLs -->

[package_svg]: https://img.shields.io/pub/v/hold_down_button.svg?color=blueviolet
[license_svg]: https://img.shields.io/github/license/OutdatedGuy/hold_down_button.svg?color=purple
[issues_svg]: https://img.shields.io/github/issues/OutdatedGuy/hold_down_button.svg
[issues_closed_svg]: https://img.shields.io/github/issues-closed/OutdatedGuy/hold_down_button.svg?color=green

<!-- Links -->

[package]: https://pub.dev/packages/hold_down_button
[repository]: https://github.com/OutdatedGuy/hold_down_button
[issues]: https://github.com/OutdatedGuy/hold_down_button/issues
[issues_closed]: https://github.com/OutdatedGuy/hold_down_button/issues?q=is%3Aissue+is%3Aclosed
