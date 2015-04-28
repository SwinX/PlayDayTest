//
//  User.m
//  
//
//  Created by Ilia Isupov on 28.04.15.
//
//

#import "User.h"
#import "Message.h"

static User* _currentUser = nil;

@implementation User

@dynamic name;
@dynamic avatar;
@dynamic messages;

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

@end
