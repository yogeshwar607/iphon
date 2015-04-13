//
//  FirstViewController.h
//  FirstApp2
//
//  Created by Rajesh on 06/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic,strong) IBOutlet UITextField *textName;
@property (nonatomic,strong) IBOutlet UIButton *buttonHello;
@property (nonatomic,strong) IBOutlet UILabel *lableHello;

-(IBAction)OnSayHello:(id)sender;

@end
