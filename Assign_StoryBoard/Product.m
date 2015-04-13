//
//  Product.m
//  Assign_StoryBoard
//
//  Created by Rajesh on 10/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "Product.h"

@implementation Product

@synthesize price,productName,qty;
-(id)initWithName:(NSString *)productName andPrice:(int)price andQuantity:(int)qty
{
    self=[super init];
    self->productName=productName;
    self->price=price;
    self->qty=qty;
    
    return self;
}

@end
