//
//  Conversation.h
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 28.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

@import UIKit;
@import MapKit;

@class User;
@class Message;
@class ConversationData;

@protocol ConversationObserver <NSObject>

@optional
-(void)user:(User*)user didSendMessage:(Message*)message;

@end

@interface Conversation : NSObject {
    ConversationData* _internals;
}

@property (nonatomic, readonly) NSArray* users;
@property (nonatomic, readonly) NSArray* messages;

-(instancetype)init NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithConversationData:(ConversationData*)conversationData NS_DESIGNATED_INITIALIZER;

-(void)addUser:(User*)user;

-(Message*)sendText:(NSString*)text fromUser:(User*)user;
-(Message*)sendImage:(UIImage*)image fromUser:(User*)user;
-(Message*)sendLocation:(CLLocation*)location fromUser:(User*)user;

-(void)addObserver:(id<ConversationObserver>)observer;
-(void)removeObserver:(id<ConversationObserver>)observer;

@end
