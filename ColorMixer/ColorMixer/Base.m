//
//  Base.m
//  ColorMixer
//
//  Created by Mike Smith on 3/26/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import "MixAppDelegate.h"
#import "View.h"
#import "Base.h"

@implementation BaseView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor blueColor];
      
        
        //Trailing blank to avoid cutting off last letter
        //because italic leans to the right.
        NSString *text = @"  Screen Color Picker ";
        
        CGRect b = self.bounds;
        UIFont *font = [UIFont italicSystemFontOfSize: 32];
        CGSize size = [text sizeWithFont: font];
        
        CGRect f = CGRectMake(
                              0,
                              0,
                              size.width,
                              size.height
                              );
        
        label = [[UILabel alloc] initWithFrame: f];
        label.font = font;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.text = text;
        [self addSubview: label];
        
        UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc]
                                                initWithTarget: self action: @selector(swipe:)
                                                ];
		recognizer.direction = UISwipeGestureRecognizerDirectionRight;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionUp;
		[self addGestureRecognizer: recognizer];
        
		recognizer = [[UISwipeGestureRecognizer alloc]
                      initWithTarget: self action: @selector(swipe:)
                      ];
		recognizer.direction = UISwipeGestureRecognizerDirectionDown;
		[self addGestureRecognizer: recognizer];
        
    }
    return self;
}

- (void) swipe: (UISwipeGestureRecognizer *) recognizer {
	   
    MixAppDelegate *app = [UIApplication sharedApplication].delegate;
    
    
    //[self.window removeFromSuperview: app.baseView];
    [self.window addSubview: app.view];
	[self.window makeKeyAndVisible];

    
    
	}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
