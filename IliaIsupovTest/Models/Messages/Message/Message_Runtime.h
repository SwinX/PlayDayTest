//
//  Message_Runtime.h
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 30.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "Message.h"

@interface Message(Runtime)

+(Class)messageClassForType:(MessageType)type;

@end
