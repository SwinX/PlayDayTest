//
//  Message.h
//  
//
//  Created by Ilia Isupov on 28.04.15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;
@class MessageData;

typedef enum _MessageType {
    MTText = 0,
    MTImage,
    MTLocation
}MessageType;

@interface Message : NSObject {
    MessageData* _internals;
}

@property (nonatomic, readonly) NSString* uid;
@property (nonatomic, readonly) User *user;
@property (nonatomic, readonly) MessageType type;

-(instancetype)initWithUser:(User*)user;
-(instancetype)initWithMessageData:(MessageData*)data;

@end
