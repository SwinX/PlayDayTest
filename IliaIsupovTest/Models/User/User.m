//
//  User.m
//  
//
//  Created by Ilia Isupov on 28.04.15.
//
//

#import <MagicalRecord/CoreData+MagicalRecord.h>
#import "User.h"
#import "User_UserDataAccess.h"

#import "UserData.h"

static User* _currentUser = nil;

@implementation User

+(User*)currentUser {
    @synchronized(self) {
        if (!_currentUser) {
            UserData* currentUserData = [UserData MR_findFirstByAttribute:@"isCurrentUser" withValue:[NSNumber numberWithBool:YES]];
            if (currentUserData) {
                _currentUser = [[User alloc] initWithUserData:currentUserData];
            }
        }
        return _currentUser;
    }
}

+(void)setCurrentUser:(User*)user {
    @synchronized(self) {
        if (_currentUser != user) {
            [_currentUser userData].isCurrentUser = [NSNumber numberWithBool:NO];
            [user userData].isCurrentUser = [NSNumber numberWithBool:YES];
            _currentUser = user;
        }
    }
}

-(instancetype)init {
    if (self = [super init]) {
        _internals = [UserData MR_createInContext:[NSManagedObjectContext MR_defaultContext]];
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

-(BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    User* another = (User*)object;
    return [self.uid isEqualToString:another.uid];
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
