//
//  UserData.h
//  
//
//  Created by Ilia Isupov on 29.04.15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MessageData;

@interface UserData : NSManagedObject

@property (nonatomic, retain) NSString* uid;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSData * avatar;
@property (nonatomic, retain) NSNumber * isCurrentUser;
@property (nonatomic, retain) NSSet *messages;
@end

@interface UserData (CoreDataGeneratedAccessors)

- (void)addMessagesObject:(MessageData *)value;
- (void)removeMessagesObject:(MessageData *)value;
- (void)addMessages:(NSSet *)values;
- (void)removeMessages:(NSSet *)values;

@end
