//
//  MessageData.h
//  
//
//  Created by Ilia Isupov on 29.04.15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class UserData;

@interface MessageData : NSManagedObject

@property (nonatomic, retain) NSString* uid;
@property (nonatomic, retain) NSNumber * messageType;
@property (nonatomic, retain) NSDate * messageDate;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSData * messageImage;
@property (nonatomic, retain) NSString * messageText;
@property (nonatomic, retain) UserData *user;

@end
