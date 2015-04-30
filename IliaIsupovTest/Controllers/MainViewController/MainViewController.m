//
//  ViewController.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 28.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import <MagicalRecord/CoreData+MagicalRecord.h>

#import "MainViewController.h"
#import "Conversation.h"
#import "ConversationData.h"
#import "Message.h"
#import "User.h"
#import "Robot.h"

@interface MainViewController (Private)

-(void)setupDemoDataStructuresIfNeeded;
-(void)setupCurrentUser;
-(Robot*)setupRobot;
-(Conversation*)setupConversation;

@end

@interface MainViewController ()<ConversationObserver>

@end

@implementation MainViewController {
    Conversation* _conversation;
    Robot* _robot;
}

#pragma mark - UIViewController lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDemoDataStructuresIfNeeded];
    _conversation = [self setupConversation];
    _robot = [self setupRobot];
    [_conversation addObserver:self];
    
    self.senderId = [User currentUser].uid;
    self.senderDisplayName = [User currentUser].name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    _conversation = nil;
}



@end

@implementation MainViewController (Private)

-(void)setupDemoDataStructuresIfNeeded {
    if (![ConversationData MR_countOfEntities]) {
        User* human = [[User alloc] initWithName:NSLocalizedString(@"Human", nil)
                                          avatar:nil];
        [User setCurrentUser:human];
        User* robot = [[User alloc] initWithName:NSLocalizedString(@"Robot", nil)
                                          avatar:nil];
        Conversation* conversation = [[Conversation alloc] init];
        [conversation addUser:human];
        [conversation addUser:robot];
        [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
    }
}

-(void)setupCurrentUser {
    if (![User currentUser]) {
        [User setCurrentUser:[[User alloc] initWithName:@"Current user" avatar:nil]];
    }

}

-(Robot*)setupRobot {
    User* robotUser = nil;
    for (User* user in _conversation.users) {
        if (![user isEqual:[User currentUser]]) {
            robotUser = user;
            break;
        }
    }
    Robot* robot = [[Robot alloc] initWithUser:robotUser conversation:_conversation];
    [_conversation addObserver:robot];
    return robot;
}

-(Conversation*)setupConversation {
    return [[Conversation alloc] initWithConversationData:[ConversationData MR_findFirst]];
}

@end
