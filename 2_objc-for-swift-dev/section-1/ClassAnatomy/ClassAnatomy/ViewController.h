//
//  ViewController.h
//  ClassAnatomy
//
//  Created by Suzy Lee on 7/28/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>


// @interface == class.
// We're calling the name of the class ViewController
// The ViewController class inherits from the UIViewController class
@interface ViewController : UIViewController

// Methods and properties that are publicly available to other classes
// will be declared as an @property.
// If you don't want it to be publicly availble (data encapsulation)
// define it in the .m file, and only the class will have access to it
@property (nonatomic, strong) NSString *name;

// @end is where the definition for the ViewController class will end
@end

