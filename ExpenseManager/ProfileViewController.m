//
//  ProfileViewController.m
//  ExpenseManager
//
//  Created by Rajesh on 20/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize managerDetails;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
    NSLog(@"deee%@",managerDetails);
    
    _textAddress.text=[managerDetails objectForKey:@"address"];
    _textContact.text=[managerDetails objectForKey:@"contact"];
    _textName.text=[managerDetails objectForKey:@"name"];
    _textEmail.text=[managerDetails objectForKey:@"email"];
    _textOccupation.text=[managerDetails objectForKey:@"occupation"];
    _textUserType.text=[managerDetails objectForKey:@"user_type"];
 //   _textuserId.text=[NSString stringWithFormat:@"%d",[managerDetails objectForKey:@"user_id"]];
    
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

@end
