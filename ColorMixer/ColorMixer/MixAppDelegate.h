//
//  MixAppDelegate.h
//  ColorMixer
//
//  Created by Mike Smith on 3/24/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface MixAppDelegate : UIResponder <UIApplicationDelegate>{
    View *view;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;

@end
