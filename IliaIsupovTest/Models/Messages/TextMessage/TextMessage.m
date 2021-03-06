//
//  TextMessage.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 29.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "TextMessage.h"
#import "MessageData.h"
#import "User.h"

@implementation TextMessage

-(instancetype)initWithText:(NSString *)text user:(User *)user conversation:(Conversation *)conversation {
    if (self = [super initWithUser:user conversation:conversation]) {
        _internals.messageType = [NSNumber numberWithInt:MTText];
        _internals.messageText = text;
    }
    return self;
}

-(NSString*)text {
    return _internals.messageText;
}

-(JSQMessage*)JSQMessage {
    if (!_JSQMessage) {
        _JSQMessage = [[JSQMessage alloc] initWithSenderId:self.user.uid
                                  senderDisplayName:self.user.name
                                               date:self.date
                                               text:self.text];
    }
    return _JSQMessage;
}

@end
