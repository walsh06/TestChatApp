//
//  LoginViewController.m
//  TestChatApp
//
//  Created by liam walsh on 02/07/2013.
//  Copyright (c) 2013 liam walsh. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"

#import "Users.h"



@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize loginButton, nameField, passwordField, managedObjectContext;

//send the name entered to chatView
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MainViewController *mainView = segue.destinationViewController;
    [mainView setUserInfo:nameField.text:passwordField.text];
    //[mainView setManageObjectContext:self.managedObjectContext];
}


//checks if a name is entered
- (BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([nameField.text length] > 0 && [passwordField.text length] > 0)
    {
        //NSString *name = nameField.text;
        //NSString *password = passwordField.text;
        
        
       NSManagedObjectContext *context = [self managedObjectContext];
        
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Users" inManagedObjectContext:context];
        
        [fetchRequest setEntity:entity];
        NSError *error = nil;
        NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
        
        for(Users *user in fetchedObjects)
        {
                if([nameField.text isEqualToString:user.name] && [passwordField.text isEqualToString:user.password])
                {
                    return true;
                }
        }
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failed Login" message:@"Incorrect name and password combination" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return false;
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

    id appDelegate = [(id)[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [appDelegate managedObjectContext];
    //nameField.delegate = self;
    //passwordField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
