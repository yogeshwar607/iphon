//
//  CustomCell.h
//  CustomCellAssign
//
//  Created by Rajesh on 08/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UITextField *textQuantity;
- (IBAction)hideKeyBoard:(id)sender;

@end
