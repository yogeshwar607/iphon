//
//  ViewController.h
//  WebViewDemo
//
//  Created by Rajesh on 18/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textURL;


- (IBAction)onGO:(id)sender;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)onHome:(id)sender;

@end

