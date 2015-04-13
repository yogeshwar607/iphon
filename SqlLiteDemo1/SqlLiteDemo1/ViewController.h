//
//  ViewController.h
//  SqlLiteDemo1
//
//  Created by Rajesh on 11/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UITextField *textMarks;
@property (weak, nonatomic) IBOutlet UITextField *textSubCode;
- (IBAction)onDone:(id)sender;

@end
