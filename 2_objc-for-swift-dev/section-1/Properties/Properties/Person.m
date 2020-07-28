//
//  Person.m
//  Properties
//
//  Created by Suzy Lee on 7/28/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "Person.h"

@interface Person ()

@end

@implementation Person

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)test {
    self.firstName = @"Bob";
    // You need an underscore to access a public property. WHY THO?
    // A property actually creates an instance variable under the hood that
    // is called _thePropertyName
    _firstName = @"Suzy";
    
    // See how we can access our private instance variable since we're
    // inside the person.
    isInsecure = YES;
    
    // Objective-C automatically creates getters and setters for public
    // properties. No need to manually create it.
    [self setLastName: @"Maloney"];
    
}

@end
