//
//  Message.h
//  
//
//  Created by Ilia Isupov on 28.04.15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <JSQMessagesViewController/JSQMessages.h>

@class User;
@class Conversation;
@class MessageData;

typedef enum _MessageType {
    MTText = 0,
    MTImage,
    MTLocation
}MessageType;

@interface Message : NSObject {
    MessageData* _internals;
    JSQMessage* _JSQMessage;
}

@property (nonatomic, readonly) NSString* uid;
@property (nonatomic, readonly) MessageType type;
@property (nonatomic, readonly) NSDate* date;

@property (nonatomic, readonly) NSString* conversationId;

@property (nonatomic, readonly) User *user;

@property (nonatomic, readonly) JSQMessage* JSQMessage;

-(instancetype)init NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithMessageData:(MessageData*)data NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithUser:(User*)user conversation:(Conversation*)conversation;

@end
