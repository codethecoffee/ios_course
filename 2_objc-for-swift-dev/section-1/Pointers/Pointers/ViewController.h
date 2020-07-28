//
//  ViewController.h
//  Pointers
//
//  Created by Suzy Lee on 7/28/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// We are declaring name as a pointer variable.
// We use this on OBJECTS.
@property (nonatomic, strong) NSString *name;

// This is not a pointer variable because it's a native type
// Native types do NOT require pointer variables.
@property (nonatomic) int age;

@property (nonatomic) NSInteger debt;
@property (nonatomic) NSNumber *bankBalance;


@end

