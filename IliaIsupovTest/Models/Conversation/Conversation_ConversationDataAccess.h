//
//  Conversation_ConversationDataAccess.h
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 30.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "Conversation.h"

@class ConversationData;
@class UserData;
@class MessageData;

@interface Conversation(ConversationDataAccess)

-(ConversationData*)conversationData;
-(void)addUserData:(UserData*)userData;
-(void)addMessageData:(MessageData*)messageData;

@end
