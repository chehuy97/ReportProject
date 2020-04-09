//
//  User.m
//  ReportProject
//
//  Created by Arthur on 3/31/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@implementation User

+ (User *) currentUser
{
    static dispatch_once_t once;
    static User *currentUser;
    
    dispatch_once(&once,^{
        currentUser = [self new];
    });
    return  currentUser;
}

-(instancetype)initUserInfo:(NSString *)username password:(NSString *)password
{
    self = [super init];
    if(self) {
        _username = username;
        _password = password;
    }
    return self;
}

- (void)testSingleton
{
    NSLog(@"Can u call that function ???");
}


@end
