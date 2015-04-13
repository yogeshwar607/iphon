//
//  VideoViewController.m
//  AudioVideoPlayer
//
//  Created by Rajesh on 17/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController
@ synthesize moviePlayer;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onPlay:(id)sender {
    
    
    NSString *path=[[NSBundle mainBundle]pathForResource:@"mitti" ofType:@"mp4"];
    NSURL *url=[NSURL fileURLWithPath:path];
    
    moviePlayer=[[MPMoviePlayerController alloc]initWithContentURL:url];
    
    if (moviePlayer!=nil) {
        // set view and  start playing
        
        [moviePlayer setScalingMode:MPMovieScalingModeAspectFit];
         [moviePlayer play];
                [self.view addSubview:moviePlayer.view];
        
        [moviePlayer setFullscreen:YES animated:true];

        
        NSLog(@"play");
        
    }
    
    else
        NSLog(@"can't play");
    
}
@end
