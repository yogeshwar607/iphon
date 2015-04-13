//
//  ViewController.m
//  Assign_Recorder
//
//  Created by Rajesh on 17/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL status;
}
@end

@implementation ViewController
@synthesize filePath,recorder,textTitle,docPath,btnProperty;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *pathArray=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE);
    
  docPath=[pathArray objectAtIndex:0];
    
    status=true;
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onStart:(id)sender {
    
    if (status) {
        
    
    
    
    
    NSString *fileName=[NSString stringWithFormat:@"%@.m4a",textTitle.text];
    
    filePath=[docPath stringByAppendingPathComponent:fileName];
    
    NSLog(@"%@",filePath);

    NSMutableDictionary *settingsDict=[[NSMutableDictionary alloc]init];
    
    [settingsDict setObject:[NSNumber numberWithInt:kAudioFormatAppleLossless] forKey:AVFormatIDKey];
    
    [settingsDict setValue:[NSNumber numberWithFloat:44100.0f] forKey:AVSampleRateKey];
    
    [settingsDict setValue:[NSNumber numberWithInt:1 ]forKey:AVNumberOfChannelsKey];
    
    [settingsDict setValue:[NSNumber numberWithInt:AVAudioQualityLow] forKey:AVEncoderAudioQualityKey];
    
    // create url for path
    
    NSURL *fileUrl=[NSURL fileURLWithPath:filePath];
    
    // instatntiate record
    
    NSError *err;
    
    recorder=[[AVAudioRecorder alloc]initWithURL:fileUrl settings:settingsDict error:&err];
    
    // start recording
    
    if (recorder!=nil) {
        recorder.delegate=self;
        [recorder prepareToRecord];
        [recorder record];
    }
    else
        NSLog(@"recording not possible,%@",err);
    
        [btnProperty setTitle:@"STOP" forState:UIControlStateNormal];
        status=false;
    }
    
    
    else
    {
        if (recorder!=nil && [recorder isRecording]) {
            [recorder stop];
            
            recorder=nil;
            NSLog(@"recording stopped");
            
        }
        [btnProperty setTitle:@"start" forState:UIControlStateNormal];
        status=true;
    }
    
}

- (IBAction)onStop:(id)sender {
    
   
    
}

@end
