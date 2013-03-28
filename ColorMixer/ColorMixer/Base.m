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
        
        //Trailing blank to avoid cutting off last letter
        //because italic leans to the right.
        NSString *text2 = @"  Swipe to begin ";
        UIFont *font2 = [UIFont italicSystemFontOfSize: 16];
        CGSize size2 = [text2 sizeWithFont: font2];
        
        CGRect f2 = CGRectMake(
                              b.origin.x + (b.size.width - size2.width) / 2,
                              b.origin.y + (b.size.height - size2.height) / 2-20,
                              size2.width,
                              size2.height
                              );
        label2 = [[UILabel alloc] initWithFrame: f2];
        label2.font = font2;
        label2.backgroundColor = [UIColor clearColor];
        label2.textColor = [UIColor whiteColor];
        label2.text = text2;
        [self addSubview: label2];
        
        
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


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    UIImage *image = [UIImage imageNamed: @"orange.jpg"];	//100 by 100
    if (image == nil) {
        NSLog(@"could not find the image");
        
    }
    
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;        //upper left corner of image
    CGPoint point = CGPointMake(
                                        (w - image.size.width) / 2,
                                        h - image.size.height - 20
                                        );
    
    [image drawAtPoint: point];
}


@end
