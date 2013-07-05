//
//  MainAppDelegate.h
//  testCoreData
//
//  Created by liam walsh on 05/07/2013.
//  Copyright (c) 2013 liam walsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
