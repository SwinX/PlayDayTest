//
//  Message.h
//  
//
//  Created by Ilia Isupov on 28.04.15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NSManagedObject;

@interface Message : NSManagedObject

@property (nonatomic, retain) NSNumber * messageType;
@property (nonatomic, retain) NSDate * messageDate;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSManagedObject *user;

@end
