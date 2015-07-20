//
//  AppDelegate.m
//  12. Blocks
//
//  Created by Admin on 19.07.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#import "AppDelegate.h"
#import "NVStudent.h"
#import <UIKit/UIKit.h>
@interface AppDelegate ()

@end
typedef void(^VoidTestBlock)(void);
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Uchenik
    void (^testBlock1)(void)=^{
        NSLog(@"testBlock1");
    };
    testBlock1();

    NSString* (^testBlock2)(NSString*,NSString*)=^(NSString* a,NSString* b){
        return[a stringByAppendingString:b];
    };
    NSLog(@"%@",testBlock2(@"Vasya ", @"Pupkin"));
    CGFloat (^testBlock3)(CGFloat,CGFloat);
    testBlock3=^(CGFloat a,CGFloat b) {
        return a+b;
    };
    NSLog(@"%f",testBlock3(3.4,4));
    [self testMethodWithTestBlock:^{
        NSLog(@"test of typedef void block");
    }];
    //---------
    //end of Uchenik
    
    //Student
    NVStudent *st1=[[NVStudent alloc]init];
    NVStudent *st2=[[NVStudent alloc]init];
    NVStudent *st3=[[NVStudent alloc]init];
    NVStudent *st4=[[NVStudent alloc]init];
    NVStudent *st5=[[NVStudent alloc]init];
    NVStudent *st6=[[NVStudent alloc]init];
    NVStudent *st7=[[NVStudent alloc]init];
    NVStudent *st8=[[NVStudent alloc]init];
    NVStudent *st9=[[NVStudent alloc]init];
    NVStudent *st10=[[NVStudent alloc]init];
    
    st1.firstname=@"Ivan";
    st2.firstname=@"Alex";
    st3.firstname=@"Nik";
    st4.firstname=@"Nikolay";
    st5.firstname=@"Evgeniy";
    st6.firstname=@"Alexandr";
    st7.firstname=@"Dima";
    st8.firstname=@"Max";
    st9.firstname=@"Sergey";
    st10.firstname=@"Artem";
    
    st1.lastname=@"Artemov";
    st2.lastname=@"Sergeev";
    st3.lastname=@"Maximov";
    st4.lastname=@"Dmitriev";
    st5.lastname=@"Alexandrov";
    st6.lastname=@"Ivanov";
    st7.lastname=@"Nikolaev";
    st8.lastname=@"Nikitin";
    st9.lastname=@"Alexeev";
    st10.lastname=@"Ivanov";
    
    NSArray* array=[NSArray arrayWithObjects:st1,st2,st3,st4,
                    st5,st6,st7,st8,st9,st10, nil];
    NSArray *sortedArray=[array sortedArrayUsingComparator:
                          ^NSComparisonResult(NVStudent* obj1, NVStudent* obj2) {
                              if ([obj1.lastname compare:obj2.lastname] ==NSOrderedSame) {
                                  return [obj1.firstname compare:obj2.firstname];
                              } else {
                                  return [obj1.lastname compare:obj2.lastname];
                              }
                          }];
    NSLog(@"sorted array of students by lastname, then by firstname:%@",sortedArray);
    return YES;
}
-(void) testMethodWithTestBlock:(VoidTestBlock) block{
    block();
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
