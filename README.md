# AMXFontAutoScale
[![Twitter: @amaimescu](https://img.shields.io/badge/contact-%40amaimescu-blue.svg)](https://twitter.com/amaimescu)
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/alexmx/ios-ui-automation-overview/blob/master/LICENSE)

Scale the font for **UILabel** and **UITextView** proportionally across all the screen sizes. Just define the screen size to be used as reference for scaling and the library will update all the instances of the **UILabel** and **UITextView** automatically.

## Usage

#### :earth_africa: Global scale:
```swift
import AMXFontAutoScale

class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        // Scale all the label fonts using the 4 inch screen size as a reference
        UILabel.amx_autoScaleFont(forReferenceScreenSize: .size4Inch)
        
        return true
  }
}
```


iPhone 4 inch | iPhone 4.7 inch | iPhone 5.5 inch
------------ | ------------- | -------------
![Contact List](/assets/iphone-4-inch.png) | ![Contact Details](/assets/iphone-4-7-inch.png) | ![Edit Contact](/assets/iphone-5-5-inch.png)

#### Instance scaling:
```swift
import AMXFontAutoScale

class SomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let someLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        someLabel.amx_autoScaleFont(forReferenceScreenSize: .size4Inch)
    }
}
```

**Note**: The instance scaling overrides the global one if set.

## License
This project is licensed under the terms of the MIT license. See the LICENSE file.
