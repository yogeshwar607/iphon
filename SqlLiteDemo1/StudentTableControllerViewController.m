//
//  StudentTableControllerViewController.m
//  SqlLiteDemo1
//
//  Created by Rajesh on 11/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "StudentTableControllerViewController.h"
#import "DataBaseManager.h"
#import "Student.h"
#import "UpdateStudentController.h"

@interface StudentTableControllerViewController ()

@end

@implementation StudentTableControllerViewController
@synthesize arrayStudent;
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

    DataBaseManager *dbManager=[[DataBaseManager alloc]init];
    [dbManager copyDBinDocFolder];
    
       // init array
    
  //  arrayStudent=[[NSMutableArray alloc]initWithObjects:@"shek",@"bhaskar",nil];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    DataBaseManager *dbManager=[[DataBaseManager alloc]init];
    arrayStudent= [dbManager getAllStudent];
    
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
   return [arrayStudent count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    Student *stu=[arrayStudent objectAtIndex:indexPath.row];
    cell.textLabel.text=[stu description];
    
    return cell;
}

// pass student object before update controller load
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqual:@"updateStudent"])
    {
        // pass current student object to  update controller
        
        int pos=[self.tableView indexPathForSelectedRow].row;
        
        Student *s=[arrayStudent objectAtIndex:pos];
        
        // get reference of update controller
        
        UpdateStudentController *updateCon=[segue destinationViewController];
        updateCon.student=s;
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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
