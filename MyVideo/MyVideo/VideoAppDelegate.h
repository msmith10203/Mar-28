//
//  VideoAppDelegate.h
//  Video
//
//  Created by NYU User on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>	//needed for MPMoviePlayerController
@class View;

@interface VideoAppDelegate: UIResponder <UIApplicationDelegate> {
	MPMoviePlayerController *controller;
	View *view;
	UIWindow *_window;
}

@property (strong, nonatomic) UIWindow *window;
@end
