# AMXFontAutoScale
[![Twitter: @amaimescu](https://img.shields.io/badge/contact-%40amaimescu-blue.svg)](https://twitter.com/amaimescu)
[![License](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/alexmx/ios-ui-automation-overview/blob/master/LICENSE)

Scale the font for **`UILabel`** and **`UITextView`** proportionally across all the screen sizes. Just define the screen size to be used as reference for scaling and the library will update all the instances of the **`UILabel`** and **`UITextView`** automatically.

## Usage

1) Set the **`UILabel`** or **`UITextView`** font using `Interface Builder` or the `font` property directly.
2) Define for which **labels** and **text views** the font should be auto scaled. Check the examples below for more details.
3) Define the reference screen size to be used for scaling. Your original font size will match exactly the chosen reference screen size and will be scaled up or down for other screen sizes.
3) Enjoy the magic!

iPhone 4 inch | iPhone 4.7 inch | iPhone 5.5 inch
------------ | ------------- | -------------
![Contact List](/assets/iphone-4-inch.png) | ![Contact Details](/assets/iphone-4-7-inch.png) | ![Edit Contact](/assets/iphone-5-5-inch.png)

## Usage examples

#### Define auto scaling for one instance

Define the reference screen size for a specific label. Different instances can have different reference screen sizes defined:

```swift
import AMXFontAutoScale

class SomeViewController: UIViewController {
    
    @IBOutlet var someLabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        someLabel.amx_autoScaleFont(forReferenceScreenSize: .size4Inch)
    }
}
```

#### Define auto scaling for multiple instances

In practice most of the instances will share the same reference screen size, so it is inconvenient to set it per instance.
You can define the global reference screen size and just enable the auto scaling for particular instances:

```swift
import AMXFontAutoScale

class SomeViewController: UIViewController {
    
    @IBOutlet var someLabel1
    @IBOutlet var someLabel2
    @IBOutlet var someLabel3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
	UILabel.amx_referenceScreenSize = .size4Inch
	
        someLabel1.amx_autoScaleEnabled = true
	someLabel2.amx_autoScaleEnabled = true
	someLabel3.amx_autoScaleEnabled = true
    }
}
```

Or using the Interface Builder:

![Interface Builder](/assets/interface-builder.png)


#### :earth_africa: Define global auto scaling

⚠️ - Be careful when using this one as it literally scales all the instances of **`UILabel`** and **`UITextView`** from your app, even the unobvious labels or text views in the system controls and components.

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
Note: The instance scaling overrides the global one if set.

#### Disable scaling for some instances when global scaling is enabled

```swift
import AMXFontAutoScale

class SomeViewController: UIViewController {
    
    @IBOutlet var someLabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Global font scaling is enabled
	UILabel.amx_autoScaleFont(forReferenceScreenSize: .size4Inch)
	
        // Font scaling for someLabel is disabled
	// Alternatively you can disable it using the Interface Builder 
        someLabel.amx_autoScaleEnabled = false
    }
}
```

#### Handle manually font size updates

Get a closure called every time the font should be updated. Might be convenient when defining the fonts for the attributed strings:

```swift
import AMXFontAutoScale

class SomeViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        someLabel.amx_fontSizeUpdateHandler = { originalSize, preferredSize, multiplier in
	    // E.g. Compute the new fonts for the attributed text
        }
    }
}
```

## Installation

#### CocoaPods

If you are using **CocoaPods**, you can as well use it to integrate the library by adding the following lines to your `Podfile`.

```ruby
use_frameworks!

target 'YourAppTarget' do
    pod "AMXFontAutoScale"
end

```

#### Carthage

If you are using **Carthage**, you can always use it to build the library within your workspace by adding the line below to your `Cartfile`.

```
github "alexmx/AMXFontAutoScale"
```

#### Manual installation

In order to include the **AMXFontAutoScale** library into your project, you need to build a dynamic framework from provided source code and include it into your project, or include the entire **AMXFontAutoScale** library as sub-project by copying it to your project directory or include as git submodule.

## License
This project is licensed under the terms of the MIT license. See the LICENSE file.
