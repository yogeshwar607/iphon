//
//  ViewController.h
//  NSThreadDemo
//
//  Created by Rajesh on 13/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textData;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *lableFact;
@property (weak, nonatomic) IBOutlet UILabel *lable1ToN;
- (IBAction)onFact:(id)sender;
- (IBAction)on1ToN:(id)sender;
-(void)calcFact;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
-(void)calc1ToN;
@end
