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

- (void)applicationWillResignActive:(UIApplication *)application
{
  
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{

}

- (void)applicationWillTerminate:(UIApplication *)application
{
  
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
