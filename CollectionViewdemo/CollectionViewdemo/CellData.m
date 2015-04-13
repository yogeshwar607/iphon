//
//  CellData.m
//  CollectionViewdemo
//
//  Created by Rajesh on 09/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "CellData.h"

@implementation CellData
@synthesize cellId,imageName,title;
-(id)initWithCellId:(int)cellId andImageName:(NSString *)imageName andTitle:(NSString *)title
{
    self=[super init];
    self->title=title;
    self->cellId=cellId;
    self->imageName=imageName;
    
    return self;
}
@end
