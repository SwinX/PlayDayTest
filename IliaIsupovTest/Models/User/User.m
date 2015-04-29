//
//  User.m
//  
//
//  Created by Ilia Isupov on 28.04.15.
//
//

#import <MagicalRecord/CoreData+MagicalRecord.h>
#import "User.h"

#import "UserData.h"

static User* _currentUser = nil;

@implementation User

+(User*)currentUser {
    @synchronized(self) {
        return _currentUser;
    }
}

+(void)setCurrentUser:(User*)user {
    @synchronized(self) {
        if (_currentUser != user) {
            _currentUser = user;
        }
    }
}

-(instancetype)init {
    if (self = [super init]) {
        _internals = [UserData MR_createEntity];
        _internals.uid = [[NSUUID UUID] UUIDString];
    }
    return self;
}

-(instancetype)initWithUserData:(UserData*)userData {
    if (self = [super init]) {
        _internals = userData;
    }
    return self;
}


-(instancetype)initWithName:(NSString *)name avatar:(UIImage *)avatar {
    if (self = [self init]) {
        _internals.name = name;
        _internals.avatar = UIImagePNGRepresentation(avatar);
    }
    return self;
}

-(NSString*)uid {
    return _internals.uid;
}

-(NSString*)name {
    return _internals.name;
}

-(void)setName:(NSString *)newName {
    if (![_internals.name isEqualToString:newName]) {
        _internals.name = [newName copy];
    }
}

-(UIImage*)avatar {
    return [UIImage imageWithData:_internals.avatar]; //may cache this if will be considered too slow
}

-(void)setAvatar:(UIImage *)newAvatar {
    NSData* newAvatarData = UIImagePNGRepresentation(newAvatar);
    if (![newAvatarData isEqual:_internals.avatar]) {
        _internals.avatar = newAvatarData;
    }
}

@end
