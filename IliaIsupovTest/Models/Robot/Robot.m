//
//  Robot.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 30.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "Robot.h"
#import "User.h"
#import "Conversation.h"
#import "Message.h"
#import "LocationMessage.h"
#import "TextMessage.h"
#import "ImageMessage.h"

@interface Robot (Private)

-(Message*)replyToMessage:(Message*)message;

@end

@implementation Robot {
    __weak User* _user;
    __weak Conversation* _conversation;
    
    Message* _selfReply;
}

-(instancetype)initWithUser:(User*)user conversation:(Conversation*)conversation {
    if (self = [super init]) {
        _user = user;
        _conversation = conversation;
    }
    return self;
}

#pragma mark ConversationObserver implementation
-(void)user:(User*)user didSendMessage:(Message *)message {
    if (![message isEqual:_selfReply]) {
        _selfReply = [self replyToMessage:message];
    } else {
        _selfReply = nil;
    }
}

@end

@implementation Robot (Private)

-(Message*)replyToMessage:(Message*)message {
    switch (message.type) {
        case MTText:
            return [_conversation sendText:((TextMessage*)message).text fromUser:_user];
        case MTImage:
            return [_conversation sendImage:((ImageMessage*)message).image fromUser:_user];
        case MTLocation:
            return [_conversation sendLocation:((LocationMessage*)message).location fromUser:_user];
    }
}

@end
