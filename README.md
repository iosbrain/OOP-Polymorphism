# OOP Polymorphism
In this Xcode 8.2.1 project built against the iOS 10 SDK, I used Swift 3 to demonstrate the object-oriented programming (OOP) characteristic of **"polymorphism,"** which I've discussed extensively in the articles [here](http://iosbrain.com/blog/2017/02/26/intro-to-object-oriented-principles-in-swift-3-via-a-message-box-class-hierarchy#polymorphism) and [here](http://iosbrain.com/blog/2017/03/07/polymorphism-in-swift-3-manipulate-multiple-related-controls-with-one-iboutlet-and-one-ibaction/). 

In one example of polymorphism, I declare a variable of the UIControl type (parent) and assign it references to several subclasses (child classes) like UITextField, UISlider, UISegmentedControl, and UIStepper. Here's an example:

```swift
var textField : UITextField = UITextField()
var slider : UISlider = UISlider()
var segmented : UISegmentedControl = UISegmentedControl()
var stepper: UIStepper = UIStepper()
 
var myControl : UIControl
 
myControl = textField
myControl.isHighlighted = true
print("I am a \(type(of: myControl)) now.")
 
myControl = slider
myControl.isEnabled = true
print("I am a \(type(of: myControl)) now.")
 
myControl = segmented
myControl.setNeedsLayout()
print("I am a \(type(of: myControl)) now.")
 
myControl = stepper
let insets = stepper.alignmentRectInsets
print("I am a \(type(of: myControl)) now.")
```

As shown above, several descendant object/instance references can be assigned to a reference to the parent class, and yet the parent can exhibit the behavior of the descendant.

In another example -- an exercise in OOP design and development -- I created a simple hierarchical taxonomy of three classes composed of one parent and two children. I used an information/computer network as an example of a real-world system to model in software.

The parent class is the blueprint for the child classes. In other words, it defines some general properties and functionality that would be expected of any information network. The child classes, one modelling a Wi-Fi network, and the other modelling a cellular network, each override the behavior of the parent. They provide functionality specific to the network types they are modelling.

I then demonstrated how to declare a variable of the parent type and assign it references to its child classes. This is an example of **late binding** in which the parent's behavior is determined at runtime, not at compile time, and thus demonstrates polymorphism.

Polymorphism enables you to develop general code that works with groups of related classes instead of developing code for each individual class.

## Xcode 8.2.1 project settings
**To get this project running on the Simulator or a physical device (iPhone, iPad)**, go to the following locations in Xcode and make the suggested changes:

1. Project Navigator -> [Project Name] -> Targets List -> TARGETS -> [Target Name] -> General -> Signing
- [ ] Tick the "Automatically manage signing" box
- [ ] Select a valid name from the "Team" dropdown
  
2. Project Navigator -> [Project Name] -> Targets List -> TARGETS -> [Target Name] -> General -> Identity
- [ ] Change the "com.yourDomainNameHere" portion of the value in the "Bundle Identifier" text field to your real reverse domain name (i.e., "com.yourRealDomainName.Project-Name").
