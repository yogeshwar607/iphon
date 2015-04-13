//
//  ViewController.m
//  WebViewDemo
//
//  Created by Rajesh on 18/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textURL,webView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onGO:(id)sender {
    
    NSString *strURL=textURL.text;
    NSURL *url=[NSURL URLWithString:strURL];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    [webView loadRequest:request];
}
- (IBAction)onHome:(id)sender {
    
    
    NSString *filePath=[[NSBundle mainBundle] pathForResource:@"webpage" ofType:@"html"];
    
    //load contents of file in a string
    NSError *err;
    
    NSString *strHtmlData=[NSString stringWithContentsOfFile:filePath encoding:NSStringEncodingConversionAllowLossy error:&err];
    
    [webView loadHTMLString:strHtmlData baseURL:nil];
    
}
@end
