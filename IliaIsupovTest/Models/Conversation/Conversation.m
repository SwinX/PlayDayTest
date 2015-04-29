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

#import "LocationMessage.h"
#import "TextMessage.h"
#import "ImageMessage.h"

@interface Conversation (Private)

-(NSArray*)fetchSavedMessagesForConversationUsers;

-(Message*)sendMessage:(Message*)message fromUser:(User*)user;
-(void)notifyMessageSent:(Message*)message fromUser:(User*)user;

-(BOOL)isUserInConversation:(User*)user;

@end

@implementation Conversation {
    NSMutableArray* _observers;
    NSMutableArray* _messages;
}

-(instancetype)initWithUsers:(NSArray *)users {
    if (self = [super init]) {
        _users = users;
        
    }
    return self;
}

-(Message*)sendText:(NSString*)text fromUser:(User *)user {
    return [self sendMessage:[[TextMessage alloc] initWithText:text user:user]
                    fromUser:user];
}

-(Message*)sendImage:(UIImage*)image fromUser:(User *)user {
    return [self sendMessage:[[ImageMessage alloc] initWithImage:image user:user]
                    fromUser:user];
}

-(Message*)sendLocation:(CLLocation*)location fromUser:(User *)user {
    return [self sendMessage:[[LocationMessage alloc] initWithLocation:location user:user]
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

-(NSArray*)fetchSavedMessagesForConversationUsers {
    return nil;
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
