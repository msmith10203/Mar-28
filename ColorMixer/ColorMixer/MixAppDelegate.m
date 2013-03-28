//
//  MixAppDelegate.m
//  ColorMixer
//
//  Created by Mike Smith on 3/24/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import "MixAppDelegate.h"
#import "View.h"
#import "Base.h"


@implementation MixAppDelegate

@synthesize view;
@synthesize baseView;
@synthesize red;
@synthesize blue;
@synthesize green;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIScreen *screen = [UIScreen mainScreen];
	view = [[View alloc] initWithFrame: screen.applicationFrame];
    baseView = [[BaseView alloc] initWithFrame: screen.applicationFrame];
	self.window = [[UIWindow alloc] initWithFrame: screen.bounds];
	[self.window makeKeyAndVisible];
    [self.window addSubview: baseView];
	return YES;
}
- (void) switchValueChanged: (id) sender {
	UISwitch *s = sender;
	if (s.isOn) {
		//The UISwitch has just been turned on.
        [view removeFromSuperview];
        [UIView animateWithDuration: 5.0
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations: ^{
                             //This block describes what the animation should do.
                             self.baseView.backgroundColor = [UIColor colorWithRed:
                                                              red green: green blue: blue alpha: 1.0];
                         }
                         completion: NULL
         ];
    } else {
        view.backgroundColor = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1.0];
        MixAppDelegate *app = [UIApplication sharedApplication].delegate;
        app.red = 0;
        app.blue = 0;
        app.green = 0;
        view.greenSlider.value=0.0;
        view.redSlider.value=0.0;
        view.blueSlider.value=0.0;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
