//
//  DetailsCell.h
//  Assign_CoreData_Order
//
//  Created by Rajesh on 12/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *textItemQuantity;

@property (weak, nonatomic) IBOutlet UILabel *lableItemName;
@property (weak, nonatomic) IBOutlet UILabel *lableItemPrice;

@end
