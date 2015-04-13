//
//  FirstViewController.m
//  LAbleViewDemo
//
//  Created by Rajesh on 08/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize tableView,labelName,mArrayNames;
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
    mArrayNames=[[NSMutableArray alloc] initWithObjects:@"Devayan",@"Bhaskar",@"Deepak",@"Yogi",@"Alturist",@"Akhil", nil];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [mArrayNames count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str=[mArrayNames objectAtIndex:indexPath.row];
    UITableViewCell *cell=[[UITableViewCell alloc] init];
    cell.textLabel.text=str;
    
    //add image to cell
    UIImage *img=[UIImage imageNamed:@"Strawberry.gif"];
    cell.imageView.image=img;
    cell.accessoryType=UITableViewCellAccessoryCheckmark;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str=[mArrayNames objectAtIndex:indexPath.row];
    labelName.text=str;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
