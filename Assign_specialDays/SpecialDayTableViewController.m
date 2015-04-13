//
//  SpecialDayTableViewController.m
//  Assign_specialDays
//
//  Created by Rajesh on 15/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "SpecialDayTableViewController.h"
#import "DataBaseManager.h"

@interface SpecialDayTableViewController ()

@end

@implementation SpecialDayTableViewController
@synthesize arraySpecialDays,myImage;
- (void)viewDidLoad
{
    [super viewDidLoad];
     
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
    NSLog(@"in ViewDidLoad");
    
}

-(void)viewDidAppear:(BOOL)animated
{
    DataBaseManager *dbManager=[[DataBaseManager alloc]init];
    arraySpecialDays= [dbManager getAllSpecialDays];
    
    [self.tableView reloadData];
    
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
    return [arraySpecialDays count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    SpecialDay *sd=[arraySpecialDays objectAtIndex:indexPath.row];
    
     cell.textLabel.text=sd.name;
    cell.detailTextLabel.text=sd.date;
   
    
    NSArray *pathArray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    
    NSString *docDirPath=[pathArray objectAtIndex:0];
    
    // image file path
    NSString *imgName=[NSString stringWithFormat:@"%@.png",sd.imageName];

    
    NSString *strFilePath=[docDirPath stringByAppendingPathComponent:imgName];

    NSLog(@"%@",strFilePath);
    
    UIImage *img=[UIImage imageWithContentsOfFile:strFilePath];
    
       cell.imageView.image=img;
    

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"contac via" message:@"" delegate:self cancelButtonTitle:@"ignore" otherButtonTitles:@"Sms",@"email",@"call",nil];
    
    
    [alert show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
   
    switch (buttonIndex) {
        case 1:
            NSLog(@"SMS");
            break;

        case 2:
            NSLog(@"Email");
            break;
            
        case 3:
            NSLog(@"Call");
            [self call];
            break;

        default:
            break;
    }
    
}

-(void)call
{
    NSURL *url = [NSURL URLWithString:@"tel://012-4325-234"];
    [[UIApplication sharedApplication] openURL:url];
    
    NSLog(@"Email");
    
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
