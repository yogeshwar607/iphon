//
//  ViewController.m
//  AddressBookDemo
//
//  Created by Rajesh on 16/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lableContact;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)selectContact:(id)sender {
    
    ABPeoplePickerNavigationController *peopleCon=[[ABPeoplePickerNavigationController alloc]init];
    
    peopleCon.peoplePickerDelegate=self;
    
    [self presentViewController:peopleCon animated:true completion:nil];
    
}

-(void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person
{
    
    
    NSString *fname=(__bridge_transfer  NSString*)ABRecordCopyValue(person, kABPersonFirstNameProperty);
   
    
    NSString *lname=(__bridge_transfer  NSString*)ABRecordCopyValue(person, kABPersonLastNameProperty);
    
   
    
    ABMultiValueRef phoneRef = ABRecordCopyValue(person, kABPersonPhoneProperty);
    NSString *strPhone=(__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(phoneRef, 0);
    
       NSLog(@"%@",strPhone);
    
    if(lname==nil||fname==nil)
    {
         NSLog(@"Fields are  nil");
    }
    else
        
    lableContact.text=[fname stringByAppendingString:lname];
   _lableNumber.text=strPhone;
    
    NSLog(@"did select ");
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    // reda data from person record
    
//    NSString *fname=(__bridge_transfer  NSString*)ABRecordCopyValue(person, kABPersonFirstNameProperty);
//    
//    NSString *lname=(__bridge_transfer  NSString*)ABRecordCopyValue(person, kABPersonLastNameProperty);
//
//    lableContact.text=[fname stringByAppendingString:lname];
     NSLog(@"hii");
    
    // [peoplePicker dismissViewControllerAnimated:true completion:nil];
   
    
    return NO;
}

-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    NSLog(@"did cancel");
    
    [peoplePicker dismissViewControllerAnimated:true completion:nil];
}


- (IBAction)onAdd:(id)sender {
    
    ABNewPersonViewController *newCon=[[ABNewPersonViewController alloc]init];
    
    newCon.newPersonViewDelegate=self;
    [self.navigationController pushViewController:newCon animated:true];

    
}

-(void)newPersonViewController:(ABNewPersonViewController *)newPersonView didCompleteWithNewPerson:(ABRecordRef)person
{
    [self.navigationController popViewControllerAnimated:true];
    
}

@end

