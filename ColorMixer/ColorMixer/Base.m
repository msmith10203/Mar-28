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
#import "ImageView.h"

@implementation BaseView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor redColor];
        NSString *text = @"  Screen Color Picker ";
        CGRect b = self.bounds;
        UIFont *font = [UIFont italicSystemFontOfSize: 32];
        CGSize size = [text sizeWithFont: font];
        
        CGRect f = CGRectMake(0, 0, size.width, size.height);
        label = [[UILabel alloc] initWithFrame: f];
        label.font = font;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.text = text;
        [self addSubview: label];
        NSString *text2 = @"  Swipe to begin or click image";
        UIFont *font2 = [UIFont italicSystemFontOfSize: 16];
        CGSize size2 = [text2 sizeWithFont: font2];
        CGRect f2 = CGRectMake(
                              b.origin.x + (b.size.width - size2.width) / 2,
                              b.origin.y + (b.size.height - size2.height) / 2-40,
                              size2.width,
                              size2.height
                              );
        label2 = [[UILabel alloc] initWithFrame: f2];
        label2.font = font2;
        label2.backgroundColor = [UIColor clearColor];
        label2.textColor = [UIColor whiteColor];
        label2.text = text2;
        [self addSubview: label2];
        CGRect fImage = CGRectMake(110, 250, 98, 105);
        imageView = [[ImageView alloc] initWithFrame: fImage];
        [self addSubview: imageView];
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
- (void) resetSwitchInApp: (MixAppDelegate*) app
{
    app.view.mySwitch.on=false;
    app.view.backgroundColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1.0];
    app.red = 0;
    app.blue = 0;
    app.green = 0;
    app.view.greenSlider.value=0.0;
    app.view.redSlider.value=0.0;
    app.view.blueSlider.value=0.0;
}
- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView: self];
        if ((point.x > 110) && (point.x < 110+98) && (point.y > 250) && (point.y < 250 + 105)){
            MixAppDelegate *app = [UIApplication sharedApplication].delegate;
            [self.window addSubview: app.view];
            [self.window makeKeyAndVisible];
            //[self resetSwitchInApp:app];
        }
    }
}
- (void) swipe: (UISwipeGestureRecognizer *) recognizer {
	   
    MixAppDelegate *app = [UIApplication sharedApplication].delegate;
    [self.window addSubview: app.view];
	[self.window makeKeyAndVisible];
    //[self resetSwitchInApp:app];    
	}


- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView: self];
//        imageView.center = point;	//Move the littleView to a new location.
        
    }
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	imageView.backgroundColor = [UIColor yellowColor];
}

- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

/*
- (void) drawRect: (CGRect) rect
{
    // Drawing code

    [UIView animateWithDuration: 5
                          delay: 1
                        options: UIViewAnimationOptionCurveLinear
                     animations: ^{
                         //Move the label far enough to the left
                         //so that it's out of the View.
                         imageView.center = CGPointMake(160, 300);
                     }
                     completion: NULL
     ];
 
}
*/

@end
