//
//  Users.h
//  TestChatApp
//
//  Created by liam walsh on 05/07/2013.
//  Copyright (c) 2013 liam walsh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Users : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * key;


@end
