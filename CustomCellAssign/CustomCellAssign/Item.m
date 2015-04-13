//
//  Item.m
//  CustomCellAssign
//
//  Created by Rajesh on 08/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "Item.h"

@implementation Item
@synthesize itemName,price,qty;
-(id)initWithItemName:(NSString *)itemName andPrice:(int)price
{
    self=[super init];
    self->itemName=itemName;
    self->price=price;
    self->qty=qty;
    return self;
}
@end
