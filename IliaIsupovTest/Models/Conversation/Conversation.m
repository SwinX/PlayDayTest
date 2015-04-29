//
//  Conversation.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 28.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "Conversation.h"
#import "Message.h"

#import <MagicalRecord/CoreData+MagicalRecord.h>

@interface Conversation (Private)

-(NSArray*)fetchSavedMessagesForConversationUsers;

@end

@implementation Conversation

-(instancetype)initWithUsers:(NSArray *)users {
    if (self = [super init]) {
        _users = users;
        
    }
    return self;
}

-(Message*)sendText:(NSString*)text {
    return nil;
}

-(Message*)sendImage:(UIImage*)image {
    return nil;
}

-(Message*)sendLocation:(CLLocation*)location {
    return nil;
}

@end

@implementation Conversation (Private)

-(NSArray*)fetchSavedMessagesForConversationUsers {
    return nil;
}

@end
