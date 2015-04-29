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

#import "LocationMessage.h"
#import "TextMessage.h"
#import "ImageMessage.h"

@interface Conversation (Private)

-(NSArray*)fetchSavedMessagesForConversationUsers;

@end

@implementation Conversation {
    NSMutableArray* _observers;
}

-(instancetype)initWithUsers:(NSArray *)users {
    if (self = [super init]) {
        _users = users;
        
    }
    return self;
}

-(Message*)sendText:(NSString*)text fromUser:(User *)user {
    return nil;
}

-(Message*)sendImage:(UIImage*)image fromUser:(User *)user {
    return nil;
}

-(Message*)sendLocation:(CLLocation*)location fromUser:(User *)user {
    return nil;
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

@end
