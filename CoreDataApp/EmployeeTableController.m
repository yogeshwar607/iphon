//
//  EmployeeTableController.m
//  CoreDataApp
//
//  Created by Rajesh on 12/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "EmployeeTableController.h"
#import "EmployeeViewController.h"

@interface EmployeeTableController ()

@end

@implementation EmployeeTableController
@synthesize arrayEmployee;

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

    [self.tableView setEditing:true];
}

-(void)viewDidAppear:(BOOL)animated
{
    // initialised manage contex
    
    
    UIApplication *app=[UIApplication sharedApplication];
    id appDelegate=[app delegate];
    
    NSManagedObjectContext *managedContex=[appDelegate managedObjectContext];
    
    
    // create fetch rqst
    
    NSFetchRequest *request=[[NSFetchRequest alloc]initWithEntityName:@"Employee"];
    
    // Execute fetch rqst on context
    
    NSError *err=nil;
    
    NSArray *array=[managedContex executeFetchRequest:request error:&err];
    
    arrayEmployee=[[NSMutableArray alloc]initWithArray:array];
    
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
    return [arrayEmployee count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    NSManagedObject *object=[arrayEmployee objectAtIndex:indexPath.row];
    
    NSString *name=[object valueForKey:@"empName"];
    
    
   NSString *empId=[object valueForKey:@"empId"];
    NSString *empSalary=[object valueForKey:@"empSalary"];
    
    NSString *detail=[NSString stringWithFormat:@"%@:%@:%@",name,empId,empSalary];
    
    cell.textLabel.text=detail;
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // initialise  manage contex
    
    return true;
    
    
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        NSManagedObject *object=[arrayEmployee objectAtIndex:indexPath.row];
        
        
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
        
        [arrayEmployee removeObjectAtIndex:indexPath.row];
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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqual:@"updateEmployee"])
    {
        int pos=[self.tableView indexPathForSelectedRow].row;
        
        NSManagedObject *object=[arrayEmployee objectAtIndex:pos];
        
   
        // get destination controller
        
        EmployeeViewController *empCon=[segue destinationViewController];
        
        empCon.object=object;
        
    }
    
    
}

@end
