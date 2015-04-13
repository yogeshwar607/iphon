//
//  ViewController.m
//  FacebookIntegration
//
//  Created by Rajesh on 20/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"
#import <FacebookSDK/FacebookSDK.h>
@interface ViewController ()

@end

@implementation ViewController
@synthesize nameLabel,profilePictureView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FBLoginView *loginView = [[FBLoginView alloc] initWithReadPermissions:@[@"public_profile", @"email", @"user_friends",@"publish_actions"]];
    loginView.center = self.view.center;
    [self.view addSubview:loginView];
    loginView.delegate=self;
    
    
}
-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    NSLog(@"userdata:%@",user);
 self.profilePictureView.profileID=user.id;
  
    NSLog(@"%@",user.name);
    
    self.nameLabel.text=user.name;
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onUpdateStatus:(id)sender {
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Change FB Status" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"ok", nil];
    
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alert show];
    
}

- (IBAction)onPicUpload:(id)sender {
    
    
    NSMutableDictionary* params = [[NSMutableDictionary alloc] init];
    
    [params setObject:@"this is my ios app pic upload" forKey:@"message"];
    
    
    _img=[UIImage imageNamed:@"ad.jpg"];
    
    [params setObject:UIImageJPEGRepresentation(_img, normal) forKey:@"picture"];
  
    //_shareToFbBtn.enabled = NO; //for not allowing multiple hits
    
    [FBRequestConnection startWithGraphPath:@"me/photos"
                                 parameters:params
                                 HTTPMethod:@"POST"
                          completionHandler:^(FBRequestConnection *connection,
                                              id result,
                                              NSError *error)
     {
         }];
    
    
    
//    UIImage *img = [UIImage imageNamed:@"ad.jpg"];
//    
//    [FBRequestConnection startForUploadPhoto:img
//                           completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//                               
//                               NSLog(@"Facebook posting %@",result);
//                               NSLog(@"Facebook posting %@",error);
//                               
//                           }];
    

    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex==1) {
        NSString *strStatus=[alertView textFieldAtIndex:0].text;
        
        // update the user status in FB
        
        
        [FBRequestConnection startForPostStatusUpdate:strStatus
                                    completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                                        if (!error) {
                                            // Status update posted successfully to Facebook
                                            NSLog(@"result: %@", result);
                                        } else {
                                                NSLog(@"%@", error.description);
                                        }
                                    }];
        
    }
    
    
}

@end
