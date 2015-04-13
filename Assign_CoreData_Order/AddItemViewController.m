//
//  AddItemViewController.m
//  Assign_CoreData_Order
//
//  Created by Rajesh on 12/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "AddItemViewController.h"

@interface AddItemViewController ()

@end

@implementation AddItemViewController
@synthesize textItemName,textItemPrice,object;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onDone:(id)sender {
    
    // get object of managed contex;;;;
    
    UIApplication *app=[UIApplication sharedApplication];
    id appDelegate=[app delegate];
    
    NSManagedObjectContext *managedContex=[appDelegate managedObjectContext];
    
    NSString *itemName=textItemName.text ;
    
       
    NSNumber *itemPrice=[NSNumber numberWithFloat:[textItemPrice.text floatValue]];
    
    
    // create object to be stored in dataStore  if it insert operation
    
    if(object ==nil)
    {
        object=[NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:managedContex];
        
    }
    
    // set attribute values in object ;;;  ;;
    
   
    [object setValue:itemName forKey:@"itemName"];
    [object setValue:itemPrice forKey:@"itemPrice"];
    
    // save current context to persistent storage
    
    
    NSError *err=nil;
    BOOL isSaved=[managedContex save:&err];
    if (!isSaved) {
        NSLog(@"error:%@",err);
        
    }
    else
        NSLog(@"saveddd  ...");
    
    
    // hide current controller
    
    [self.navigationController popViewControllerAnimated:true];
    

    
}
@end
