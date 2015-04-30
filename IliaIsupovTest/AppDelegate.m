//
//  AppDelegate.m
//  IliaIsupovTest
//
//  Created by Ilia Isupov on 28.04.15.
//  Copyright (c) 2015 Test. All rights reserved.
//

#import "AppDelegate.h"
#import <MagicalRecord/CoreData+MagicalRecord.h>

#import "User.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupCoreDataStack];
    return YES;
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
}

@end
