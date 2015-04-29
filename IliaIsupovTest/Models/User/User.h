//
//  User.h
//  
//
//  Created by Ilia Isupov on 28.04.15.
//
//

@import UIKit;

@class Message;
@class UserData;

@interface User : NSObject {
    UserData* _internals;
}

@property (nonatomic, readonly) NSString* uid;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, strong) UIImage* avatar;

+(User*)currentUser;
+(void)setCurrentUser:(User*)user;

-(instancetype)init NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithUserData:(UserData*)userData NS_DESIGNATED_INITIALIZER;
-(instancetype)initWithName:(NSString*)name avatar:(UIImage*)avatar;

@end

