# Learn iOS Development
Learning the fundamentals of iOS app development so I'm not completely lost when I start working at Google


# Learn iOS Development
- [x] Learn Swift syntax. [Codecademy Track](https://www.codecademy.com/learn/learn-swift)
- [x] Get used to developing iOS apps and using UIKit. [Swift iOS Dev Course](https://www.udemy.com/course/ios-13-app-development-bootcamp)
- [ ] IN PROGRESS Complete a separate Objective C iOS dev course [Objective-C Crash Course for Swift Developers](https://www.udemy.com/course/objectivec/?utm_source=adwords&utm_medium=udemyads&utm_campaign=LongTail_la.EN_cc.ROW&utm_content=deal4584&utm_term=_._ag_77879424134_._ad_437497333833_._kw__._de_c_._dm__._pl__._ti_dsa-1007766171312_._li_1009874_._pd__._&matchtype=b&gclid=EAIaIQobChMIjtHPsvTf6gIVSNiWCh1yTgRjEAAYAiAAEgKvp_D_BwE)
- [ ] Be able to code identical Swift apps in Objective C. [Swift iOS Dev Course](https://www.udemy.com/course/ios-13-app-development-bootcamp)
- [ ] IN PROGRESS. Get re-acquainted with C/C++ [Codecademy Track](https://www.codecademy.com/learn/learn-c-plus-plus)
- [ ] Get used to using YogaKit [YogaKit Tutorial](https://www.raywenderlich.com/530-yoga-tutorial-using-a-cross-platform-layout-engine)
- [ ] Create animated iOS apps using Lottie [Lottie Documentation](https://airbnb.io/lottie/#/ios)
- [ ] Create an app using Texture. [Texture Documentation](https://texturegroup.org/docs/resources.html)

# General iOS Dev Notes
## Useful Xcode Shortcuts
| Command | Functionality|
|:-------:|:------------:|
| ctrl-I  | Re-indent all selected code|

## Useful Visual Studio Shortcuts
| Command | Functionality|
|:-------:|:------------:|

## Constants
- It's common practice to store your constants in a `Constants.swift` file in a struct named `k`. [Here's the origin of this programming notation](https://stackoverflow.com/questions/472103/lower-case-k-in-cocoa/472118#472118). TLDR: `k` stands for "constant" in hungarian notation.

## CocoaPods
Suzy's TLDR: The `npm` or `yarn` of iOS development. Coded in Ruby.

- [How to install a pod to your project video tutorial](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16813288#overview)
1. Navigate to your project and type `pod init` to create a Podfile
2. Open the Podfile with Xcode. Uncomment the second line. You can explicitly specify the iOS version here. Certain third party libraries require higher iOS requirements because they use more recent features
3. Add `pod 'NameOfPod'` as a line nested under `target 'Project Name' do` and before `end`. The relevant page on cocoapods.org will usually give you the exact line to paste in.
4. Type `pod install` into the Terminal. This will install all of the pods that you added to the Podfile in step 3.
5. This will produce an `.xcworkspace` file for you! Work from this instead of the old `.xcodeproj` file. You can easily access your Podfile from this workspace
6. Before using structs/classes/functions depending on the Pods, make sure to import them at the top of the Swift file. `import NameOfPod` Otherwise, the file won't recognize it even if the Pod is installed properly.
- [Potential problems with pod installations](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16813290#overview). 
- Oftentimes you get errors because you did not get the most recent version of the Pod by default; put `pod 'NameOfPod', '~> 0.3.0'` in the PodFile (where 3.0 is replaced with the latest release of the Pod). Then go to the Terminal and re-run `pod install` (you need to reinstall it).
- After running `pod install`, you may get the error message: `...required a higher minimum deployment target`. Check the minimum required platform in the Pod's `.podspec` file (e.g., `s.platform = ios: '10.0'`), then update your local `Podfile` accordingly as explained in step 2.
- Uninstalling Pods: Remove corresponding line from Podfile then run `pod install` again. Terminal will say `Uninstalled 'NameOfPod'`

## Segues (Transitions between different screens) & Navigation Controller Stacks
- [Use performSegue to manually trigger a transition between ViewControllers](https://github.com/codethecoffee/learn-ios/blob/59ced450946ddf6e2cccc329affa5b92f6c2738e/1_ios-dev-bootcamp/section-11...15/section-15/Flash-Chat-iOS13-master/Flash%20Chat%20iOS13/Controllers/RegisterViewController.swift)
- In order to trigger a transition from a button to a screen, you can simply Ctrl click the button and drag it to the destination in the storyboard! No coding required.

## Navigation Controller
- Initializing a navigation controller stack: Select root storyboard (entry point) => Editor => Embed In => Navigation Controller. All of the downstream navigation controllers will get a top nav bar immediately). If you don't do this, all the segues will be modal pop-ups.
- [Pop to root controller](https://github.com/codethecoffee/learn-ios/commit/f0500a880119a565dac1c61aad4ad1b4e41300fe): Takes user all the way back to the root View Controller
-[Hiding the back button from the navbar from specific View Controllers](https://github.com/codethecoffee/learn-ios/commit/29cad36732f33998c281bb17e3a9ebddb3ab173e): TLDR: Add `navigationItem.hidesBackButton = true` inside `viewDidLoad()` function.


## Making an HTTP Request
![Making HTTP Request to Open Weather](images/http_request_ex.png?raw=true)
1. Create a URL
2. Create a URLSession. It's standard practice to pass in [closures](#foo) for URLSession completion handlers.
3. Give URLSession a task.
4. Start the task to trigger the entire networking process
- [Bitcoin API HTTP Request Example](https://github.com/codethecoffee/learn-ios/commit/e7dd199526b7e53e632cb22451519947dea57ac9)

## Security: App Transport Security Error
You will get an "App Transport Security" error, which will block your HTTP (http://) resource load. This is because a third party 
intercepting the API call can see everything, including sensitive information such as your API key! You must make it an (https://) 
connection in order to access the information through a secure connection.

## Decoding and Parsing JSON
- [Open Weather API Call JSON](http://api.openweathermap.org/data/2.5/weather?q=seoul&appid=822ab112f2a3d357a27c9c0ea578659f&units=metric)
- [Weather App JSON Parsing](https://github.com/codethecoffee/learn-ios/commit/382381f61c268ae5d9853d80194f4549a8613633)
- [Bitcoin App JSON Parsing](https://github.com/codethecoffee/learn-ios/commit/33fd202bb24b400441b9c52404dae7ca189b0905)


## DispatchQueue (Async UI Updates)
If you must update the UI based on the results from an asynchronous request that must run in the background (a.k.a. changing contents of a label based on the contents of a API request), you must wrap that operation in a DispatchQueue.main.async
- [Weather API DispatchQueue Example: didUpdateWeather](https://github.com/codethecoffee/learn-ios/commit/808fa16423daf4c806ebce3d5030b66c2377c06d)

## CoreLocation (getting location data of device)
- [CoreLocation Video Lecture](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16253720#overview)
- [Weather app example of getting user location data (one-time)](https://github.com/codethecoffee/learn-ios/commit/be25aa3716cf3dfdfe3c0c17d548c9bcd55f1ab4)

## Timers
- [Implementing typing animation with scheduledTimer](https://github.com/codethecoffee/learn-ios/commit/6d2440347e4f3144f5390966466468ba2c71a191). Note that all the timers start at the same time, thus you need to calculate staggered delay times programatically.

## Firebase
- [Official iOS Firebase Guide](https://firebase.google.com/docs/ios/setup?authuser=0)
- [Setting up iOS App with Firebase Tutorial](https://www.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16813300#overview)
- [List of Firebase Pods](https://firebase.google.com/docs/ios/setup#available-pods): There are a TON of Pods to download. You definitely don't need all of them. Add `pod 'Firebase/Auth'` if you want login functionality and `pod "Firebase/Firestore` for (basic) database functionality.

# Objective-C Specific
## Header (`.h`) and Implementation (`.m`) Files
- [Video lecture](https://www.udemy.com/course/objectivec/learn/lecture/4410912#overview)
- Unlike Swift, Objective-C has header files (`ViewController.h`) and implementation files (`ViewController.m`). Typically, you will put your definition of a class in the .h file and the implementation of it in the .m file.
- When declaring a new Objective-C class, create a new CocoaTouch file in order to automatically have the .h and .m file pairing generated for you.
- Unlike Swift, where the files just automatically "know" all of your class declarations, you must manually import the header files into the `.m` files you want to use them in. e.g., `#import "MyNewStruct.h"`

## Print Statements [`NSLog`]
- `NSLog` is the equivalent of a print statement in Objective-C. It takes a string formatter (string interpolation) as the first parameter, and then the variables after that

## Strings
- Create a new string with string interpolation using `stringWithFormat` 
- Append two strings using `stringByAppendingString`
- String comparisons. Do NOT use equal signs; it's not a safe way to do it. ALWAYS use `[string1 isEqualToString:string2]`. TIP: Add a `!` in front of that if you want to check whether the strings are NOT equal.
- To check for equality while ignoring cases, use `[string1 caseInsensitiveCompare:string2] == NSOrderedSame`. `caseInsensitiveCompare` does not return a boolean (it orders a comparison result object), so make sure to set equality for the specific data result type.

## Numbers
- Do NOT use native C types! Objective-C is built on top of C, so you can technically use native C types like `int`, `float`, and `double`.
- You cannot store native C types into an Objective C array! Objective-C only works with OBJECTS. Use the class `NSNumber`. It can store all the number types.
- If you want to do calculations with those `NSNumber` values, you can access the values and calculate like so: `NS Number *sumNum = [NSNumber numberWithInt: [numInt intValue] + [numInt2 intValue]]`
- You can even get the string representation of an NSNumber using `myInt.stringValue` property.

## Static
- In developer documentation, if the method name is preceded by a `+` it's a static method

## Getters and Setters
- [Obj-C getter and setter crash course lecture notes]()
- Objective-C automatically creates getters and setters for all public properties you define in `.h` (preceded by `@property`). `_propertyName = @"Suzy Lee"`, `[self setPropertyName: @"Suzy Lee"]`, and `self.propertyName = @"Suzy Lee"` all do the same thing - they set the value of `propertyName` to the string literal `@"Suzy Lee"`.
- You can customize the default getters and setters in `.m` (make sure you use the one Objective C created for you). Overwrite the setter like so: `- (propertyType*) propertyName { code }`

## Classes [`@property`]
- Declare an instance of an Objective-C class with the notation: `Human *currHuman = [[Human alloc]init]`

## Pointers
- Pointers hold the memory address where a data object is held. We'll focus on the more practical aspects of Obj-C pointers in the context of iOS development.
- Classes (e.g., NSStrings, NSNumber, custom classes) must use pointers. An object property is declared as `@property (nonatomic, strong) NSString *name;` with an asterisk. When using said property, you must add the `alloc` keyword. `self.name = [[NSString alloc]init]` to DYNAMICALLY allocate enough space for that particular object.
- Native types (e.g., NSInteger, int) do not need pointers. `@property (nonatomic) int age;` You only need to STATICALLY allocate space for it.

## Strings


# Swift Specific 
## Miscellaneous Syntax
- [Stored properties v.s. Computed properties](https://github.com/codethecoffee/learn-ios/blob/583e254297d4469977a5dc1def56d05d44582fb1/1_ios-dev-bootcamp/section-11...15/section-13/Clima-iOS13-master/Clima/Model/WeatherModel.swift)
-[Static properties v.s. instance properties (and also static methods!)](https://github.com/codethecoffee/learn-ios/blob/8ad9e7a5458168be4bd46433691d91eaf6684ee6/1_ios-dev-bootcamp/section-11...15/section-15/Static%20Properties.playground/Contents.swift): It's convention to use static properties in a struct as your constants file

## Optionals
- [Example of Optional Chaining](https://github.com/codethecoffee/learn-ios/commit/14fb7dbdadc2c9909acaacf85bbe78233d5398b0): Prevents code block from executing unless all of the chained optionals are not nil. In this case, authentication is triggered only if there are valid inputs to the username and password field.


## Swift Protocols & Delegates
- [Why relying on class inheritance can get messy.](https://github.com/codethecoffee/learn-ios/blob/9f03ac9e9e6ce1262b44c4075801f44275fb5335/1_ios-dev-bootcamp/section-11...15/section-13/Protocols%20Demo/Protocols%20Demo/why%20we%20need%20protocols.swift)
- [Using protocols to clean up the flyingMuseum example](https://github.com/codethecoffee/learn-ios/blob/82581a54c031d2d633a2f507332c927a12b2107f/1_ios-dev-bootcamp/section-11...15/section-13/Protocols%20Demo/Protocols%20Demo/main.swift)

![Delegate design pattern diagram](images/delegate_design_pattern.png?raw=true)
- [Example of Our Own Protocol and Delegate (Hospital Ex)](https://github.com/codethecoffee/learn-ios/blob/925e8eadc646b6ffd19e035de4776fb379cbac62/1_ios-dev-bootcamp/section-11...15/section-13/Protocols%20and%20Delegates/Protocols%20and%20Delegates/main.swift)

## Swift Closures (a.k.a. Anonymous Functions)
Unnamed blocks of functionality (also called anonymous functions) that you can pass around. Swift's equivalent of [Objective-C blocks](https://www.tutorialspoint.com/objective_c/objective_c_blocks.htm)
- [Examples of using Closures](https://github.com/codethecoffee/learn-ios/blob/c0b17c1bbc1fb70335da028348b032098b53df75/1_ios-dev-bootcamp/section-11...15/section-13/Closures.playground/Contents.swift)
- [Commit where I refactor a handler into a closure](https://github.com/codethecoffee/learn-ios/commit/36bb8221797b736fee7f7dc1c538917e40dde8df)

## Swift Extensions
Allows us to add additional functionality to our existing classes, structs, protocols, and other data types without ripping into the original code.
- [Swift Extensions Lecture Notes and Examples](https://github.com/codethecoffee/learn-ios/blob/dbf45947b625569569cdfee7b95b1c4b6e48c0eb/1_ios-dev-bootcamp/section-11...15/section-13/Extensions.playground/Contents.swift). Shows how you can extend native Swift data types (Double), UIKit elements (UIBUtton), and protocols (add default implementation of a protocol method).
- [Refactor view controller code using protocol extensions](https://github.com/codethecoffee/learn-ios/commit/4aa3475a93943bb651f50d6e8c86eb253c8cca92). It can get messy to chain multiple extensions to a class/struct definition. We can split it up and organize the delegate functions by using protocol extensions.
