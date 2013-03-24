//
//  NoteAppDelegate.h
//  Note
//
//  Created by NYU User on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface NoteAppDelegate: UIResponder <UIApplicationDelegate> {
	UIDevice *device;
	View *view;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSNotificationCenter *center;
@end
