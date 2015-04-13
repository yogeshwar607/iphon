//
//  ManagerHomeTableViewController.m
//  ExpenseManager
//
//  Created by Rajesh on 19/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ManagerHomeTableViewController.h"
#import "ProfileViewController.h"

@interface ManagerHomeTableViewController ()
{
    NSMutableDictionary *detailsObject;
    NSMutableArray *memDataArray,*nameAuthoData;
    
}
@end

@implementation ManagerHomeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    nameAuthoData=[[NSMutableArray alloc]init];
    
    // sending manager details
        
     NSLog(@"%@",_manDetails);
    
    NSString *manId=[_manDetails objectForKey:@"user_id"];
    NSLog(@"%@",manId);
    
    NSString *strUrl=[NSString stringWithFormat:@"http://192.168.76.134:8080/ExpenseWebApp/MembersForManagerService?manager_id=%@",manId];
    NSURL *url=[NSURL URLWithString:strUrl];
    
    NSLog(@"%@",url);
    
    NSOperationQueue *q=[NSOperationQueue mainQueue];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
 
    [NSURLConnection sendAsynchronousRequest:request queue:q completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSError *error;
        
          NSMutableDictionary *mainDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        
       // NSLog(@"%@",mainDict);
        
        memDataArray=[mainDict objectForKey:@"data"];
         NSLog(@"%@",memDataArray);
        
        for (int i=0; i<[memDataArray count]; i++) {
            
           detailsObject=[memDataArray objectAtIndex:i];
            
            NSString *name=[detailsObject objectForKey:@"name"];
            NSString *auth=[detailsObject objectForKey:@"authorized"];
          
          //  NSLog(@"%@,%@",name,auth);
            
            NSString *authorized=@"";
            if([auth intValue]==1)
            {
                authorized=@"authorized";
            }
            else{
                authorized=@"Unauthrized";
            }
            [nameAuthoData addObject:[NSString stringWithFormat:@"%@ %@",name,authorized]];
            
            
            NSLog(@"%@",[nameAuthoData objectAtIndex:i]);
            
            [self.tableView reloadData];
        }
    }];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
 
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
    return [nameAuthoData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSLog(@"cell");
    cell.textLabel.text=[nameAuthoData objectAtIndex:indexPath.row];
    return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProfileViewController *profile=[self.storyboard instantiateViewControllerWithIdentifier:@"profile"];
    [self.navigationController pushViewController:profile animated:true];
    
    profile.managerDetails=[memDataArray objectAtIndex:indexPath.row];
    

    
}
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


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

- (IBAction)onProfileClick:(id)sender {
    
    
    ProfileViewController *profile=[self.storyboard instantiateViewControllerWithIdentifier:@"profile"];
    [self.navigationController pushViewController:profile animated:true];
    
    profile.managerDetails=_manDetails;
    
    
}
@end
