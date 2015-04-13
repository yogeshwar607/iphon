//
//  ViewController.m
//  Assign_JSON_Sachin
//
//  Created by Rajesh on 19/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageView,textCeleb,activityIndicator,textView,mainDict;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onGo:(id)sender {
    
    
    
    
    NSString *strUrl=@"https://graph.facebook.com";
    
    NSString *celebName=textCeleb.text;
    
    NSURL *url=[NSURL URLWithString:[strUrl stringByAppendingPathComponent:celebName]];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    NSOperationQueue *q=[NSOperationQueue mainQueue];
    [activityIndicator startAnimating];
    
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:q completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
       
        NSError *error;
      mainDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        
        NSString *category=[mainDict objectForKey:@"about"];
        textView.text=category;
        
        [self imagefetch];
    }];
    
   

}
-(void)imagefetch
{
    NSMutableDictionary *coverDict=[mainDict objectForKey:@"cover"];
    
    NSString *imgUrl=[coverDict valueForKey:@"source"];
    
    NSURL *iUrl=[NSURL URLWithString:imgUrl];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:iUrl];
    
    NSOperationQueue *q=[NSOperationQueue mainQueue];
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:q completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        //  NSLog(@"%@",imgUrl);
        
        NSData *iData=[NSData dataWithContentsOfURL:iUrl];
        
        UIImage *img=[UIImage imageWithData:iData];
        
        imageView.image=img;
        
        [activityIndicator stopAnimating];
    }];
    
    

}


@end
