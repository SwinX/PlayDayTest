//
//  TextMessage.h
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 29.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "Message.h"

@interface TextMessage : Message

@property (nonatomic, readonly) NSString* text;

-(instancetype)initWithText:(NSString*)text user:(User*)user conversation:(Conversation*)conversation;

@end
