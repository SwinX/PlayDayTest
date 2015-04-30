//
//  ConversationData.h
//  
//
//  Created by Ilia Isupov on 30.04.15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MessageData, UserData;

@interface ConversationData : NSManagedObject

@property (nonatomic, retain) NSString * uid;
@property (nonatomic, retain) NSSet *messages;
@property (nonatomic, retain) NSSet *users;
@end

@interface ConversationData (CoreDataGeneratedAccessors)

- (void)addMessagesObject:(MessageData *)value;
- (void)removeMessagesObject:(MessageData *)value;
- (void)addMessages:(NSSet *)values;
- (void)removeMessages:(NSSet *)values;

- (void)addUsersObject:(UserData *)value;
- (void)removeUsersObject:(UserData *)value;
- (void)addUsers:(NSSet *)values;
- (void)removeUsers:(NSSet *)values;

@end
