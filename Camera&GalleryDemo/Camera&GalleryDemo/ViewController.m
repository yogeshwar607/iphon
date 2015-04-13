//
//  ViewController.m
//  Camera&GalleryDemo
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onGallery:(id)sender {
    
    
    
    // instantiate image picker controlle
    
    UIImagePickerController *pickerCon=[[UIImagePickerController alloc]init];
    
    [pickerCon setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    pickerCon.allowsEditing=true;
    
    // apply delegates
    
    pickerCon.delegate=self;
    
    // show the controller
    
    [self presentViewController:pickerCon animated:true completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image=[info objectForKey:UIImagePickerControllerEditedImage];
    
}


- (IBAction)onCamera:(id)sender {
}
@end
