//
//  FirstViewController.h
//  CollectionViewdemo
//
//  Created by Rajesh on 09/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSMutableArray *mArrayCellData;
@property (weak, nonatomic) IBOutlet UIView *myImageView;
@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView;
- (IBAction)onBack:(id)sender;


@end
