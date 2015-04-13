//
//  ViewController.h
//  Camera&GalleryDemo
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)onGallery:(id)sender;

- (IBAction)onCamera:(id)sender;

@end

