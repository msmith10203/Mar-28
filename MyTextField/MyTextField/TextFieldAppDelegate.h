//
//  TextFieldAppDelegate.h
//  MyTextField
//
//  Created by Mike Smith on 3/18/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface TextFieldAppDelegate : UIResponder <UIApplicationDelegate> {
    View *view;
	UIWindow *_window;}

@property (strong, nonatomic) UIWindow *window;

@end
