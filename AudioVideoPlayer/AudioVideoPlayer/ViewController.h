//
//  ViewController.h
//  AudioVideoPlayer
//
//  Created by Rajesh on 17/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController<AVAudioPlayerDelegate>

- (IBAction)onPlay:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *seekBar;

- (IBAction)onStop:(id)sender;
@property AVAudioPlayer *player;
-(void)playInBackground;
-(void)onSeek;
- (IBAction)onValueChanged:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *time;

@end

