//
//  ViewController.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 28.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "MainViewController.h"

NSString* const SelfSenderId = @"UserSenderId";
NSString* const SelfDisplayName = @"User";

NSString* const BotSenderId = @"BotSenderId";
NSString* const BotDisplayName = @"BotDisplayName";

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.senderId = SelfSenderId;
    self.senderDisplayName = SelfDisplayName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
