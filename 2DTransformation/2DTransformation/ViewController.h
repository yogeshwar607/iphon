//
//  ViewController.h
//  2DTransformation
//
//  Created by Rajesh on 17/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
- (IBAction)onScale:(id)sender;
- (IBAction)onRotate:(id)sender;

- (IBAction)onTranslate:(id)sender;
@end

