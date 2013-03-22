//
//  ButtonAppDelegate.h
//  MyButton
//
//  Created by Mike Smith on 3/20/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
@class View;

@interface ButtonAppDelegate : UIResponder <UIApplicationDelegate>{
    SystemSoundID sid;
    View *view;
    UIWindow *_window;
}

-(void) touchUpInside: (id) sender;

@property (strong, nonatomic) UIWindow *window;

@end
