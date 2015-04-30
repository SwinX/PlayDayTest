//
//  Conversation.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 28.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import <MagicalRecord/CoreData+MagicalRecord.h>

#import "Conversation.h"
#import "Message.h"

#import "User.h"
#import "UserData.h"
#import "User_UserDataAccess.h"

#import "LocationMessage.h"
#import "TextMessage.h"
#import "ImageMessage.h"

#import "ConversationData.h"
#import "Conversation_ConversationDataAccess.h"

@interface Conversation (Private)

-(void)initializeCollections;
-(void)addMessagesFromMessagesData;
-(void)addUsersFromUserData;

-(Message*)sendMessage:(Message*)message fromUser:(User*)user;
-(void)notifyMessageSent:(Message*)message fromUser:(User*)user;

-(BOOL)isUserInConversation:(User*)user;

@end

@implementation Conversation {
    NSMutableArray* _observers;
    NSMutableArray* _messages;
    NSMutableArray* _users;
}

-(instancetype)init {
    if (self = [super init]) {
        _internals = [ConversationData MR_createEntity];
        _internals.uid = [[NSUUID UUID] UUIDString];
        [self initializeCollections];
    }
    return self;
}

-(instancetype)initWithConversationData:(ConversationData *)conversationData {
    if (self = [super init]) {
        _internals = conversationData;
        [self initializeCollections];
        [self addMessagesFromMessagesData];
        [self addUsersFromUserData];
    }
    return self;
}

-(void)addUser:(User*)user {
    [self addUserData:[user userData]];
    [user addConversationData:_internals];
    [_users addObject:user];
}

-(Message*)sendText:(NSString*)text fromUser:(User *)user {
    return [self sendMessage:[[TextMessage alloc] initWithText:text user:user conversation:self]
                    fromUser:user];
}

-(Message*)sendImage:(UIImage*)image fromUser:(User *)user {
    return [self sendMessage:[[ImageMessage alloc] initWithImage:image user:user conversation:self]
                    fromUser:user];
}

-(Message*)sendLocation:(CLLocation*)location fromUser:(User *)user {
    return [self sendMessage:[[LocationMessage alloc] initWithLocation:location user:user conversation:self]
                    fromUser:user];
}

-(void)addObserver:(id<ConversationObserver>)observer {
    NSValue* observerValue = [NSValue valueWithNonretainedObject:observer];
    if (![_observers containsObject:observerValue]) {
        [_observers addObject:observerValue];
    }
}

-(void)removeObserver:(id<ConversationObserver>)observer {
    [_observers removeObject:[NSValue valueWithNonretainedObject:observer]];
}

@end

@implementation Conversation (Private)

-(void)initializeCollections {
    _users = [NSMutableArray array];
    _messages = [NSMutableArray array];
    _observers = [NSMutableArray array];
}

-(void)addMessagesFromMessagesData {
    for (MessageData* message in _internals.messages) {
        [_messages addObject:[[Message alloc] initWithMessageData:message]];
    }
    [_messages sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        Message* first = (Message*)obj1;
        Message* second = (Message*)obj2;
        return [first.date compare:second.date];
    }];
}

-(void)addUsersFromUserData {
    for (UserData* userData in _internals.users) {
        [_users addObject:[[User alloc] initWithUserData:userData]];
    }
}

-(Message*)sendMessage:(Message*)message fromUser:(User*)user {
    NSAssert([self isUserInConversation:user], @"Attempt to send message from user who is not in conversation");
    [_messages addObject:message];
    [self notifyMessageSent:message fromUser:user];
    return message;
}

-(void)notifyMessageSent:(Message*)message fromUser:(User*)user {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0), dispatch_get_main_queue(), ^{ //in order to trigger on next run loop cycle
        for (NSValue* observerValue in _observers) {
            id<ConversationObserver> observer = [observerValue nonretainedObjectValue];
            if ([observer respondsToSelector:@selector(user:didSendMessage:)]) {
                [observer user:user didSendMessage:message];
            }
        }
    });
}

-(BOOL)isUserInConversation:(User *)user {
    for (User* conversationUser in _users) {
        if ([conversationUser isEqual:user]) {
            return YES;
        }
    }
    return NO;
}

@end
