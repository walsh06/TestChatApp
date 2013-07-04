//
//  LoginViewController.m
//  TestChatApp
//
//  Created by liam walsh on 02/07/2013.
//  Copyright (c) 2013 liam walsh. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize loginButton, nameField, passwordField;

NSString *key;

/*
//send the name entered to chatView
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    mainViewController *mainView = segue.destinationViewController;
    [mainView passKey:key];
}
*/

//checks if a name is entered
- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([nameField.text length] > 0 && [passwordField.text length] > 0)
    {
        //NSString *name = nameField.text;
        //NSString *password = passwordField.text;
          
        /*
        VALIDATION OF USER IS HERE
         
         if valid
            return true
         else
            return false
        */
        
        return true;
    }
    else
    {
        //creates an alert dialog
        //informing user of the error
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed Login" message:@"Please fill in both fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return false;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //nameField.delegate = self;
    //passwordField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
