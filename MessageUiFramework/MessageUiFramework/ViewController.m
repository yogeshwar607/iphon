//
//  ViewController.m
//  MessageUiFramework
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>

@interface ViewController ()

@end

@implementation ViewController
@synthesize textBody,textemail;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSend:(id)sender {
    
    
    MFMailComposeViewController *mailCon=[[MFMailComposeViewController alloc]init];
    
    mailCon.mailComposeDelegate=self;
    
    [mailCon setMessageBody:textBody.text isHTML:false];
    
    NSLog(@"%@",textBody);
    
    [mailCon setSubject:@"No i am not going to ... "];
    
    
    // create an array of recipents
    
    NSArray *recipents=[[NSArray alloc]initWithObjects:@"xyz@ymail.com ",@"www@gmail.com",nil];
    
    [mailCon setToRecipients:recipents];
    
    
    //_____----------->>>>><<<<<<<<<<
    
    
    [self presentViewController:mailCon animated:true completion:nil];
}


- (IBAction)onSmssend:(id)sender {
    
    MFMessageComposeViewController *msgCon=[[MFMessageComposeViewController alloc]init];
    
    msgCon.
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    
    if(result==MFMailComposeResultSent)
    {
        NSLog(@"sent");
    }
    
    
    if(result==MFMailComposeResultCancelled)
    {
        NSLog(@"canceled");
    }
    
    if(result==MFMailComposeResultSaved)
    {
        NSLog(@"saved");
    }
    
    [controller dismissViewControllerAnimated:false completion:nil];
    
}


@end
