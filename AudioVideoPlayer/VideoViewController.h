//
//  VideoViewController.h
//  AudioVideoPlayer
//
//  Created by Rajesh on 17/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VideoViewController : UIViewController
- (IBAction)onPlay:(id)sender;

@property(nonatomic,strong)
MPMoviePlayerController *moviePlayer;


@end
