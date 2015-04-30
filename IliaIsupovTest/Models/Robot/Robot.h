//
//  Robot.h
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 30.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@class Conversation;
@protocol ConversationObserver;

@interface Robot : NSObject

-(instancetype)initWithUser:(User*)user conversation:(Conversation*)conversation NS_DESIGNATED_INITIALIZER;

@end
