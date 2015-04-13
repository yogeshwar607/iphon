//
//  HomeViewController.h
//  MultiScreenApp
//
//  Created by Rajesh on 09/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textNum;

- (IBAction)onSend:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lableResult;


@end
