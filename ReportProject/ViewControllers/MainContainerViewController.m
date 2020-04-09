//
//  MainContainerViewController.m
//  ReportProject
//
//  Created by Arthur on 3/30/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainContainerViewController.h"
#import "BaseViewController.h"

@interface MainContainerViewController ()

@end

@implementation MainContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass: [BaseViewController class]]){
        [(BaseViewController*)segue.destinationViewController setMainViewController:self.mainViewController];
    }
    [super prepareForSegue:segue sender:sender];
}

@end
