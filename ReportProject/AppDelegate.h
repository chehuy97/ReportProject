//
//  AppDelegate.h
//  ReportProject
//
//  Created by Arthur on 3/30/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainViewController *mainViewController;

+ (AppDelegate *)shareInstance;

- (void) showWarningNotificationWithMessage:(NSString *)message;
-(void)hideNotification;

@end

