//
//  LocationMessage.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 29.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "LocationMessage.h"
#import "MessageData.h"
#import "User.h"

@implementation LocationMessage

-(instancetype)initWithLocation:(CLLocation*)location user:(User*)user conversation:(Conversation *)conversation {
    if (self = [super initWithUser:user conversation:conversation]) {
        _internals.messageType = [NSNumber numberWithInt:MTLocation];
        _internals.latitude = [NSNumber numberWithDouble:location.coordinate.latitude];
        _internals.longitude = [NSNumber numberWithDouble:location.coordinate.longitude];
    }
    return self;
}

-(CLLocation*)location {
    return [[CLLocation alloc] initWithLatitude:[_internals.latitude doubleValue]
                                      longitude:[_internals.longitude doubleValue]];
}

-(JSQMessage*)JSQMessage {
    if (!_JSQMessage) {
        JSQLocationMediaItem* mediaItem = [[JSQLocationMediaItem alloc] init];
        [mediaItem setLocation:self.location withCompletionHandler:nil];
        mediaItem.appliesMediaViewMaskAsOutgoing = [self.user isEqual:[User currentUser]];
        _JSQMessage = [[JSQMessage alloc] initWithSenderId:self.user.uid
                                  senderDisplayName:self.user.name
                                               date:self.date
                                              media:mediaItem];
    }
    return _JSQMessage;
}

@end
