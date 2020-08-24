//
//  EMLHypnosisViewController.m
//  HypnoNerd
//
//  Created by Suzy Lee on 8/24/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "EMLHypnosisViewController.h"
#import "EMLHypnosisView.h"

@interface EMLHypnosisViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentView;

@end

@implementation EMLHypnosisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Hyponsis view is loaded!");
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/**
 Set the root of the view controller as an instance of the EMLHypnosisView
 */
- (void)loadView {
    EMLHypnosisView *backgroundView = [[EMLHypnosisView alloc] init];
    self.view = _segmentView;
    [self.view addSubview:_segmentView];
}
- (IBAction)changeCircleColor:(UISegmentedControl *)sender {
    
    NSLog(@"Selected color: %ld", (long)sender.selectedSegmentIndex);
    
}

@end
