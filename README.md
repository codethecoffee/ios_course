# Learn iOS Development
Learning the fundamentals of iOS app development so I'm not completely lost when I start working at Google


## Checklist of Tasks
- [x] Learn Swift syntax. [Codecademy Track](https://www.codecademy.com/learn/learn-swift)
- [ ] IN PROGRESS. Get used to developing iOS apps and using UIKit. [Swift iOS Dev Course](https://www.udemy.com/course/ios-13-app-development-bootcamp)
- [ ] Be able to code identical Swift apps in Objective C. [Swift iOS Dev Course](https://www.udemy.com/course/ios-13-app-development-bootcamp)
- [ ] Complete a separate Objective C iOS dev course [Objective-C Crash Course for Swift Developers](https://www.udemy.com/course/objectivec/?utm_source=adwords&utm_medium=udemyads&utm_campaign=LongTail_la.EN_cc.ROW&utm_content=deal4584&utm_term=_._ag_77879424134_._ad_437497333833_._kw__._de_c_._dm__._pl__._ti_dsa-1007766171312_._li_1009874_._pd__._&matchtype=b&gclid=EAIaIQobChMIjtHPsvTf6gIVSNiWCh1yTgRjEAAYAiAAEgKvp_D_BwE)
- [ ] IN PROGRESS. Get re-acquainted with C/C++ [Codecademy Track](https://www.codecademy.com/learn/learn-c-plus-plus)
- [ ] Get used to using YogaKit [YogaKit Tutorial](https://www.raywenderlich.com/530-yoga-tutorial-using-a-cross-platform-layout-engine)
- [ ] Create animated iOS apps using Lottie [Lottie Documentation](https://airbnb.io/lottie/#/ios)
- [ ] Create an app using Texture. [Texture Documentation](https://texturegroup.org/docs/resources.html)

## General iOS Dev Notes
### Useful Xcode Shortcuts
| Command | Functionality|
|:-------:|:------------:|
| ctrl-I  | Re-indent all selected code|

### The General Networking Process
1. Create a URL
2. Create a URLSession. It's standard practice to pass in [closures](#foo) for URLSession completion handlers.
3. Give URLSession a task.
4. Start the task to trigger the entire networking process

### Security: App Transport Security Error
You will get an "App Transport Security" error, which will block your HTTP (http://) resource load. This is because a third party 
intercepting the API call can see everything, including sensitive information such as your API key! You must make it an (https://) 
connection in order to access the information through a secure connection.

### Decoding and Parsing JSON
- [Open Weather API Call JSON](http://api.openweathermap.org/data/2.5/weather?q=seoul&appid=822ab112f2a3d357a27c9c0ea578659f&units=metric)
- [Commit where I implement JSON Decoding](https://github.com/codethecoffee/learn-ios/commit/382381f61c268ae5d9853d80194f4549a8613633)



## Swift Specific 
### Swift Protocols & Delegates
- [Why relying on class inheritance can get messy.](https://github.com/codethecoffee/learn-ios/blob/9f03ac9e9e6ce1262b44c4075801f44275fb5335/1_ios-dev-bootcamp/section-11...15/section-13/Protocols%20Demo/Protocols%20Demo/why%20we%20need%20protocols.swift)
- [Using protocols to clean up the flyingMuseum example](https://github.com/codethecoffee/learn-ios/blob/82581a54c031d2d633a2f507332c927a12b2107f/1_ios-dev-bootcamp/section-11...15/section-13/Protocols%20Demo/Protocols%20Demo/main.swift)

![Delegate design pattern diagram](images/delegate_design_pattern.png?raw=true)
- [Example of Our Own Protocol and Delegate (Hospital Ex)](https://github.com/codethecoffee/learn-ios/blob/925e8eadc646b6ffd19e035de4776fb379cbac62/1_ios-dev-bootcamp/section-11...15/section-13/Protocols%20and%20Delegates/Protocols%20and%20Delegates/main.swift)

### Swift Closures (a.k.a. Anonymous Functions)
Unnamed blocks of functionality (also called anonymous functions) that you can pass around. Swift's equivalent of [Objective-C blocks](https://www.tutorialspoint.com/objective_c/objective_c_blocks.htm)
- [Examples of using Closures](https://github.com/codethecoffee/learn-ios/blob/c0b17c1bbc1fb70335da028348b032098b53df75/1_ios-dev-bootcamp/section-11...15/section-13/Closures.playground/Contents.swift)
- [Commit where I refactor a handler into a closure](https://github.com/codethecoffee/learn-ios/commit/36bb8221797b736fee7f7dc1c538917e40dde8df)