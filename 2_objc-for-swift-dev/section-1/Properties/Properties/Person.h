//
//  Person.h
//  Properties
//
//  Created by Suzy Lee on 7/28/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : UIViewController
// This is where you define your instance variables that are PRIVATE.
// You cannot access these outside of the Person class
{
    BOOL isInsecure;
}

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

@end

NS_ASSUME_NONNULL_END
