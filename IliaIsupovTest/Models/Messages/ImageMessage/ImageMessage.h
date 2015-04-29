//
//  ImageMessage.h
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 29.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

@import UIKit;

#import "Message.h"

@interface ImageMessage : Message

@property (nonatomic, readonly) UIImage* image;

-(instancetype)initWithImage:(UIImage*)image user:(User*)user;

@end
