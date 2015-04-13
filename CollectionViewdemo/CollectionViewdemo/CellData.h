//
//  CellData.h
//  CollectionViewdemo
//
//  Created by Rajesh on 09/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellData : NSObject
@property int cellId;
@property NSString *imageName;
@property NSString *title;

-(id)initWithCellId :(int)cellId andImageName:(NSString *)imageName andTitle:(NSString *)title;


@end
