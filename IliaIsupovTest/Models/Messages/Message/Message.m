//
//  Message.m
//  
//
//  Created by Ilia Isupov on 28.04.15.
//
//

#import <MagicalRecord/CoreData+MagicalRecord.h>

#import "Message.h"
#import "User.h"
#import "User_UserDataAccess.h"

#import "MessageData.h"

@implementation Message {
    User* _user;
}

-(instancetype)init {
    if (self = [super init]) {
        _internals = [MessageData MR_createEntity];
        _internals.uid = [[NSUUID UUID] UUIDString];
    }
    return self;
}

-(instancetype)initWithMessageData:(MessageData*)data {
    if (self = [super init]) {
        _internals = data;
    }
    return self;
}

-(instancetype)initWithUser:(User*)user {
    if (self = [self init]) {
        _internals.user = [user userData];
        [user addMessage:_internals];
        _user = user;
    }
    return self;
}

-(NSString*)uid {
    return _internals.uid;
}

-(MessageType)type {
    return [_internals.messageType intValue];
}

-(NSDate*)date {
    return _internals.messageDate;
}

-(User*)user {
    return _user;
}

@end
