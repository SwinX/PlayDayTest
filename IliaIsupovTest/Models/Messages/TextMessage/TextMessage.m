//
//  TextMessage.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 29.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "TextMessage.h"
#import "MessageData.h"

@implementation TextMessage

-(instancetype)initWithText:(NSString *)text user:(User *)user {
    if (self = [super initWithUser:user]) {
        _internals.messageType = [NSNumber numberWithInt:MTText];
        _internals.messageText = text;
    }
    return self;
}

-(NSString*)text {
    return _internals.messageText;
}

@end
