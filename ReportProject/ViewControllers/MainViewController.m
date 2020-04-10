//
//  MainViewController.m
//  ReportProject
//
//  Created by Arthur on 3/30/20.
//  Copyright © 2020 Arthur. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "MainViewController.h"
#import "MainContainerViewController.h"
#import "AppDelegate.h"

@interface MainViewController ()

@property (nonatomic, weak) MainContainerViewController *containnerViewController;
@property (weak, nonatomic) IBOutlet UIView *notificationBox;
@property (weak, nonatomic) IBOutlet UIImageView *notificationIconView;
@property (weak, nonatomic) IBOutlet UILabel *notificationMessageLabel;

//    IBOutlet UIView *notificationBox;
//    IBOutlet UIImageView *notificationIconView;
//    IBOutlet UILabel *notificationMessageLabel;

@end

@implementation MainViewController
{
    NSTimer *autoHideNotificationTimer;
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    appDelegate.mainViewController = self;
    [self showLoginView];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"mainEmbededSegue"]){
        self.containnerViewController = segue.destinationViewController;
        self.containnerViewController.mainViewController = self;
    }
    [super prepareForSegue:segue sender:sender];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return YES;
}

-(void)showLoginView
{
    [[self navigationController] setNavigationBarHidden:YES animated:NO];

    [self.containnerViewController showViewControllerWithSegue:@"showLoginScreen"];
    
}

-(void)showSettingServiceView
{
    [[self navigationController] setNavigationBarHidden:YES animated:NO];

    [self.containnerViewController showViewControllerWithSegue:@"showMainReportScreen"];
}

- (IBAction)closeNotificationBoxButtonTapped:(id)sender {
    [self hideMessageBox];
}
#pragma notification

-(void)showWarningMessageBoxWithMassage:(NSString *)message
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.notificationBox setBackgroundColor: [UIColor colorWithRed:241/255.0 green:187/255.0 blue:35/255.0 alpha:1]];
        [self.notificationIconView setImage:[UIImage imageNamed:@"warning"]];
        [self.notificationMessageLabel setText:message];
        [self.notificationBox setHidden:NO];
    });
}
-(void)hideMessageBox
{
    [self.notificationBox setHidden:YES];
    [autoHideNotificationTimer invalidate];
    autoHideNotificationTimer = nil;
}

@end
