//
//  MainViewController.m
//  TestChatApp
//
//  Created by liam walsh on 21/06/2013.
//  Copyright (c) 2013 liam walsh. All rights reserved.
//

#import "MainViewController.h"
#import "T5Pusher.h"
#import "SignalR.h"

@interface MainViewController ()

@end

@implementation MainViewController
@synthesize messageView, messageField, sendButton, logoutButton;

T5Pusher *myLib;

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //messageField.delegate = self;

    myLib = [T5Pusher alloc];    //creates library instance
    [myLib setPusherUrl:@"http://5985a0af836b42e0b13d5760fcbb96b2.cloudapp.net"];//sets pusher url
    
    
    [myLib connectionBind:@"connectedToHub":@"connected"];
    [myLib connectionBind:@"connectionFailed":@"connectionattemptfailed"];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(connectedToHub) name:@"connectedToHub" object:myLib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(connectionFailed) name:@"connectionFailed" object:myLib];

    //stores method name for call from T5Pusher, stores Key for data access
    //sets Notification center to respond when processName is called in a notification
    [myLib bind:@"messageReceived": @"mystuff"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(messageReceived:) name:@"messageReceived" object:myLib];
    
    [myLib startConnection:@"liamkey"];//starts the connection with the hub

    //sets button methods
    [sendButton addTarget:self action:@selector(buttonPressSend:)forControlEvents:UIControlEventTouchDown];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [myLib stopConnection];
    self.messageView.text = @"";
}


//hides keyboard on button press
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)buttonPressSend:(id)sender
{
    NSArray *message = [NSArray arrayWithObjects:messageField.text,nil];
    [myLib pushMessage:message:@"messageReceived"];
    [messageField resignFirstResponder];
    messageField.text = @"";
}

-(void)connectedToHub
{
    self.messageView.text = @"Connected to T5Pusher\n";
}

-(void)connectionFailed
{
    self.messageView.text = @"Failed to connect\n";
}

-(void)messageReceived:(NSNotification *)data
{
    NSArray *newArray = [[data userInfo] objectForKey:@"mystuff"];
    NSString *messageViewText = [NSString stringWithFormat:@"%@%@\n",messageView.text, [newArray objectAtIndex:0]];
    self.messageView.text = messageViewText;
}

-(void)passKey:(NSString *)uesrKey
{
    //key = userKey
}

@end