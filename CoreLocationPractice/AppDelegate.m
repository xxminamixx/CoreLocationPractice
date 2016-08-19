//
//  AppDelegate.m
//  CoreLocationPractice
//
//  Created by 南　京兵 on 2016/08/19.
//  Copyright © 2016年 南　京兵. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<CLLocationManagerDelegate>

@property CLLocationManager *locationManager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // ロケーションマネージャーを生成
    self.locationManager = [CLLocationManager new];
    
    // 位置情報の利用をユーザに伺う
    [self.locationManager requestWhenInUseAuthorization];
    
    self.locationManager.delegate = self;
    
    // ロケーションマネージャーのすべての結果が通知されるように設定
    [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
    
    // 検出時間や消費電力にかかわらず、最も正確な位置を検出するように設定
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    // 位置情報の検出をすぐに開始させる
    [self.locationManager startUpdatingLocation];
    
    [[self window] makeKeyAndVisible];
    
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

-(void)locationManager:(CLLocationManager *)manager
   didUpdateToLocation:(CLLocation*)newLocation
          fromLocation:(CLLocation*)oldLocation
{
     NSLog(@"%@", newLocation);
}

- (void)locatioManager:(CLLocationManager *)manager
      didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location: %@", error);
}

// CLLocationManager オブジェクトにデリゲートオブジェクトを設定すると初回に呼ばれる
- (void)locationManager:(CLLocationManager *)manager
didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusNotDetermined) {
        // ユーザが位置情報の使用を許可していない
        NSLog(@"許可していない");
    } else {
        NSLog(@"許可している");
    }
}

@end
