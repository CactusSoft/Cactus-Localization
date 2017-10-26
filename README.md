# CactusLocalization

[![CI Status](http://img.shields.io/travis/PoltoraIvana/CactusLocalization.svg?style=flat)](https://travis-ci.org/PoltoraIvana/CactusLocalization)
[![Version](https://img.shields.io/cocoapods/v/CactusLocalization.svg?style=flat)](http://cocoapods.org/pods/CactusLocalization)
[![License](https://img.shields.io/cocoapods/l/CactusLocalization.svg?style=flat)](http://cocoapods.org/pods/CactusLocalization)
[![Platform](https://img.shields.io/cocoapods/p/CactusLocalization.svg?style=flat)](http://cocoapods.org/pods/CactusLocalization)

CactusLocalization is a simple wrapper for NSLocalizedString with a swiftier synthax. It uses the same Localizable.strings file, so you don't need to restructure your project.

## Usage
Import CactusLocalization in the file:

```ruby
import CactusLocalization
```

Then set localized variants of your strings as follows:

```ruby
exampleLabel.text = "some-key-that-is-in-a-strings-file".localized()
```

You can of course specify Bundle name, table name and default value - the same as NSLocalizedString, if you want. Under the hood the method falls back to Base.lproj, and then to the value provided in case translation wasn't found.


## Installation

CactusLocalization is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CactusLocalization'
```

## Author

PoltoraIvana, ivan.sobolevskiy@cactussoft.biz

## License

CactusLocalization is available under the MIT license. See the LICENSE file for more info.
