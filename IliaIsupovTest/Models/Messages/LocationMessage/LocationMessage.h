//
//  LocationMessage.h
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 29.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

@import CoreLocation;

#import "Message.h"

@interface LocationMessage : Message

@property (nonatomic, readonly) CLLocation* location;

-(instancetype)initWithLocation:(CLLocation*)location user:(User*)user conversation:(Conversation*)conversation;

@end
