//
//  Created by NYU User on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "NoteAppDelegate.h"
#import "View.h"

@implementation NoteAppDelegate
@synthesize window = _window;
@synthesize center;

- (BOOL) application: (UIApplication *) application didFinishLaunchingWithOptions: (NSDictionary *) launchOptions
{
	// Override point for customization after application launch.
	UIScreen *screen = [UIScreen mainScreen];
	view = [[View alloc] initWithFrame: screen.applicationFrame];
	self.window = [[UIWindow alloc] initWithFrame: screen.bounds];
	//self.window.backgroundColor = [UIColor whiteColor];
	[self.window addSubview: view];
    /*
     device = [UIDevice currentDevice];
     center = [NSNotificationCenter defaultCenter];
     
     //Send the setNeedsDisplay message to the view
     //when we get a OrientationDidChange notification from the device.
     
     [center addObserver: view
     selector: @selector(setNeedsDisplay)
     name: UIDeviceOrientationDidChangeNotification
     object: device
     ];
     
     [device beginGeneratingDeviceOrientationNotifications];
     */
	[self.window makeKeyAndVisible];
	return YES;
}

- (void) applicationWillResignActive: (UIApplication *) application
{
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}

- (void) applicationDidEnterBackground: (UIApplication *) application
{
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
}

- (void) applicationWillEnterForeground: (UIApplication *) application
{
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
}

- (void) applicationDidBecomeActive: (UIApplication *) application
{
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
}

- (void) applicationWillTerminate: (UIApplication *) application
{
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
}

//- (void) dealloc {
//    [center removeObserver:view];
//	[device endGeneratingDeviceOrientationNotifications];
//}


@end
