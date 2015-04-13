//
//  FirstViewController.m
//  CustomCellAssign
//
//  Created by Rajesh on 08/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "FirstViewController.h"
#import "CustomCell.h"
#import "Item.h"
@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize textName,textPrice,tableViewItem,mArrayItem;
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
    // Do any additional setup after loading the view from its nib.
    //attach tableViewCell design.xib with table view
    mArrayItem=[[NSMutableArray alloc]init];
    Item *itm=[[Item alloc] initWithItemName:@"jeans" andPrice:1500];
    [mArrayItem addObject:itm];
    [self.tableViewItem registerNib:[UINib nibWithNibName:@"CustomCellView" bundle:nil] forCellReuseIdentifier:@"mycell"];
    self.tableViewItem.dataSource=self;
    self.tableViewItem.delegate=self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [mArrayItem count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Item *p=[mArrayItem objectAtIndex:indexPath.row];
    // cell.textLabel.text=[p description];
    //return cell;
    
    CustomCell *cell=[self.tableViewItem dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    cell.labelName.text=p.itemName;
    cell.labelPrice.text=[NSString stringWithFormat:@"%d",p.price];
    return cell;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onAdd:(id)sender {
    
    Item *itm=[[Item alloc]initWithItemName:textName.text andPrice:[textPrice.text intValue]];
    [mArrayItem addObject:itm];
    [self.tableViewItem reloadData];
    textName.text=@"";
    textPrice.text=@"";
}
- (IBAction)onTotal:(id)sender {
    int total=0;
    for (int i=0; i<[mArrayItem count]; i++) {
        
        NSIndexPath *path=[NSIndexPath indexPathForRow:i inSection:0];
        CustomCell *cell=[tableViewItem cellForRowAtIndexPath:path];
        total=total+[cell.labelPrice.text intValue]*[cell.textQuantity.text intValue];
        
    }
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Total Amount" message:[NSString stringWithFormat:@"%d",total] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    //refresh tableView
    //[mArrayItem removeObjectsAtIndexes:set];
    //[tableViewI reloadData];
    
}
-(IBAction)hideKeyBoard:(id)sender{
    [textName resignFirstResponder];
}
@end
