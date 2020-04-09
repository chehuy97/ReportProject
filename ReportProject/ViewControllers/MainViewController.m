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

@interface MainViewController ()

@property (nonatomic, weak) MainContainerViewController *containnerViewController;

@end

@implementation MainViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
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

@end
