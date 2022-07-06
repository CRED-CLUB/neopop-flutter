# NeoPOP
NeoPOP is CRED's inbuilt library for using NeoPOP components in your app.

### What really is NeoPOP? 
[NeoPOP](https://cred.club/neopop) was created with one simple goal; to create the next generation of a beautiful, affirmative design system. NeoPOP stays true to everything that design at CRED stands for.

NeoPOP is built for [Android](https://github.com/CRED-CLUB/neopop-android), [iOS](https://github.com/CRED-CLUB/neopop-ios), [Flutter](https://pub.dev/packages/neopop) and [Web](https://github.com/CRED-CLUB/neopop-web)

![NeoPOP Banner](https://i.imgur.com/1gN3wzy.jpg "NeoPOP Banner")

## Installation

Add `neopop` as a [dependency in your pubspec.yaml file](https://flutter.dev/using-packages/).

```yaml  
dependencies:
    neopop: ^1.0.1
```  

# NeoPopButton

![Configs](https://user-images.githubusercontent.com/9965653/173539706-fa521743-b214-4372-87dd-799d9b8b6c70.png)
`NeoPopButton` render 5 surfaces, top, left, right, bottom and center.
`NeoPopButton` widget gives you mutliple configs that you can use for your widget.

## Elevated

![Elevated](https://user-images.githubusercontent.com/9965653/172596228-1bcb92d0-d293-4290-ac38-b9a693a2fab2.png "Elevated Button")
![elevated](https://user-images.githubusercontent.com/9965653/175874614-ab316981-29d1-4ed5-a90b-6fe840ac9700.gif)


``` dart
NeoPopButton(
    color: Colors.white,
    onTapUp: () => HapticFeedback.vibrate(),
    onTapDown: () => HapticFeedback.vibrate(),
    child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text("Pay now"),
            ],
        ),
    ),
),
```

## Flat

![Flat](https://user-images.githubusercontent.com/9965653/172597180-63b4c386-9b7c-4211-a64c-a79892232481.png "Flat Button")
![flatButton](https://user-images.githubusercontent.com/9965653/175874619-b5edb3e8-6c18-4f15-8e60-ef44cb004c94.gif)

By specifying the `buttonPosition` as `Position.center`, NeoPOP will compute right and bottom surface's color according to `color`.
Top and left surface's color is computed w.r.t `parentColor` and `grandparentColor`

``` dart
NeoPopButton(
    color: Colors.white,
    onTapUp: () => HapticFeedback.vibrate(),
    onTapDown: () => HapticFeedback.vibrate(),
    parentColor: Colors.transparent,
    buttonPosition: Position.center,
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
                Text("Pay Now"),
            ],
        ),
    ),
),
```

## Shimmer

```dart
const NeoPopShimmer(
    shimmerColor: Colors.yellow,
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
        child: Text("Hello"),
    ),
),
 ```  
## Flat Strokes

![Flat Strokes](https://user-images.githubusercontent.com/9965653/172597728-5830cc72-1d2a-4d52-8089-55fb61449996.png "Flat Strokes")
![flatStroked](https://user-images.githubusercontent.com/9965653/175874617-a90ef305-d460-4887-927c-0ddecfe45975.gif)

To add border on a flat button, add `border`

```dart
NeoPopButton(
    color: const Color.fromRGBO(0, 0, 0, 1),
    buttonPosition: Position.center,
    onTapUp: () {},
    border: const Border.fromBorderSide(
        BorderSide(color: kBorderColorWhite, width: kButtonBorderWidth),
    ),
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
                Text("Pay Now", style: TextStyle(color: Colors.white)),
            ],
        ),
    ),
),
```

## Elevated Strokes

![Elevated Strokes](https://user-images.githubusercontent.com/9965653/172597473-630c86b9-574d-4f65-afeb-171c5ec147cc.png "Elevated Strokes")
![elevatedStroked](https://user-images.githubusercontent.com/9965653/175874610-3e92e9e9-cbed-4906-a90b-423c615e465d.gif)

```dart
NeoPopButton(
    color: kSecondaryButtonLightColor,
    bottomShadowColor: ColorUtils.getVerticalShadow(kBorderColorGreen).toColor(),
    rightShadowColor: ColorUtils.getHorizontalShadow(kBorderColorGreen).toColor(),
    animationDuration: kButtonAnimationDuration,
    depth: kButtonDepth,
    onTapUp: () {},
    border: Border.all(
        color: kBorderColorGreen,
        width: kButtonBorderWidth,
    ),
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
                Text("Scan & Pay", style: TextStyle(color: Colors.white)),
            ],
        ),
    ),
),
```  

## Adjacent Buttons

![Adjacent Buttons](https://user-images.githubusercontent.com/58745044/176997736-e93eae47-caa7-4905-a678-5e6eba0ac70f.jpg "Adjacent Buttons")

### Vertically Aligned Buttons

```dart
Column(
    mainAxisSize: MainAxisSize.min,
    children: [
        NeoPopButton(
        color: kSecondaryButtonLightColor,
        bottomShadowColor: kShadowColorDarkGreen,
        rightShadowColor: kShadowColorGreen,
        buttonPosition: Position.fullBottom,
        onTapUp: () {},
        border: Border.all(
            color: kBorderColorGreen, width: kButtonBorderWidth,
        ),
        child:  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                    child: Text(
                    "Button",
                    style: TextStyle(color: Colors.white),
                ),
            ),
        ),
        NeoPopButton(
            color: kPrimaryButtonColor,
            buttonPosition: Position.fullBottom,
            onTapUp: () {},
            child:  const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
                child: Text("Button"),
            ),
        ),
    ],
),
```

### Horizontally Aligned Buttons

```dart
Row(
    mainAxisSize: MainAxisSize.min,
    children: [
        Expanded(
        child: NeoPopButton(
            color: kPrimaryButtonColor,
            buttonPosition: Position.fullBottom,
            depth: kButtonDepth,
            onTapUp: () {},
            child: const Center(
            child:  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 15.0),
                    child: Text("Button"),
                    ),
                ),
            ),
        ),
        Expanded(
            child: NeoPopButton(
                color: kSecondaryButtonLightColor,
                bottomShadowColor: kShadowColorDarkGreen,
                rightShadowColor: kShadowColorGreen,
                buttonPosition: Position.fullBottom,
                depth: kButtonDepth,
                onTapUp: () {},
                border: Border.all(
                    color: kBorderColorGreen, width: kButtonBorderWidth,
                ),
                child: const Center(
                child: Padding(
                    padding: EdgeInsets.symmetric( horizontal: 8.0, vertical: 15.0),
                    child: Text(
                            "Button",
                            style: TextStyle(color: Colors.white),
                        ),
                    ),
                ),
            ),
        ),
    ],
),
```

## NeoPopButton Attributes

| Attribute            | Type             | Description                                                                           |
| :------------------- | :--------------- | :------------------------------------------------------------------------------------ |
| `child`              | `Widget`         | The child of button widget                                                            |
| `color`              | `Color`          | Color of the button                                                                   |
| `depth`              | `double`         | The depth of the button if it is elevated                                             |
| `onTapUp`            | `VoidCallback?`  | Callback triggered when the forward & reverse button animation is finished            |
| `onTapDown`          | `VoidCallback?`  | Callback triggered as soon as the user clicks the `enabled` button                    |
| `onLongPress`        | `VoidCallback?`  | Callback triggered when user has long pressed the cta                                 |
| `disabledColor`      | `Color`          | Color of the button when it is disabled                                               |
| `parentColor`        | `Color`          | Button's immediate ancestor's color                                                   |
| `grandparentColor`   | `Color`          | Button's second level ancestor's color                                                |
| `buttonPosition`     | `Position`       | The position of button in reference to parent view. `default - Position.fullBottom`   |
| `animationDuration`  | `Duration`       | Animation duration of the button click. `default - const Duration(milliseconds: 50)`  |
| `forwardDuration`    | `Duration?`      | If you want different forward duration for button click, use forwardDuration          |
| `reverseDuration`    | `Duration?`      | If you want different reverse duration for button click, use reverseDuration          |
| `border`             | `Border?`        | The border to be painted around the button                                            |
| `enabled`            | `bool`           | If set to `false`, the button will be disabled. `default - true`                      |
| `shadowColor`        | `Color?`         | The base color of the shadow. The shadow colors will be derived from this             |
| `rightShadowColor`   | `Color?`         | The color of the right shadow.                                                        |
| `leftShadowColor`    | `Color?`         | The color of the left shadow.                                                         |
| `topShadowColor`     | `Color?`         | The color of the top shadow.                                                          |
| `bottomShadowColor`  | `Color?`         | The color of the bottom shadow.                                                       |

<br>

# NeoPopTiltedButton

![NeoPopTiltedButton](https://user-images.githubusercontent.com/58745044/176997116-89e1de77-f903-4051-8145-012f3af1fe7d.jpg "NeoPopTiltedButton")


## Non Floating

![Non Floating](https://user-images.githubusercontent.com/9965653/172599904-75d12903-f490-47d6-b8df-39adc9ef058e.png "Non Floating")
![tiltNonFloating](https://user-images.githubusercontent.com/9965653/175874607-e8e10326-1d6d-4b7d-be8f-50cc8f37ee14.gif)

```dart
 NeoPopTiltedButton(
    color: kPrimaryButtonColor,
    onTapUp: () {},
    child: Padding(
        padding: const EdgeInsets.symmetric(
        horizontal: 80.0,
        vertical: 15,
        ),
        child: SvgPicture.asset('assets/svg/cta_text_view.svg'),
    ),
),
```

##  Floating

![Floating](https://user-images.githubusercontent.com/9965653/172599406-6da2d3a4-06ff-4a74-bd6a-988b36a59159.png "Floating")
![tiltFloating](https://user-images.githubusercontent.com/9965653/175874595-86cc0725-df20-4ab3-b432-a6110d4c97c4.gif)

```dart
NeoPopTiltedButton(
    isFloating: true,
    onTapUp: () => HapticFeedback.vibrate(),
    onTapDown: () => HapticFeedback.vibrate(),
    decoration: const NeoPopTiltedButtonDecoration(
        color: kPopYellowColor,
        plunkColor: kPlunkColorYellow,
        shadowColor: kTiltedButtonShadowColor,
    ),
    child: Padding(
        padding: const EdgeInsets.symmetric(
        horizontal: 70.0,
        vertical: 15,
        ),
        child: SvgPicture.asset('assets/svg/cta_text_play_now.svg'),
    ),
),
```

## Strokes

![Strokes](https://user-images.githubusercontent.com/9965653/172600281-53eec23d-3596-470e-95ed-dc93ebef82bb.png "Strokes")
![TiltStroked](https://user-images.githubusercontent.com/9965653/175874601-91a27b7d-9e1b-4148-9a26-b9c9245e7a05.gif)

```dart
NeoPopTiltedButton(
    isFloating: true,
    onTapUp: () {},
    decoration: const NeoPopTiltedButtonDecoration(
        color: Color(0xFF0D0D0D),
        plunkColor: Color(0xFF3F6915),
        shadowColor: Colors.black,
        border: Border.fromBorderSide(
        BorderSide(color: Color(0xFF8DD04A), width: 1),
        ),
    ),
    child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 15),
        child: Text('Play Now', style: TextStyle(color: Colors.white)),
    ),
),
```

## Shimmer

![shimmer](https://user-images.githubusercontent.com/9965653/175874574-99f209f2-2d14-458b-9f92-959e6aabf112.gif)

```dart 
NeoPopTiltedButton(
    isFloating: true,
    onTapUp: () {},
    decoration: const NeoPopTiltedButtonDecoration(
        color: Color.fromRGBO(255, 235, 52, 1),
        plunkColor: Color.fromRGBO(255, 235, 52, 1),
        shadowColor: Color.fromRGBO(36, 36, 36, 1),
        showShimmer: true,
    ),
    child: const Padding(
        padding: EdgeInsets.symmetric(
        horizontal: 70.0,
        vertical: 15,
        ),
        child: Text('Play Now'),
    ),
),
```

## NeoPopTiltedButton Attributes

| Attribute           | Type                            | Description                                                                                                                                                                                                                                       |
| :------------------ | :------------------------------ | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `child`             | `Widget`                        | The child of the button                                                                                                                                                                                                                           |
| `color`             | `Color?`                        | Color of the button                                                                                                                                                                                                                               |
| `decoration`        | `NeoPopTiltedButtonDecoration?` | The decoration to paint the button. The `color` and `decoration` arguments cannot both be supplied, since it would potentially result in the decoration drawing over the background color. To supply a decoration with a color, use `decoration`. |
| `buttonDepth`       | `double?`                       | The depth of the tilted button. `default: 8.0`                                                                                                                                                                                                    |
| `onTapUp`           | `VoidCallback?`                 | A callback triggered when a pointer that will trigger a tap with button has stopped contacting the screen                                                                                                                                         |
| `onTapDown`         | `VoidCallback?`                 | A callback triggered when a pointer that might cause a tap with button has contacted the screen                                                                                                                                                   |
| `shadowDistance`    | `double?`                       | The maximum distance from the button at which the shadow is painted. `default: 20`                                                                                                                                                                |
| `yPosFactor`        | `double?`                       | Factor that defines the floating positions of buttons and shadow along vertical-axis. `default: 5`                                                                                                                                                |
| `isFloating`        | `bool`                          | Whether the button is floating. `default: false`                                                                                                                                                                                                  |
| `floatingDuration`  | `Duration?`                     | The duration of the floating animation. One floating cycle i.e to-and-fro movement of the button and shadow accounts for two floating durations. `default: Duration(milliseconds: 1500)`                                                          |
| `floatingDelay`     | `Duration?`                     | The delay between two floating cycles. `default: Duration(milliseconds: 750)`                                                                                                                                                                     |
| `tapDuration`       | `Duration?`                     | The duration of the animation when button is pressed or released. `default: Duration(milliseconds: 100)`                                                                                                                                          |
| `enabled`           | `bool`                          | Whether the button is enabled. `default: true`                                                                                                                                                                                                    |

<br>

## Contributing

Pull requests are welcome! We'd love help improving this library. Feel free to browse through open issues to look for things that need work. If you have a feature request or bug, please open a new issue so we can track it.

## License

```
Copyright 2022 Dreamplug Technologies Private Limited.  
  
Licensed under the Apache License, Version 2.0 (the "License");  
you may not use this file except in compliance with the License.  
You may obtain a copy of the License at  
  
 http://www.apache.org/licenses/LICENSE-2.0  
Unless required by applicable law or agreed to in writing, software  
distributed under the License is distributed on an "AS IS" BASIS,  
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  
See the License for the specific language governing permissions and  
limitations under the License.  
```
