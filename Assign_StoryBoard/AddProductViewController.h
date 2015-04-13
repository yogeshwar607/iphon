//
//  AddProductViewController.h
//  Assign_StoryBoard
//
//  Created by Rajesh on 10/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddProductViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textQty;

@property (weak, nonatomic) IBOutlet UITextField *textPrice;
@property (weak, nonatomic) IBOutlet UITextField *textProductname;
- (IBAction)onDone:(id)sender;

@end
