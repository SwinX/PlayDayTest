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

#import "Message_JSQMessage.h"
#import "TextMessage_JSQMessage.h"
#import "LocationMessage_JSQMessage.h"

@interface MainViewController (Private)

-(void)setupDemoDataStructuresIfNeeded;
-(void)setupCurrentUser;
-(Robot*)setupRobot;
-(Conversation*)setupConversation;
-(void)setupMessageBubbles;

@end

@interface MainViewController ()<ConversationObserver>

@end

@implementation MainViewController {
    Conversation* _conversation;
    Robot* _robot;
    
    JSQMessagesBubbleImage* _incomingMessageBubble;
    JSQMessagesBubbleImage* _outgoingMessageBubble;
}

#pragma mark - UIViewController lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupDemoDataStructuresIfNeeded];
    _conversation = [self setupConversation];
    _robot = [self setupRobot];
    [self setupMessageBubbles];
    [_conversation addObserver:self];
    
    self.senderId = [User currentUser].uid;
    self.senderDisplayName = [User currentUser].name;
    self.collectionView.collectionViewLayout.incomingAvatarViewSize = CGSizeZero;
    self.collectionView.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero;
    self.showLoadEarlierMessagesHeader = NO;
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.collectionView.collectionViewLayout.springinessEnabled = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    _conversation = nil;
}

#pragma mark - ConversationObserver implementation
-(void)user:(User *)user didSendMessage:(Message *)message {
    [self finishReceivingMessageAnimated:YES];
}

#pragma mark - JSQMessagesViewController method overrides

#pragma mark - JSQMessagesViewController method overrides
-(void)didPressSendButton:(UIButton *)button withMessageText:(NSString *)text senderId:(NSString *)senderId senderDisplayName:(NSString *)senderDisplayName date:(NSDate *)date {
    [_conversation sendText:text fromUser:[User currentUser]];
    [self finishSendingMessageAnimated:YES];
}

- (void)didPressAccessoryButton:(UIButton *)sender {
    
}

#pragma mark - JSQMessagesCollectionViewDataSource
- (id<JSQMessageData>)collectionView:(JSQMessagesCollectionView *)collectionView messageDataForItemAtIndexPath:(NSIndexPath *)indexPath {
    Message* message = [_conversation.messages objectAtIndex:indexPath.row];
    return [message JSQMessage];
}

- (id<JSQMessageBubbleImageDataSource>)collectionView:(JSQMessagesCollectionView *)collectionView messageBubbleImageDataForItemAtIndexPath:(NSIndexPath *)indexPath {
    Message* message = [_conversation.messages objectAtIndex:indexPath.row];
    if ([message.user isEqual:[User currentUser]]) {
        return _outgoingMessageBubble;
    } else {
        return _incomingMessageBubble;
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _conversation.messages.count;
}

- (UICollectionViewCell *)collectionView:(JSQMessagesCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    JSQMessagesCollectionViewCell *cell = (JSQMessagesCollectionViewCell *)[super collectionView:collectionView cellForItemAtIndexPath:indexPath];
    Message* message = [_conversation.messages objectAtIndex:indexPath.row];
    
    if (message.type == MTText) {
        
        if ([message.user isEqual:[User currentUser]]) {
            cell.textView.textColor = [UIColor blackColor];
        }
        else {
            cell.textView.textColor = [UIColor whiteColor];
        }
        
        cell.textView.linkTextAttributes = @{ NSForegroundColorAttributeName : cell.textView.textColor,
                                              NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle | NSUnderlinePatternSolid) };
    }
    
    return cell;
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

-(void)setupMessageBubbles {
    JSQMessagesBubbleImageFactory *bubbleFactory = [[JSQMessagesBubbleImageFactory alloc] init];
    _incomingMessageBubble = [bubbleFactory incomingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleGreenColor]];
    _outgoingMessageBubble = [bubbleFactory outgoingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleLightGrayColor]];
}

@end
