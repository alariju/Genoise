# Genoise
[![Build Status](https://travis-ci.org/alariju/Genoise.svg?branch=master)](https://travis-ci.org/alariju/Genoise)
[![Version](https://img.shields.io/cocoapods/v/Genoise.svg?style=flat)](http://cocoapods.org/pods/Genoise)
[![License](https://img.shields.io/cocoapods/l/Genoise.svg?style=flat)](http://cocoapods.org/pods/Genoise)
[![Platform](https://img.shields.io/cocoapods/p/Genoise.svg?style=flat)](http://cocoapods.org/pods/Genoise)

Genoise is a light-weight pod to help you checking if there's an update available for your application.
You only need your **application's id** that you can get on your iTunes Connect dashboard.

_travis ci is left to be made._

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation and usage

Genoise is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Genoise"
```

## Swift Usage

After running a **pod install** just import Genoise on your Swift class, and initialize Genoise and make the call:

	import Genoise
    
    Genoise.initializeWithApplicationId("YOUR_APP_ID")
    Genoise.isOutdated {
    	isOutdated, whatsNew in
        if isOutdated {
        	#There's an update available
            #The new vewsion details are available on whatsNew (String)
        } else {
        	#Your app is up-to-date!
        }
    }

## Objective-C Usage

You can just add the **Genoise.swift** file to your project, and create a Bridging Header. Then, do the same as Swift's:

	#import "PROJECT_NAME-Swift.h"
    
    ...
    
    - (void) exampleMethod {
    	[Genoise initializeWithApplicationId: @"YOUR_APP_ID"];
        [Genoise isOutdated:^(BOOL isOutdated, NSString * _Nonnull whatsNew) {
        if (isOutdated) {
        	#There's an update available
            #The new vewsion details are available on whatsNew (String)
        } else {
	        #Your app is up-to-date!
        }
    }];
    }

## Author

alariju, albin.arias16@gmail.com

## License

Genoise is available under the MIT license. See the LICENSE file for more info.
