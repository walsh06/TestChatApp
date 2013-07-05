//
//  LoginViewController.h
//  TestChatApp
//
//  Created by liam walsh on 02/07/2013.
//  Copyright (c) 2013 liam walsh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Users.h"


@interface LoginViewController : UIViewController{
    UIButton *loginButton;
    UITextField *nameField;
    UITextField *passwordField;
}

@property (nonatomic, retain) IBOutlet UITextField *nameField;
@property (nonatomic, retain) IBOutlet UIButton *loginButton;
@property (nonatomic, retain) IBOutlet UITextField *passwordField;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@end
