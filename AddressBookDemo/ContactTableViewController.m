//
//  ContactTableViewController.m
//  AddressBookDemo
//
//  Created by Rajesh on 16/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ContactTableViewController.h"
#import <AddressBook/AddressBook.h>

@interface ContactTableViewController ()

@end

@implementation ContactTableViewController
@synthesize arrayContacts;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    arrayContacts=[[NSMutableArray alloc]init];
    [self readAllContacts];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [arrayContacts count];
}



-(void)readAllContacts
{
    // create addressbook reference
    
    ABAddressBookRef addressBook=nil;
    
    // read all records from addressbook
    
    
    
    if(ABAddressBookGetAuthorizationStatus()==kABAuthorizationStatusNotDetermined)
    {
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            
            
            if(granted)
            {
                NSLog(@"Access granted");
            }
            else
               
            {
                NSError *er=(__bridge_transfer NSError*)error;
            NSLog(@"Error:%@",er);
            }
        });
        
        
    }
    
    else if(ABAddressBookGetAuthorizationStatus()==kABAuthorizationStatusAuthorized)
        
    {
        // user has previously givenacces
        
        NSLog(@"Already acces");
        
        
    }
    
    
    else{
        // user has denied
        
        NSLog(@"USer DEnied, go to priavcy settings");

    }
    
     addressBook=ABAddressBookCreateWithOptions(NULL, NULL);
    
    if(addressBook)
    {
       
        
        // read all records from addres book
        
        CFArrayRef arrayRef=ABAddressBookCopyArrayOfAllPeople(addressBook);
        
        // convert c based array to objective-c NSArray
        
        NSArray *records=(__bridge_transfer NSArray *)arrayRef;
        
        NSLog(@"total :%lu",(unsigned long)[records count]);

        for (int i=0; i<[records count]; i++) {
            
        ABRecordRef recRef=(__bridge_retained ABRecordRef)[records objectAtIndex:i];
            
         // get name from ith record
            
        NSString *fname=(__bridge_transfer NSString *)ABRecordCopyValue
            (recRef, kABPersonFirstNameProperty);
            
            NSString *lname=(__bridge_transfer NSString *)ABRecordCopyValue
            (recRef, kABPersonLastNameProperty);

            NSLog(@"%@%@",fname,lname);
            
            // read phone number
            
            NSString *phonNumber=@"";
            NSString *email=@"";

            
          ABMultiValueRef phoneRef = ABRecordCopyValue(recRef, kABPersonPhoneProperty);
            ABMultiValueRef emailRef= ABRecordCopyValue(recRef, kABPersonEmailProperty);
            
          int n=  ABMultiValueGetCount(phoneRef);
            int k=ABMultiValueGetCount(emailRef);
            
            NSLog(@"phones %d",n);
            
            // get allphone number of records
            
            for (int j=0; j<n||j<k; j++) {
                
                // get j th phone Number
            if(j<n)
            {
                NSString *strPhone=(__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(phoneRef, j);
                
                phonNumber=[NSString stringWithFormat:@"%@,%@",phonNumber,strPhone];
            }
                if(j<k)
                {
            NSString *strEmail=(__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(emailRef, j);
                
                email=[NSString stringWithFormat:@"%@,%@",email,strEmail];
                }
                
            }
            
            NSLog(@"all phone number %@",phonNumber);
            NSLog(@"all email %@",email);

            
            NSString *strData=[NSString stringWithFormat:@"%@:%@:%@:%@",fname,lname,phonNumber,email];
                               
        [arrayContacts addObject:strData];
                             
        [self.tableView reloadData];
        }
    }
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text=[arrayContacts objectAtIndex:indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
