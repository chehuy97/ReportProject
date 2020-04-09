//
//  User.h
//  ReportProject
//
//  Created by Arthur on 3/31/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

#ifndef User_h
#define User_h


#endif /* User_h */
#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, assign) NSString *username;

@property (nonatomic, assign) NSString *password;

+ (User *) currentUser;

-(instancetype)initUserInfo:(NSString *)username password: (NSString *)password;

-(void) testSingleton;

@end
