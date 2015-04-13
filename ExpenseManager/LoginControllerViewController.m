//
//  LoginControllerViewController.m
//  ExpenseManager
//
//  Created by Rajesh on 19/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "LoginControllerViewController.h"
#import "ManagerHomeTableViewController.h"
#import "MemberHomeViewController.h"
#import "ProfileViewController.h"

@interface LoginControllerViewController ()

@end

@implementation LoginControllerViewController
@synthesize textEmail,textPassword;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onLogin:(id)sender {
    
    NSString *userName=textEmail.text;
    NSString *password=textPassword.text;
    
    
    NSString *strUrl=[NSString stringWithFormat:@"http://192.168.76.134:8080/ExpenseWebApp/LoginService?email=%@&password=%@",userName,password];
    NSURL *url=[NSURL URLWithString:strUrl];
    
    NSLog(@"%@",url);
    
    NSURLRequest *request=[NSURLRequest requestWithURL:url];

    
        
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        NSError *error;
        
        NSMutableDictionary *mainDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        
        NSString *result=[mainDict objectForKey:@"result"];
        
        
        NSLog(@"%@",result);
        
        if ([result isEqual:@"success"] ) {
            
            NSDictionary *data=[mainDict objectForKey:@"data"];
            
            NSString *type=[data objectForKey:@"user_type"];
            
           
            
            if([type isEqual:@"manager"])
            {
                
                
                ManagerHomeTableViewController *manager=[self.storyboard instantiateViewControllerWithIdentifier:@"homemanager"];
                
                [self.navigationController pushViewController:manager animated:true];
                 NSLog(@"%@",type);
                manager.manDetails=data;
            }
          
            if([type isEqual:@"member"])
             {
                 
                 MemberHomeViewController *member=[self.storyboard instantiateViewControllerWithIdentifier:@"homemember"];
                 [self.navigationController pushViewController:member animated:true];
                 
                  NSLog(@"%@",type);
                 member.memDetails=data;
                 
             }
        }
        
        else
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Invalid User" delegate:nil cancelButtonTitle:@"Try Again" otherButtonTitles:nil, nil];
            
            [alert show];
        }
    

    }];
//       
}

- (IBAction)onSignUp:(id)sender {
}
@end
