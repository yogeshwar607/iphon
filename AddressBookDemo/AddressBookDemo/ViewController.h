//
//  ViewController.h
//  AddressBookDemo
//
//  Created by Rajesh on 16/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import <AddressBook/AddressBook.h>

@interface ViewController : UIViewController<ABPeoplePickerNavigationControllerDelegate,ABNewPersonViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lableNumber;

- (IBAction)selectContact:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lableContact;

- (IBAction)onAdd:(id)sender;

@end

