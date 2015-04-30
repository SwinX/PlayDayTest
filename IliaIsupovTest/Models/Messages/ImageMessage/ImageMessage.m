//
//  ImageMessage.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 29.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "ImageMessage.h"
#import "MessageData.h"
#import "User.h"

@implementation ImageMessage {
    UIImage* _image;
}

-(instancetype)initWithImage:(UIImage*)image user:(User*)user conversation:(Conversation *)conversation {
    if (self = [super initWithUser:user conversation:conversation]) {
        _internals.messageImage = UIImagePNGRepresentation(image);
        _internals.messageType = [NSNumber numberWithInt:MTImage];
    }
    return self;
}

-(UIImage*)image {
    if (!_image) {
        _image = [UIImage imageWithData:_internals.messageImage]; //for speed up. Memory needs to be optimized somehow there
    }
    return _image;
}

-(JSQMessage*)JSQMessage {
    if (!_JSQMessage) {
        JSQPhotoMediaItem* mediaItem = [[JSQPhotoMediaItem alloc] initWithImage:self.image];
        mediaItem.appliesMediaViewMaskAsOutgoing = [self.user isEqual:[User currentUser]];
        _JSQMessage = [[JSQMessage alloc] initWithSenderId:self.user.uid
                                  senderDisplayName:self.user.name
                                               date:self.date
                                              media:mediaItem];
    }
    return _JSQMessage;
}

@end
