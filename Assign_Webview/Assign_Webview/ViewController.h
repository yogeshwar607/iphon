//
//  ViewController.h
//  Assign_Webview
//
//  Created by Rajesh on 18/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerview;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property NSMutableArray *place;
@property NSMutableDictionary *dPlaceInfo;
-(void)copyPlistToDocFolder;
-(void)loadPlace;

@end

