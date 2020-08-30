//
//  ViewController.m
//  Quiz
//
//  Created by Suzy Lee on 8/21/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

// Keeps track of which question the user is on
@property (nonatomic) int currentQuestionIndex;

// Remember: It's good practice to set "copy" attribute for
// properties that have mutable subclasses
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end

@implementation QuizViewController

/**
 initWithNibName is called when initializing the ViewController instance. It is called before
 (or potentially way before, depending on how many views the app has) before )viewDidLoad.
 
 You are recommended to put memory-intensive setup in viewDidLoad in order to maximize
 lazyloading functionality; otherwise, the app will have to complete all of the tasks in initWithNibName
 for all instantiated views. viewDidLoad is only triggered when the specified ViewController instance
 is successfully loaded onto the screen that the user is viewing.
 */
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
//    if (self) {
//        self.questions = @[
//            @"From what is cognac made?",
//            @"What is 7:7?",
//            @"What is the capital of Vermont?"
//        ];
//        
//        self.answers = @[
//            @"Grapes",
//            @"14",
//            @"Montpelier"
//        ];
//        
//        self.currentQuestionIndex = 0;
//    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.questions = @[
        @"From what is cognac made?",
        @"What is 7:7?",
        @"What is the capital of Vermont?"
    ];
    
    self.answers = @[
        @"Grapes",
        @"14",
        @"Montpelier"
    ];
    
    self.currentQuestionIndex = 0;
}

- (IBAction)showQuestion:(id)sender {
    
    self.currentQuestionIndex++;
    // Wrap to first question if out of bounds
    if (_currentQuestionIndex >= [self.questions count]) {
        self.currentQuestionIndex = 0;
    }
    
    NSLog(@"currentQuestionIndex: %d", self.currentQuestionIndex);
    
    self.questionLabel.text = [self.questions objectAtIndex:self.currentQuestionIndex];
    
}

- (IBAction)showAnswer:(id)sender {
    NSString *currAnswer = [self.answers objectAtIndex:self.currentQuestionIndex];
    
    self.answerLabel.text = currAnswer;
}

@end
