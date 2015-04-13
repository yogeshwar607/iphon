//
//  MemberHomeViewController.m
//  ExpenseManager
//
//  Created by Rajesh on 19/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "MemberHomeViewController.h"
#import "ProfileViewController.h"

@interface MemberHomeViewController ()

@end

@implementation MemberHomeViewController

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

- (IBAction)onProfileClick:(id)sender {
    
    
    ProfileViewController *profile=[self.storyboard instantiateViewControllerWithIdentifier:@"profile"];
    [self.navigationController pushViewController:profile animated:true];
    
    profile.managerDetails=_memDetails;

}
@end
