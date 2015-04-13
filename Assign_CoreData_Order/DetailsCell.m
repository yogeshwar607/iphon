//
//  DetailsCell.m
//  Assign_CoreData_Order
//
//  Created by Rajesh on 12/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "DetailsCell.h"

@implementation DetailsCell
@synthesize textItemQuantity,lableItemName,lableItemPrice;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
