//
//  ViewController.h
//  WebAccesDemo
//
//  Created by Rajesh on 19/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSXMLParserDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

- (IBAction)onXML:(id)sender;
- (IBAction)onIMAGE:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
-(void)downloadImage;
- (IBAction)onXMLParsing:(id)sender;

@end

