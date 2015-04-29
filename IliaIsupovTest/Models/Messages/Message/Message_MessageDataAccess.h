//
//  Message_MessageDataAccess.h
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 29.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "Message.h"

@class UserData;

@interface Message (MessageDataAccess)

-(MessageData*)messageData;
-(void)addUserData:(UserData*)userData;

@end
