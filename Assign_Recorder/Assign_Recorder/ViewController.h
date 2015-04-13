//
//  ViewController.h
//  Assign_Recorder
//
//  Created by Rajesh on 17/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreAudio/CoreAudioTypes.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textTitle;
- (IBAction)onStart:(id)sender;

- (IBAction)onStop:(id)sender;
@property (nonatomic,strong)AVAudioRecorder *recorder;
@property (nonatomic,strong)NSString *filePath;
@property (nonatomic,strong)AVAudioPlayer *player;
@property  NSString *docPath;

@property (weak, nonatomic) IBOutlet UIButton *btnProperty;


@end

