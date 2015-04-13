//
//  ViewController.h
//  FileIpDemo
//
//  Created by Rajesh on 10/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString* docDirPath;
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *textTittle;
@property (weak, nonatomic) IBOutlet UITextView *textDesc;
- (IBAction)onSave:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *arrayFiles;
-(void)loadFileList;
@end
