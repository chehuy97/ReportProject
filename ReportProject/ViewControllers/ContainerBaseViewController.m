//
//  ContainerBaseViewController.m
//  ReportProject
//
//  Created by Arthur on 3/30/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContainerBaseViewController.h"

@interface ContainerBaseViewController()

@end

@implementation ContainerBaseViewController

@synthesize currentSegueIdentifier = _currentSegueIdentifier;

@synthesize currentViewController = _currentViewController;

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (self.currentViewController) {
        [self swapFromViewController:_currentViewController toViewController:segue.destinationViewController];
    }
    else
    {
        [self addViewController:segue.destinationViewController];
    }
}

-(void) addViewController: (UIViewController*) aViewController
{
    [self addChildViewController:aViewController];
    UIView* destView = (aViewController).view;
//    destView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    destView.frame = self.view.bounds;
    [self.view addSubview:destView];
    [aViewController didMoveToParentViewController:self];
    
}

-(void) swapFromViewController: (UIViewController *) fromViewController toViewController: (UIViewController *) toViewController
{
    toViewController.view.frame = self.view.bounds;
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController: toViewController];
    
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished){
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
    }];
}


- (void)showViewControllerWithSegue:(NSString *)segueIdentifier
{
    self.currentSegueIdentifier = segueIdentifier;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
}

@end
