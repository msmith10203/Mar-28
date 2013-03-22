//
//  View.m
//  MyButton
//
//  Created by Mike Smith on 3/20/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import "View.h"

@implementation View

@synthesize button;		//after @implementation in View.m

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // Initialization code
		self.backgroundColor = [UIColor whiteColor];
        
		button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
		//Center the button in the view.
		CGRect b = self.bounds;
        NSString *text = @" MY BUTTON ";
        UIFont *font = [UIFont italicSystemFontOfSize: 18];
        CGSize textSize = [text sizeWithFont: font];
        CGSize s = [text sizeWithFont: font];                
        button.frame = CGRectMake(
                                  b.origin.x + (b.size.width - s.width) / 2,
                                  b.origin.y + (b.size.height - s.height) / 2,
                                  s.width*1.618,
                                  s.height
                                  );
		[button setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
        [button setTitleColor: [UIColor cyanColor] forState: UIControlStateDisabled];
		[button setTitle: text forState: UIControlStateNormal];
		[button addTarget: [UIApplication sharedApplication].delegate
                   action: @selector(touchUpInside:)
         forControlEvents: UIControlEventTouchDown | UIControlEventTouchDragEnter
         ];        
		[self addSubview: button];
    }
    return self;
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
