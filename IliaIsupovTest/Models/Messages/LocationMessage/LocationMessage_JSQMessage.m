//
//  LocationMessage_JSQMessage.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 29.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import <JSQMessagesViewController/JSQMessages.h>
#import "LocationMessage_JSQMessage.h"

#import "User.h"

@implementation LocationMessage (JSQMessage)

-(JSQMessage*)JSQMessage {
    JSQLocationMediaItem* mediaItem = [[JSQLocationMediaItem alloc] initWithLocation:self.location];
    mediaItem.appliesMediaViewMaskAsOutgoing = [self.user isEqual:[User currentUser]];
    return [[JSQMessage alloc] initWithSenderId:self.user.uid
                                             senderDisplayName:self.user.name
                                                          date:self.date
                                                         media:mediaItem];
}

@end
