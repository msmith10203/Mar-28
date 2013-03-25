//
//  View.m
//  Video
//
//  Created by NYU User on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor yellowColor];
		button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        
		//Center the button in the view.
		CGSize s = CGSizeMake(200, 40);	//size of button
		CGRect b = self.bounds;
        
		button.frame = CGRectMake(
                                  b.origin.x + (b.size.width - s.width) / 2,
                                  b.origin.y + (b.size.height - s.height) / 2,
                                  s.width,
                                  s.height
                                  );
        
		[button setTitleColor: [UIColor redColor]
                     forState: UIControlStateNormal];
        
		[button setTitle: @"Fred Ott’s Sneeze"
                forState: UIControlStateNormal];
        
		[button addTarget: [UIApplication sharedApplication].delegate
                   action: @selector(touchUpInside:)
         forControlEvents: UIControlEventTouchUpInside
         ];
		
		[self addSubview: button];
	}
	return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */

@end
