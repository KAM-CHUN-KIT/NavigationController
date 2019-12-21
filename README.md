# NavigationController

It's not easy to do fancy effect to the navigation bar on iOS. KNavigationController library will provide you a customizable UINavigationController with dynamic colors and alphas for Swift.

## Preview
<img src="Screenshot/ezgif-4-5f6158efdb50.gif" width=350/>

## Setup
You need to inherit the library from KNavigationController:
```
import KNavigationController

class YourNavigationController: NavigationController {
```

Simply set the navigation bar color as your theme color:
```
if let nav = self.navigationController as? NavigationController {
    nav.setBackgroundColor(UIColor.white)
}
```

You may adjust the navigation bar's alpha to do the show and hidden effects when scrolling News feed
```
if let nav = self.navigationController as? NavigationController {
    nav.setNavigationBarVisibility(offset: offset)
}
```

## Requirements
iOS 9.0 or above <br/>
Support Swift 5.0

## Installation
NavigationController is available through CocoaPods. To install it, simply add the following line to your Podfile:

```
pod "KNavigationController"
```

## Author
Mr. Kam Chun Kit

## License
KNavigationController is available under the MIT license. See the LICENSE file for more info.
