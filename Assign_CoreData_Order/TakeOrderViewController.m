//
//  TakeOrderViewController.m
//  Assign_CoreData_Order
//
//  Created by Rajesh on 12/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "TakeOrderViewController.h"
#import "DetailsCell.h"

@interface TakeOrderViewController ()

@end

@implementation TakeOrderViewController
@synthesize arrayOrderDetails,myTableView,labelempId,empId,textTableNo;
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
    
    arrayOrderDetails=[[NSMutableArray alloc]init];
    
   // [myTableView registerNib:[UINib nibWithNibName:@"DetailsCell" bundle:nil] forCellReuseIdentifier:@"detailscell"];
    
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    [myTableView reloadData];
   // NSLog(@"%@",arrayOrderDetails);
    
    labelempId.text=empId;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayOrderDetails count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
  

    _object=[arrayOrderDetails objectAtIndex:indexPath.row];
    
   
    
    NSString *itemName=[_object valueForKey:@"itemName"];
   NSString *itemPrice=[[_object valueForKey:@"itemPrice"]description];
       
 
    
    
    DetailsCell *cell=[tableView dequeueReusableCellWithIdentifier:@"detailscell" forIndexPath:indexPath];
    
    cell.lableItemName.text=itemName;
    cell.lableItemPrice.text=itemPrice;
    
    return cell;

    
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
    
    // loop for adding object
    
    NSLog(@"%u",[arrayOrderDetails count]);
    
    for (int i=0; i<[arrayOrderDetails count]; i++) {
        
    
    
        DetailsCell *cell=[myTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        
      int qty=[cell.textItemQuantity.text intValue];
//        int price=cell.lableItemPrice;
        NSString *name=cell.lableItemName;
       
        NSString *details=[NSString stringWithFormat:@"%d",qty];
        NSLog(@"%@",details);
    }
    
//    NSNumber *tableNo=[NSNumber numberWithInt:[textTableNo.text intValue]];
//    
//    NSString *itemName=[_object valueForKey:@"itemName"];
//    NSString *itemPrice=[_object valueForKey:@"itemPrice"];
//    
//   // NSNumber *qty=[NSNumber numberWithInt:[ intValue]];
//
//    
//    // create object to be stored in dataStore  if it insert operation
//    
//           _doneObject=[NSEntityDescription insertNewObjectForEntityForName:@"OrderDetail" inManagedObjectContext:managedContex];
//        
//    
//    
//    // set attribute values in object ;;;  ;;
//    
//    
//    
//    [_doneObject setValue:tableNo forKey:@"tableNo"];
//        [_doneObject setValue:empId forKey:@"empId"];
//    
//    // save current context to persistent storage
//    
//    
//        
//    
//    
//    
//    NSError *err=nil;
//    BOOL isSaved=[managedContex save:&err];
//    if (!isSaved) {
//        NSLog(@"error:%@",err);
//        
//    }
//    else
//        NSLog(@"saveddd  ..");
}

              
              
-(void)onAdd:(id)sender
{
    
}
@end
