//
//  ViewController.h
//  MessageUiFramework
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController<MFMailComposeViewControllerDelegate>
- (IBAction)onSend:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textemail;
@property (weak, nonatomic) IBOutlet UITextView *textBody;

- (IBAction)onSmssend:(id)sender;




@end

