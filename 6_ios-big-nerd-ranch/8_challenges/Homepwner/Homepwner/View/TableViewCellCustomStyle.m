//
//  TableViewCellCustomStyle.m
//  Homepwner
//
//  Created by Suzy Lee on 8/30/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "TableViewCellCustomStyle.h"

@implementation TableViewCellCustomStyle

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    CGRect bounds = [self bounds];
    CGPoint origin = bounds.origin;
    CGSize size = bounds.size;
    
    NSLog(@"width: %f, height: %f", size.width, size.height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
