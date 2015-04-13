//
//  ViewController.h/Users/rajesh/Desktop/wimciosapps/iphon/FacebookIntegration/FacebookIntegration/ViewController.h
//  FacebookIntegration
//
//  Created by Rajesh on 20/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
@interface ViewController : UIViewController<FBLoginViewDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
- (IBAction)onUpdateStatus:(id)sender;
- (IBAction)onPicUpload:(id)sender;
@property UIImage *img;
@end

