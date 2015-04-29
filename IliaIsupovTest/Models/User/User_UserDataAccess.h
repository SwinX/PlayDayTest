//
//  User_UserDataAccess.h
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 29.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "User.h"

@class MessageData;

@interface User (UserDataAccess)

-(UserData*)userData;
-(void)addMessage:(MessageData*)message;

@end
