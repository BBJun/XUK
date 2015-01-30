//
//  AppDelegate.m
//  XUK
//
//  Created by 123 on 15-1-28.
//  Copyright (c) 2015年 andy. All rights reserved.
//

#import "AppDelegate.h"
#import "SCNavTabBarController.h"
#import "MMDrawerController.h"
#import "DietViewController.h"
#import "ShoppingViewController.h"
#import "UserCenterViewController.h"
#import "MMDrawerVisualState.h"
#import "MMDrawerVisualStateManager.h"
#import "MBaseNavigationController.h"
#import "TravelViewController.h"
#import "UsedViewController.h"
#import "ClubViewController.h"
#import "RentViewController.h"
#import "SportViewController.h"
#import "GameViewController.h"
#import "OtherViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    DietViewController *dietVc = [[DietViewController alloc] initWithNibName:@"DietViewController" bundle:nil];
    dietVc.title = @"饮食";
    ShoppingViewController *shoppingVc = [[ShoppingViewController alloc] initWithNibName:@"ShoppingViewController" bundle:nil];
    shoppingVc.title = @"购物";
    TravelViewController *travelVc = [[TravelViewController alloc] initWithNibName:@"TravelViewController" bundle:nil];
    travelVc.title = @"旅游";
    UsedViewController *usedVc = [[UsedViewController alloc] initWithNibName:@"UsedViewController" bundle:nil];
    usedVc.title = @"二手";
    ClubViewController *clubVc = [[ClubViewController alloc] initWithNibName:@"ClubViewController" bundle:nil];
    clubVc.title = @"俱乐部";
    RentViewController *rentVc = [[RentViewController alloc] initWithNibName:@"RentViewController" bundle:nil];
    rentVc.title = @"租房";
    SportViewController *sportVc = [[SportViewController alloc] initWithNibName:@"SportViewController" bundle:nil];
    sportVc.title = @"运动";
    GameViewController *gameVc = [[GameViewController alloc] initWithNibName:@"GameViewController" bundle:nil];
    gameVc.title = @"游戏";
    OtherViewController *otherVc = [[OtherViewController alloc] initWithNibName:@"OtherViewController" bundle:nil];
    otherVc.title = @"其他";
    UserCenterViewController *userVc = [[UserCenterViewController alloc] initWithNibName:@"UserCenterViewController" bundle:nil];
    SCNavTabBarController *scNav = [[SCNavTabBarController alloc] initWithSubViewControllers:@[dietVc, shoppingVc, travelVc, usedVc,
                                                            clubVc, rentVc, sportVc, gameVc, otherVc]];
    MBaseViewController *centerVc = [[MBaseViewController alloc] init];
    [scNav addParentController:centerVc];
    MBaseNavigationController *baseNav = [[MBaseNavigationController alloc] initWithRootViewController:centerVc];
    MMDrawerController *drawerVc = [[MMDrawerController alloc] initWithCenterViewController:baseNav leftDrawerViewController:userVc];
    [drawerVc setMaximumLeftDrawerWidth:280];
    [drawerVc setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [drawerVc setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [drawerVc
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    self.window.rootViewController = drawerVc;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
