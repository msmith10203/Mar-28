//
//  View.m
//  Note
//
//  Created by NYU User on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"
#import "NoteAppDelegate.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor yellowColor];
	}
    
    device = [UIDevice currentDevice];
    NoteAppDelegate *app = [UIApplication sharedApplication].delegate;
	app.center = [NSNotificationCenter defaultCenter];
    
	//Send the setNeedsDisplay message to the view
	//when we get a OrientationDidChange notification from the device.
    
	[app.center addObserver: self
               selector: @selector(setNeedsDisplay)
                   name: UIDeviceOrientationDidChangeNotification
                 object: device
     ];
    
	[device beginGeneratingDeviceOrientationNotifications];
	return self;
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	// Drawing code
	NSArray *a = [NSArray arrayWithObjects:
                  @"Unknown",
                  @"Portrait",
                  @"PortraitUpsideDown",
                  @"LandscapeRight",	//home button on right
                  @"LandscapeLeft",	//home button on left
                  @"FaceUp",
                  @"FaceDown",
                  nil
                  ];
    
	NSUInteger i = [UIDevice currentDevice].orientation;
	NSString *string = [a objectAtIndex: i];
	UIFont *font = [UIFont systemFontOfSize: 32];
	[string drawAtPoint: CGPointZero withFont: font];
}

- (void) dealloc {
    NoteAppDelegate *app = [UIApplication sharedApplication].delegate;
	app.center = [NSNotificationCenter defaultCenter];
    [app.center removeObserver:self];
	[device endGeneratingDeviceOrientationNotifications];
}




@end
