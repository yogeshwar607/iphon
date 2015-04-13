//
//  Item.h
//  CustomCellAssign
//
//  Created by Rajesh on 08/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property NSString *itemName;
@property int price,qty;
-(id)initWithItemName:(NSString *)itemName andPrice:(int)price;

@end
