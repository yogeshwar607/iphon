//
//  RecordingTableController.m
//  Assign_Recorder
//
//  Created by Rajesh on 17/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "RecordingTableController.h"

@interface RecordingTableController ()

@end

@implementation RecordingTableController
@synthesize filePath,player,docPath,fileArray,array;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSArray *pathArray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE);
    
    docPath=[pathArray objectAtIndex:0];
    
    fileArray=[[NSMutableArray alloc]init];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    
    [array removeAllObjects];
    [fileArray removeAllObjects];
    
 array=[[NSFileManager defaultManager] contentsOfDirectoryAtPath:docPath error:NULL];
  
    
    
    for (int i=0; i<[array count]; i++) {
        
        NSLog(@"II");
        if ([[array objectAtIndex:i] containsString:@".m4a"]) {
    
            [fileArray addObject:[array objectAtIndex:i]];
        }
    }
    
    
    NSLog(@"%@",docPath);
    NSLog(@"hiii%@",[fileArray objectAtIndex:0]);
    
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
    return [fileArray count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    filePath=[docPath stringByAppendingPathComponent:[fileArray objectAtIndex:indexPath.row]];
    
    NSData *data=[NSData dataWithContentsOfFile:filePath];
    
    NSError *err;
    
    player=[[AVAudioPlayer alloc]initWithData:data error:&err];
    
    if (player!=nil) {
        
        player.delegate=self;
        [player prepareToPlay];
        [player play];
    }
    
    else
        NSLog(@"Can't  play");

    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text=[fileArray objectAtIndex:indexPath.row];
    
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
