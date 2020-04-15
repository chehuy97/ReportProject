//
//  LoginViewController.m
//  ReportProject
//
//  Created by Arthur on 3/30/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginViewController.h"
#import "AppDelegate.h"
#import "User.h"

@interface LoginViewController ()

@property (strong, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (strong, nonatomic) IBOutlet UIButton *btnLogin;
@property (strong, nonatomic) IBOutlet UIImageView *imgLogo;
@property (strong, nonatomic) IBOutlet UILabel *nameApplication;


@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self customizeUI];
//    _usernameTextfield.text = @"chehuy97";
//    _passwordTextfield.text = @"123456";
    

}

- (IBAction)LoginMainView:(UIButton *)sender {
    [self validateLogin];
}


-(void)customizeUI
{
    [[AppDelegate shareInstance] hideNotification];
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:self.view.frame];
    backgroundImage.image = [UIImage imageNamed:@"gray-background"];
    [self.view addSubview:backgroundImage];
    _imgLogo = [[UIImageView alloc] initWithFrame:CGRectZero];
    _imgLogo.image = [UIImage imageNamed:@"logo-app"];
    [self.view addSubview:_imgLogo];
    [_imgLogo.widthAnchor constraintEqualToConstant:self.view.frame.size.height/4].active = true;
    [_imgLogo.heightAnchor constraintEqualToConstant:self.view.frame.size.height/4].active = true;
    [_imgLogo.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [_imgLogo.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:self.view.frame.size.height/16].active = true;
    _imgLogo.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.view addSubview: _nameApplication];
    _nameApplication.text = @"Report";
    [_nameApplication setFont:[UIFont boldSystemFontOfSize:45]];
    _nameApplication.textAlignment = NSTextAlignmentCenter;
    [_nameApplication.widthAnchor constraintEqualToConstant:self.view.frame.size.width/4*3].active = true;
    [_nameApplication.heightAnchor constraintEqualToConstant:50].active = true;
   // [_nameApplication.centerXAnchor constraintEqualToAnchor:backgroundImage.centerXAnchor].active = true;
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem: _nameApplication attribute: NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    [_nameApplication.topAnchor constraintEqualToAnchor:_imgLogo.bottomAnchor constant:self.view.frame.size.height/64].active = true;
    _nameApplication.translatesAutoresizingMaskIntoConstraints = false;
    
    UIView *paddingUsernameView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 50)];
    [self.view addSubview: _usernameTextfield];
    _usernameTextfield.backgroundColor = [UIColor whiteColor];
    [_usernameTextfield setFont: [UIFont systemFontOfSize:25]];
    _usernameTextfield.placeholder = @"Username";
    _usernameTextfield.leftView = paddingUsernameView;
    _usernameTextfield.leftViewMode = UITextFieldViewModeAlways;
    _usernameTextfield.layer.cornerRadius = 15;
    [_usernameTextfield.widthAnchor constraintEqualToConstant:self.view.frame.size.width/4*3].active = true;
    [_usernameTextfield.heightAnchor constraintEqualToConstant:50].active = true;
    [_usernameTextfield.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [_usernameTextfield.topAnchor constraintEqualToAnchor:_nameApplication.bottomAnchor constant:self.view.frame.size.height/32].active = true;
    _usernameTextfield.translatesAutoresizingMaskIntoConstraints = false;
    
    UIView *paddingPasswordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 50)];
    [self.view addSubview: _passwordTextfield];
    _passwordTextfield.secureTextEntry = true;
    _passwordTextfield.backgroundColor = [UIColor whiteColor];
    [_passwordTextfield setFont: [UIFont systemFontOfSize:25]];
    _passwordTextfield.placeholder = @"Password";
    _passwordTextfield.leftView = paddingPasswordView;
    _passwordTextfield.leftViewMode = UITextFieldViewModeAlways;
    _passwordTextfield.layer.cornerRadius = 15;
    [_passwordTextfield.widthAnchor constraintEqualToConstant:self.view.frame.size.width/4*3].active = true;
    [_passwordTextfield.heightAnchor constraintEqualToConstant:50].active = true;
    [_passwordTextfield.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [_passwordTextfield.topAnchor constraintEqualToAnchor:_usernameTextfield.bottomAnchor constant:self.view.frame.size.height/32].active = true;
    _passwordTextfield.translatesAutoresizingMaskIntoConstraints = false;
    
    [self.view addSubview: _btnLogin];
    //[_btnLogin setImage:[UIImage imageNamed:@"login-button1"] forState:UIControlStateNormal];
    [_btnLogin setTitle: @"LOGIN" forState: normal];
    [_btnLogin setTitleColor:[UIColor whiteColor] forState:normal];
    _btnLogin.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    _btnLogin.layer.cornerRadius = 15;
    _btnLogin.backgroundColor = [UIColor blackColor];
    [_btnLogin.widthAnchor constraintEqualToConstant:self.view.frame.size.width/4*3].active = true;
    [_btnLogin.heightAnchor constraintEqualToConstant:50].active = true;
    [_btnLogin.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [_btnLogin.topAnchor constraintEqualToAnchor:_passwordTextfield.bottomAnchor constant:self.view.frame.size.height/16].active = true;
    _btnLogin.translatesAutoresizingMaskIntoConstraints = false;
    
    UIButton *btnSignin = [[UIButton alloc] initWithFrame:CGRectZero];
    [btnSignin addTarget:self action:@selector(showSigninAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btnSignin];
    [btnSignin setTitle: @"SIGNIN" forState: normal];
    [btnSignin setTitleColor:[UIColor whiteColor] forState:normal];
    btnSignin.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    btnSignin.layer.cornerRadius = 15;
    btnSignin.backgroundColor = [UIColor blackColor];
    [btnSignin.widthAnchor constraintEqualToConstant:self.view.frame.size.width/4*3].active = true;
    [btnSignin.heightAnchor constraintEqualToConstant:50].active = true;
    [btnSignin.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
    [btnSignin.topAnchor constraintEqualToAnchor:_btnLogin.bottomAnchor constant:self.view.frame.size.height/32].active = true;
    btnSignin.translatesAutoresizingMaskIntoConstraints = false;
}
-(void)showSigninAction
{
    [[AppDelegate shareInstance] showWarningNotificationWithMessage:@"you can't signin ÓC CHÓ"];
}

-(void)validateLogin
{
    User *userInfo = [User currentUser];
    userInfo.username = _usernameTextfield.text;
    userInfo.password = _passwordTextfield.text;

    if ([userInfo.username  isEqualToString:@"chehuy97"] && [userInfo.password  isEqualToString: @"123456"]) {
        [self.mainViewController showSettingServiceView];
    }else if([userInfo.username  isEqual: @""] || [userInfo.password  isEqual: @""]){
        [[AppDelegate shareInstance] showWarningNotificationWithMessage:@"you haven't filled username or password"];
    }else{
        [[AppDelegate shareInstance] showWarningNotificationWithMessage:@"you filled wrong username or password"];
    }
}


@end
