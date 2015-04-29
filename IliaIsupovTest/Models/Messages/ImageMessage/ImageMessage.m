//
//  ImageMessage.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 29.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "ImageMessage.h"
#import "MessageData.h"

@implementation ImageMessage

-(instancetype)initWithImage:(UIImage*)image user:(User*)user {
    if (self = [super initWithUser:user]) {
        _internals.messageImage = UIImagePNGRepresentation(image);
        _internals.messageType = [NSNumber numberWithInt:MTImage];
    }
    return self;
}

-(UIImage*)image {
    return [UIImage imageWithData:_internals.messageImage];
}

@end
