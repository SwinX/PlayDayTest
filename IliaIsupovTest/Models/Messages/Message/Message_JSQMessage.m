//
//  Message_JSQMessage.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 29.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "Message_JSQMessage.h"

@implementation Message (JSQMessage)

-(JSQMessage*)JSQMessage {
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

@end
