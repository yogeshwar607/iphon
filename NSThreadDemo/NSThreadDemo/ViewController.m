//
//  ViewController.m
//  NSThreadDemo
//
//  Created by Rajesh on 13/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lable1ToN,lableFact,textData,progressView,activityIndicator;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    NSThread *thread=[NSThread currentThread];
    
    NSLog(@"i am sleep mode");
    [NSThread sleepForTimeInterval:2];
    
     NSLog(@"i have class at 7");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onFact:(id)sender {
    
    //[self calcFact];
    
    [NSThread detachNewThreadSelector:@selector(calcFact) toTarget:self withObject:nil];
    
   }

- (IBAction)on1ToN:(id)sender {
    
    //[self calc1ToN];

    [NSThread detachNewThreadSelector:@selector(calc1ToN) toTarget:self withObject:nil];

}

-(void)calc1ToN
{
    int num=[textData.text intValue];
    
    
    
   
    
    
    dispatch_async(dispatch_get_main_queue(), ^{[activityIndicator startAnimating];});

    for (int i=1; i<=num; i++) {
        
        NSLog(@"1 to N is %d:",i);
       // lable1ToN.text=[NSString stringWithFormat:@"%d",i];
        
        dispatch_queue_t mainQ=dispatch_get_main_queue();
        dispatch_async(mainQ, ^{
            lable1ToN.text=[NSString stringWithFormat:@"%d",i];
        });

        
        [NSThread sleepForTimeInterval:1];
    }

    dispatch_async(dispatch_get_main_queue(), ^{[activityIndicator stopAnimating];});

    
}
-(void)calcFact
{
    int num=[textData.text intValue];
    int fact=1;
    
    
     
    for (int i=1; i<=num; i++) {
        
        fact=fact*i;
        
        NSLog(@"fact is %d:",fact);
        lableFact.text=[NSString stringWithFormat:@"%d"];
      
        dispatch_queue_t mainQ=dispatch_get_main_queue();
        dispatch_async(mainQ, ^{
        lableFact.text=[NSString stringWithFormat:@"%d",fact];
            progressView.progress=(float)i/num;
            
        });
        
        
        
        
        
        [NSThread sleepForTimeInterval:1];
    }
    
    NSLog(@"fact is %d:",fact);

}
@end
