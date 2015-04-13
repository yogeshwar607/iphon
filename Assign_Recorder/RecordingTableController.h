//
//  RecordingTableController.h
//  Assign_Recorder
//
//  Created by Rajesh on 17/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVFoundation.h>
@interface RecordingTableController : UITableViewController<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)AVAudioPlayer *player;
@property (nonatomic,strong)NSString *filePath;
@property  NSString *docPath;
@property NSMutableArray *fileArray;
@property NSMutableArray *array;
@end
