//
//  ImageMessage_JSQMessage.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 29.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import <JSQMessagesViewController/JSQMessages.h>
#import "ImageMessage_JSQMessage.h"

#import "User.h"

@implementation ImageMessage (JSQMessage)

-(JSQMessage*)JSQMessage {
    return [[JSQMessage alloc] initWithSenderId:self.user.uid
                              senderDisplayName:self.user.name
                                           date:self.date
                                          media:[[JSQPhotoMediaItem alloc] initWithImage:self.image]];
}

@end
