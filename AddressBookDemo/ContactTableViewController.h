//
//  ContactTableViewController.h
//  AddressBookDemo
//
//  Created by Rajesh on 16/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactTableViewController : UITableViewController
@property NSMutableArray* arrayContacts;
-(void)readAllContacts;
@end
