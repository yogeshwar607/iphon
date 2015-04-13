//
//  SelectFoodViewController.m
//  Assign_CoreData_Order
//
//  Created by Rajesh on 12/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "SelectFoodViewController.h"
#import "TakeOrderViewController.h"

@interface SelectFoodViewController ()

@end

@implementation SelectFoodViewController
@synthesize arrayItem;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView setEditing:true];
}

-(void)viewDidAppear:(BOOL)animated
{
    
    // initialised manage contex
    
    
    UIApplication *app=[UIApplication sharedApplication];
    id appDelegate=[app delegate];
    
    NSManagedObjectContext *managedContex=[appDelegate managedObjectContext];
    
    
    // create fetch rqst
    
    NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"Item"];
    
    // Execute fetch rqst on context
    
    NSError *err=nil;
    
    NSArray *array=[managedContex executeFetchRequest:request error:&err];
    
    arrayItem=[[NSMutableArray alloc]initWithArray:array];
    
    if(err!=nil)
    {
        NSLog(@"Error in fetch%@",err);
    }
    
    [self.tableView reloadData];

    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [arrayItem count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSManagedObject *object=[arrayItem objectAtIndex:indexPath.row];
    
    NSString *itemName=[object valueForKey:@"itemName"];
    
    
  
    NSNumber *itemPrice=[object valueForKey:@"itemPrice"];
    
    NSString *detail=[NSString stringWithFormat:@"%@:%@",itemName,itemPrice];
    
    cell.textLabel.text=detail;
    
    return cell;
    
    
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSManagedObject *object=[arrayItem objectAtIndex:indexPath.row];
        
        
        // get  ManagedContextObject
        
        UIApplication *app=[UIApplication sharedApplication];
        id appDelegate=[app delegate];
        
        NSManagedObjectContext *managedContex=[appDelegate managedObjectContext];
        
        
        // delete object
        
        [managedContex deleteObject:object];
        // save  contex
        
        NSError *err=nil;
        
        if([managedContex save:&err])
        {
            NSLog(@"deleted..");
        }
        
        else
            NSLog(@"error:%@",err);
        
        // refresh array and tableview
        
        [arrayItem removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];

    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    
    NSArray *array=[self.navigationController viewControllers];
    TakeOrderViewController *takeOrder=[array objectAtIndex:1];
    
    [takeOrder.arrayOrderDetails addObject:[arrayItem objectAtIndex:indexPath.row]];
    
    //NSLog(@"%@",takeOrder.arrayOrderDetails);
    [self.navigationController popViewControllerAnimated:true];
}



- (IBAction)onEdit:(id)sender {
    
    if(self.tableView.editing)
    {
        [self.tableView setEditing:false];
    }
    else{
        [self.tableView setEditing:true];
    }
    
    
}
@end
