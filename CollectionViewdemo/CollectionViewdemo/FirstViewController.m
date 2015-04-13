//
//  FirstViewController.m
//  CollectionViewdemo
//
//  Created by Rajesh on 09/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "FirstViewController.h"
#import "CellData.h"
#import "MyCell.h"


@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize mArrayCellData,selectedImageView,myImageView;

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
    [myImageView setHidden:true];
    mArrayCellData=[[NSMutableArray alloc]init];
    CellData *cd1=[[CellData alloc]initWithCellId:1 andImageName:@"Canada.png" andTitle:@"CANADA"];
    [mArrayCellData addObject:cd1];
    
    CellData *cd2=[[CellData alloc]initWithCellId:2 andImageName:@"Australia.png" andTitle:@"AUSTRALIA"];
    [mArrayCellData addObject:cd2];

    CellData *cd3=[[CellData alloc]initWithCellId:3 andImageName:@"Belgium.png" andTitle:@"BELGIUM"];
    [mArrayCellData addObject:cd3];

    CellData *cd4=[[CellData alloc]initWithCellId:4 andImageName:@"Brazil.png" andTitle:@"BRAZIL"];
    [mArrayCellData addObject:cd4];

    CellData *cd5=[[CellData alloc]initWithCellId:5 andImageName:@"Chile.png" andTitle:@"CHILE"];
    [mArrayCellData addObject:cd5];

    
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
   
    [_collectionView registerNib:[UINib nibWithNibName:@"MyCellView" bundle:nil] forCellWithReuseIdentifier:@"mycell"];
    
    

}
/// no. of sections 

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

// NO. OF CELLS IN A SECTION

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [mArrayCellData count];
}
// show data
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // load cell design
    
    MyCell *cell=[_collectionView dequeueReusableCellWithReuseIdentifier:@"mycell" forIndexPath:indexPath];
    
    // fill cell with Data
    
    CellData *cd=[mArrayCellData objectAtIndex:indexPath.row];
    
   cell.lableTitle.text=cd.title;
    
    UIImage *img=[UIImage imageNamed:cd.imageName];
    cell.imageView.image=img;
    return cell;
    
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    CellData *cd=[mArrayCellData objectAtIndex:indexPath.row];
    [myImageView setHidden:false];
    
    
    UIImage *img=[UIImage imageNamed:cd.imageName];
    
    [selectedImageView setImage:img];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onBack:(id)sender {
    [myImageView setHidden:true];
    
}
@end
