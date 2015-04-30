//
//  Conversation_ConversationDataAccess.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 30.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "Conversation_ConversationDataAccess.h"
#import "UserData.h"
#import "ConversationData.h"
#import "MessageData.h"

@implementation Conversation(ConversationDataAccess)

-(ConversationData*)conversationData {
    return _internals;
}
-(void)addUserData:(UserData*)userData {
    [_internals addUsersObject:userData];
}
-(void)addMessageData:(MessageData*)messageData {
    [_internals addMessagesObject:messageData];
}

@end
