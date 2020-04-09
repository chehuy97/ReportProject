//
//  BaseViewController.m
//  ReportProject
//
//  Created by Arthur on 3/30/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewController.h"

@implementation BaseViewController

- (void)showAlert:(NSString *)content
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"alert" message:content preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){
        NSLog(@"Ok is pressed");
    }];
    [alert addAction:actionOK];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
