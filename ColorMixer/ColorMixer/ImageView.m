//
//  ImageView.m
//  ColorMixer
//
//  Created by Mike Smith on 3/27/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import "ImageView.h"

@implementation ImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    UIImage *image = [UIImage imageNamed: @"orange.jpg"];	//100 by 100
    if (image == nil) {
        NSLog(@"could not find the image");
        return;
    }
    
    CGPoint point = CGPointMake(0,0);
    [image drawAtPoint: point];
    
}


@end
