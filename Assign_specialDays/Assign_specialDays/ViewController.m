//
//  ViewController.m
//  Assign_specialDays
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"
#import "DataBaseManager.h"
#import "SpecialDay.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize textContactNo,textEmail,textName,segmentType,labelDate,myImageView,datePicker;
NSNumber *itime;
NSData *data;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.textContactNo.delegate=self;
    self.textName.delegate=self;
    self.textEmail.delegate=self;

    
    DataBaseManager *dbManager=[[DataBaseManager alloc]init];
    [dbManager copyDBinDocFolder];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSave:(id)sender {
    
    
    DataBaseManager *databaseManager=[[DataBaseManager alloc]init];
   
    NSString *dayType=@"";
    if(segmentType.selectedSegmentIndex==0)
    {
        dayType=@"birthday";
    }
    if(segmentType.selectedSegmentIndex==1)
    {
        dayType=@"anniversary";
    }
    
     itime=@(floor([[NSDate date] timeIntervalSince1970 ]));
    

    NSString *imgName=[NSString stringWithFormat:@"%@.png",itime];

    
   
  
    NSDate *d=datePicker.date;
    NSDateFormatter *format=[[NSDateFormatter alloc]init];
    [format setDateFormat:@"dd-MM-yyyy"];
    
    NSString *str=[format stringFromDate:d];
    labelDate.text=str;
    
   SpecialDay *sd=[[SpecialDay alloc]initWithName:textName.text andEmail:textEmail.text andContactNo:textContactNo.text andDayType:dayType andDate:str andImageName:[NSString stringWithFormat:@"%@",imgName]];
    
//    NSLog(@"%@",textName.text);
//     NSLog(@"%@",textEmail.text);
//     NSLog(@"%@",textContactNo.text);
//    NSLog(@"%@",dayType);
//    NSLog(@"%@",str);
//     NSLog(@"%@",imgName);
    
    //writing image to file
    
    // get path doc doc dir

    NSArray *pathArray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    NSString *docDirPath=[pathArray objectAtIndex:0];
    
    // image file path
    
    
    NSString *strFilePath=[docDirPath stringByAppendingPathComponent:imgName];
     [data writeToFile:strFilePath atomically:YES];
    
    NSLog(@"%@",strFilePath);
    
    
    
    int result=[databaseManager insertSpecialDays:sd];
   NSLog(@"%d",result);

    
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
    UIImage *img=[info objectForKey:UIImagePickerControllerEditedImage];
    
    myImageView.image=img;
    [picker dismissViewControllerAnimated:true completion:nil];
    
    
    // conver image to NSdata
    
    data=UIImagePNGRepresentation(img);
    
    // NSdata in file
    
    
    
}

    
    





-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}
@end
