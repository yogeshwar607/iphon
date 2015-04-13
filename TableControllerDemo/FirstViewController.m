//
//  FirstViewController.m
//  TableControllerDemo
//
//  Created by Rajesh on 09/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end


@implementation FirstViewController

@synthesize arrayDrinks,arrayFood;
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

    arrayDrinks=[[NSMutableArray alloc]initWithObjects:@"Add Drinks",@"tea",@"coffe",@"Juice",@"Coke", nil];
    
    arrayFood=[[NSMutableArray alloc]initWithObjects:@"pizaa",@"Vada",@"Bun-muska",@"Maggiee", nil];
    
    
    // setting tableview as editable
    [self.tableView setEditing:true];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if(section==0)
    return [arrayDrinks count];
    if(section==1)
        return [arrayFood count];
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    if(indexPath.section==0) 
        cell.textLabel.text=[arrayDrinks objectAtIndex:indexPath.row];
    if(indexPath.section==1)
        cell.textLabel.text=[arrayFood objectAtIndex:indexPath.row];
    
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section==0){
        return @"Drinks";
    }
    if(section==1){
        return @"Food";
    }
    return @"";
   
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    if(section==0)
    {
        return [NSString stringWithFormat:@"total Drinks item%d",[arrayDrinks count]];
    }
    if(section==1)
    {
        return [NSString stringWithFormat:@"total Food item%d",[arrayFood count]];
    }
    return @"";
}

//Override to support conditional editing of the table view.

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    
    if(indexPath.section==0)
    {
        return true;
    }
    return false;
}



// Override to support editing the table view.
 
 
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
       
        [arrayDrinks removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
        
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        //ask user for drink name
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"" message:@"Enter Drink Name" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
        
        
        [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
        [alert show];
        
        
        
        
    }   
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex==1) {
        UITextField *textField=[alertView textFieldAtIndex:0];
        [arrayDrinks addObject:textField.text];
        [self.tableView reloadData];
        
    }
}



// decide editing style for row out for insert

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0 && indexPath.row==0)
    {
        return UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;
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

@end
