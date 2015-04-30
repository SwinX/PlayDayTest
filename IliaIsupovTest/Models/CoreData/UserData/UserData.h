//
//  UserData.h
//  
//
//  Created by Ilia Isupov on 30.04.15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ConversationData, MessageData;

@interface UserData : NSManagedObject

@property (nonatomic, retain) NSData * avatar;
@property (nonatomic, retain) NSNumber * isCurrentUser;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * uid;
@property (nonatomic, retain) NSSet *messages;
@property (nonatomic, retain) NSSet *conversations;
@end

@interface UserData (CoreDataGeneratedAccessors)

- (void)addMessagesObject:(MessageData *)value;
- (void)removeMessagesObject:(MessageData *)value;
- (void)addMessages:(NSSet *)values;
- (void)removeMessages:(NSSet *)values;

- (void)addConversationsObject:(ConversationData *)value;
- (void)removeConversationsObject:(ConversationData *)value;
- (void)addConversations:(NSSet *)values;
- (void)removeConversations:(NSSet *)values;

@end
