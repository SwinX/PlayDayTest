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

@protocol ConversationDelegate <NSObject>

-(void)user:(User*)user didSendMessage:(Message*)message;

@end

@interface Conversation : NSObject

@property (nonatomic, weak) id<ConversationDelegate> delegate;

@property (nonatomic, readonly) NSArray* users;
@property (nonatomic, readonly) NSArray* messages;

-(instancetype)initWithUsers:(NSArray*)users;

-(Message*)sendText:(NSString*)text;
-(Message*)sendImage:(UIImage*)image;
-(Message*)sendLocation:(CLLocation*)location;

@end
