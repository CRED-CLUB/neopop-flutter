# NeoPop
CheeseCake is CRED's inbuilt library for using NeoPop components in your app.

### What really is NeoPop? 
NeoPop was created with one simple goal, to create the next generation of an even more beautiful, more affirmative, design system. neopop stays true to everything that design at CRED stands for.

## Installation
First, add `neopop` as a [dependency in your pubspec.yaml file](https://flutter.dev/using-packages/).

```  
dependencies:
    neopop:
```  

# NeoPop Button
`NeoPopButton` widget gives you mutliple configs that you can use for your widget.

## Plunk
![Plunk Button](/assets/neopop_plunk.jpg "Plunk Button")

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
![Flat Button](/assets/neopop_flat.jpg "Flat Button")

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

```xml  
<club.cred.neopop.PopFrameLayout    
 ...  
 app:neopop_shimmer_duration="5000" 
 app:neopop_shimmer_width="24dp"    
 app:neopop_shimmer_color="#f00"    
 app:neopop_show_shimmer="true"/>  
 ```  
## Flat Strokes
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

## Plunk Strokes
To render strokes on an elevated/plunk button , add
`neopop_is_stroked_button = "true"` and `neopop_stroke_color`
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
```dart
Column(
    children: [
        Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
            _WhiteButton(position: Position.topLeft),
            _BlackButton(position: Position.topCenter),
            _WhiteButton(position: Position.topRight),
        ],
        ),
        Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
            _BlackButton(position: Position.bottomLeft),
            _WhiteButton(position: Position.bottomCenter),
            _BlackButton(position: Position.bottomRight),
        ],
        ),
    ],
),
```

## Shimmer


## All button attributes
| Attribute | Type | Description |  
|--|--|--|  
|`child` | `Widget` | child of button widget |
|`color` |  `Color` | card color |
| `depth` |  `double`, default = `3` | the depth of the button if it is elevated |
| `onTapUp` |  `VoidCallback?` | a callback triggered when the forward & reverse button animation is finished |
| `onTapDown` |  `VoidCallback?` | a callback triggered as soon as the user clicks the `enabled` button |
| `onLongPress` |  `VoidCallback?` | a callback triggered when user has long pressed the cta |
| `disabledColor` |  `Color` |  |
| `parentColor` |  `Color`, default - `Colors.transparent`|  |
| `grandparentColor` |  `Color` |  |
| `buttonPosition` |  `Position`, default - `Position.fullBottom` |  |
| `animationDuration` |  `Duration`, default - `const Duration(milliseconds: 50)` |  |
| `forwardDuration` |  `Duration?` |  |
| `reverseDuration` |  `Duration?` |  |
| `border` |  `Border?` |  |
| `enabled` |  `bool`, default - `true` |  |
| `shadowColor?` |  `Color` |  |
| `rightShadowColor?` |  `Color` |  |
| `leftShadowColor?` |  `Color` |  |
| `topShadowColor?` |  `Color` |  |
| `bottomShadowColor?` |  `Color` |  |


## Contributors

NeoPop would not have been possible if not for the contributions made by CRED's design and frontend teams. Specifically:
- Bharat Sharma — [Github](https://github.com/bharat-1809) | [Linkedin](https://in.linkedin.com/in/bharat-sharma-1809)

## Contributing

Pull requests are welcome! We'd love help improving this library. Feel free to browse through open issues to look for things that need work. If you have a feature request or bug, please open a new issue so we can track it.
