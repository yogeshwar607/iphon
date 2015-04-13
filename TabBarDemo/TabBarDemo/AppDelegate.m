//
//  AppDelegate.m
//  TabBarDemo
//
//  Created by Rajesh on 10/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "AppDelegate.h"
#import "HelpViewController.h"
#import "SettingViewController.h"
#import "HomeViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    HomeViewController *homeCon=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    homeCon.tabBarItem.title=@"HOME";
    UIImage *imgHome=[UIImage imageNamed:@"home.png"];
    homeCon.tabBarItem.image=imgHome;
    
    
   SettingViewController *settingCon=[[SettingViewController alloc]initWithNibName:@"SettingViewController" bundle:nil];
    settingCon.tabBarItem.title=@"SETTING";
    UIImage *imgSetting=[UIImage imageNamed:@"settings.png"];
    settingCon.tabBarItem.image=imgSetting;
    
    
   HelpViewController *helpCon=[[ HelpViewController alloc]initWithNibName:@"HelpViewController" bundle:nil];
    helpCon.tabBarItem.title=@"HELP";
    UIImage *imgHelp=[UIImage imageNamed:@"help.gif"];
   helpCon.tabBarItem.image=imgHelp;

    
    // creat a tab bar controller
    
    UITabBarController *tabCon=[[UITabBarController alloc]init];
    
    NSArray *arrayCon=[[NSArray alloc]initWithObjects:homeCon,settingCon,helpCon, nil];
    
    [tabCon setViewControllers:arrayCon];
    self.window.rootViewController=tabCon;
    
    [self.window makeKeyAndVisible];
    return YES;
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
