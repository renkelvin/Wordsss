//
//  WordsssAppDelegate.m
//  Wordsss
//
//  Created by Ren Kelvin on 10/1/11.
//  Copyright 2011 Ren Inc. All rights reserved.
//

#import "WordsssAppDelegate.h"

#import "UserDataManager.h"

@implementation WordsssAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if (NO) {
        // Create xmlParser
        XMLParser* xmlParser = [XMLParser xmlParser];
        
        // Generate WordsssDB.sqlite
        [xmlParser go];
    }
    
    // Create main view
    [self.window makeKeyAndVisible];
    
    return YES;
}

+ (void)initialize
{
    //
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
	NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:10];
    
	[dict setObject:[NSNumber numberWithInt:0] forKey:kUserDefaultKeyLoginCount];
	[dict setObject:[NSNumber numberWithBool:NO] forKey:kUserDefaultKeyHasInitUser];
    
	[dict setObject:[NSNumber numberWithBool:NO] forKey:kUserDefaultKeyHasChangeWDBV11];
    
	[userDefault registerDefaults:dict];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
    
    // Save context
    [[UserDataManager userdataManager] saveContext];
    
    // Clear
    [[UserDataManager userdataManager] clear];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
    
    // Check next day
    if ([[TodayVirtualActor todayVirtualActor] checkNextDayByTime]) {
        [[TodayVirtualActor todayVirtualActor] nextDay];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    
    // Log in count ++
    int count = [[NSUserDefaults standardUserDefaults] integerForKey:kUserDefaultKeyLoginCount];
	[[NSUserDefaults standardUserDefaults] setInteger:(count + 1) forKey:kUserDefaultKeyLoginCount];
    
    // Init rand seed
    srand(time(NULL));
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
}

@end
