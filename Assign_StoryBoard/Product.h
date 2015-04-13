//
//  Product.h
//  Assign_StoryBoard
//
//  Created by Rajesh on 10/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject
@property NSString *productName;
@property int price,qty;
-(id)initWithName :(NSString *) productName andPrice :(int)price andQuantity :(int)qty;
@end
