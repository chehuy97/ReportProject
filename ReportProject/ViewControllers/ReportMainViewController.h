//
//  ReportMainViewController.h
//  ReportProject
//
//  Created by Arthur on 4/1/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

#ifndef ReportMainViewController_h
#define ReportMainViewController_h


#endif /* ReportMainViewController_h */
#import<UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MainReports/MainReportContainerViewController.h"
#import "AppDelegate.h"

typedef enum
{
    GridView,
    TreeView
} ReportGridOrTreeView;

@interface ReportMainViewController : BaseViewController

@property (nonatomic, weak) MainReportContainerViewController *containerViewController;

@end
