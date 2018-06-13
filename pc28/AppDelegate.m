//
//  AppDelegate.m
//  pc28
//
//  Created by 83830 on 2016/11/17.
//  Copyright © 2016年 83830. All rights reserved.
//

#import "AppDelegate.h"
#import "UIAlertView+Block.h"
#import "ViewController.h"

// 设备全屏高
#define SCREEN_FULL_HEIGHT  [[UIScreen mainScreen] bounds].size.height
// 设备全屏宽
#define SCREEN_FULL_WIDTH [[UIScreen mainScreen] bounds].size.width


@interface AppDelegate ()
{
    BOOL  _isShow;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UINavigationController *tab = [[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]];
    self.window.rootViewController = tab;
    
    // Override point for customization after application launch.
    return YES;
}



- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.

    
}



- (void)applicationWillResignActive:(UIApplication *)application

{
    
    //盖上view
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_FULL_WIDTH, SCREEN_FULL_HEIGHT)];
    //添加手势
    
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(event:)];
    
    //将手势添加到需要相应的view中去
    [view addGestureRecognizer:tapGesture];
    
    //选择触发事件的方式（默认单机触发）
    [tapGesture setNumberOfTapsRequired:3];
    
    
    view.backgroundColor = [UIColor whiteColor];
    
    view.alpha = 1;
    
    view.tag = 1111;
    
    [[[UIApplication sharedApplication] keyWindow] addSubview:view];
    
    
}
#pragma mark 执行触发的方法

- (void)event:(UITapGestureRecognizer *)gesture
{
    
    UIView *view = gesture.view;
    
    [view removeFromSuperview];
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{

    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
