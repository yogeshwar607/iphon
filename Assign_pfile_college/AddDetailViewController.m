//
//  AddDetailViewController.m
//  Assign_pfile_college
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "AddDetailViewController.h"

@interface AddDetailViewController ()

@end

@implementation AddDetailViewController
@synthesize textCourseFees,textCoursename,textDuration;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"%@",_listPath);
    
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



- (IBAction)onDone:(id)sender {
    
    
    
    
}
@end
