//
//  Robot.h
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 30.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Conversation.h"

@class User;
@class Conversation;

@interface Robot : NSObject<ConversationObserver>

-(instancetype)initWithUser:(User*)user conversation:(Conversation*)conversation NS_DESIGNATED_INITIALIZER;

@end
