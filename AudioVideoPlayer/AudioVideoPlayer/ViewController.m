//
//  ViewController.m
//  AudioVideoPlayer
//
//  Created by Rajesh on 17/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize player,seekBar,time;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onPlay:(id)sender {
    
    [NSThread detachNewThreadSelector:@selector(playInBackground) toTarget:self withObject:nil];
    
    sleep(1);
    
    [NSThread detachNewThreadSelector:@selector(onSeek) toTarget:self withObject:nil];

    
}

- (IBAction)onStop:(id)sender {
    
    [player stop];
    
}


-(void)playInBackground
{
    NSString *path=[[NSBundle mainBundle]pathForResource:@"musk" ofType:@"mp3"];
    
    NSData *fileData=[NSData dataWithContentsOfFile:path];
    NSError *err;
    
    player=[[AVAudioPlayer alloc]initWithData:fileData error:&err];
    
    
    if (player!=nil) {
        [player prepareToPlay];
        [player play];
        
  
    }
    else
        NSLog(@"Can not play error:%@",err);

    
}


-(void)onSeek
{
    
    long duration=[player duration];
    
    seekBar.maximumValue=duration;
    seekBar.minimumValue=0;
    
    while (true) {
        
        sleep(1);
        
        dispatch_queue_t mainQ=dispatch_get_main_queue();
        dispatch_async(mainQ, ^{
            
            seekBar.value=[player currentTime];
            time.text=[NSString stringWithFormat:@"%4f",[player currentTime]];
                    });
        
    }
    
    
}

- (IBAction)onValueChanged:(id)sender {
    
    [player setCurrentTime:seekBar.value];
    
    
}



-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if(flag)
    {
        //release the player
        if (player!=nil) {
            player=nil;
        }
    }
}


@end
