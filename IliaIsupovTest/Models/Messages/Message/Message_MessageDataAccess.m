//
//  Message_MessageDataAccess.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 29.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "Message_MessageDataAccess.h"
#import "MessageData.h"

@implementation Message(MessageDataAccess)

-(MessageData*)messageData {
    return _internals;
}

-(void)addUserData:(UserData *)userData {
    _internals.user = userData;
}

@end
