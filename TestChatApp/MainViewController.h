//
//  MainViewController.h
//  TestChatApp
//
//  Created by liam walsh on 21/06/2013.
//  Copyright (c) 2013 liam walsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
{
    UITextView *messageView;
    UITextField *messageField;
    UIButton *sendButton;
    UIButton *logoutButton;
}
@property (nonatomic, retain) IBOutlet UITextView *messageView;
@property (nonatomic, retain) IBOutlet UITextField *messageField;
@property (nonatomic, retain) IBOutlet UIButton *sendButton;
@property (nonatomic, retain) IBOutlet UIButton *logoutButton;

//-(void)setManageObjectContext:(NSManagedObjectContext *)context;
-(void)setUserInfo:(NSString *)userName:(NSString *)userPassword;
@end
