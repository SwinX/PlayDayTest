//
//  Message_Runtime.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 30.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "Message_Runtime.h"
#import "TextMessage.h"
#import "ImageMessage.h"
#import "LocationMessage.h"

@implementation Message(Runtime)

+(Class)messageClassForType:(MessageType)type {
    switch (type) {
        case MTText:
            return [TextMessage class];
        case MTImage:
            return [ImageMessage class];
        case MTLocation:
            return [LocationMessage class];
    }
}

@end
