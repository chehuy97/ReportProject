//
//  ReportMainViewController.m
//  ReportProject
//
//  Created by Arthur on 4/1/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReportMainViewController.h"

@interface ReportMainViewController()

@property (weak, nonatomic) IBOutlet UIButton *btnLogout;

@end

@implementation ReportMainViewController

{
    __weak IBOutlet UISegmentedControl *viewStyleSegment;
    ReportGridOrTreeView typeOfReportView;
    
}

-(void)viewDidLoad
{
    [self customizeDefaultUI];
    [self showGridViewOfReports];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"mainReportEmbeded"]) {
        self.containerViewController = segue.destinationViewController;
        
    }
}
- (IBAction)LogoutAction:(UIButton *)sender {
    [self.mainViewController showLoginView];
}

-(void) customizeDefaultUI
{
    self.navigationItem.hidesBackButton = YES;
    self.view.backgroundColor = [UIColor colorWithRed:175/255.0f green:196/255.0f blue:224/255.0f alpha:1];
    [[AppDelegate shareInstance] hideNotification];
}

- (void) showGridViewOfReports
{
    typeOfReportView = GridView;
    [[self containerViewController] showViewControllerWithSegue:@"showAsGridView"];
}
- (void) showTreeViewOfReports
{
    typeOfReportView = TreeView;
    [[self containerViewController] showViewControllerWithSegue:@"showAsTreeList"];
}

- (IBAction)SwitchGridAndTreeViewButtonTapped:(id)sender
{
    if (viewStyleSegment.selectedSegmentIndex == 0) {
        [self showGridViewOfReports];
    }else{
        [self showTreeViewOfReports];
    }
}
- (IBAction)settingAction:(UIButton *)sender {
    //[self showAlert:@"You clicked Setting Button"];
    [[AppDelegate shareInstance] showWarningNotificationWithMessage:@"I want to test Notification"];
}




@end
