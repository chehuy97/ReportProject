//
//  ContainerBaseViewController.h
//  ReportProject
//
//  Created by Arthur on 3/30/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

#ifndef ContainerBaseViewController_h
#define ContainerBaseViewController_h


#endif /* ContainerBaseViewController_h */
#import<UIKit/UIKit.h>

@protocol MainContainerViewControllerProtocol <NSObject>

@property (weak, nonatomic) UIViewController *currentViewController;

@property (weak, nonatomic) NSString *currentSegueIdentifier;

@end

@interface ContainerBaseViewController : UIViewController<MainContainerViewControllerProtocol>

-(void)showViewControllerWithSegue: (NSString *) segueIdentifier;


@end
