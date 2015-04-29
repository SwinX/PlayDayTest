//
//  User_UserDataAccess.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 29.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "User_UserDataAccess.h"

#import "UserData.h"
#import "MessageData.h"

@implementation User (UserDataAccess)

-(UserData*)userData {
    return _internals;
}

-(void)addMessage:(MessageData*)message {
    [_internals addMessagesObject:message];
}

@end
