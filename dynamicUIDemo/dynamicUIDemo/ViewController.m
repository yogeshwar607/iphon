//
//  ViewController.m
//  dynamicUIDemo
//
//  Created by Rajesh on 16/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"
static int count;

@interface ViewController ()
@end

@implementation ViewController
@synthesize text1,scrollView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    scrollView=[[UIScrollView alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    CGSize s=CGSizeMake(800, 1000); // scroll area height
    [scrollView setContentSize:s];
    [scrollView setShowsVerticalScrollIndicator:true];
    [scrollView setScrollEnabled:true];
    [self.view addSubview:scrollView];

    
    // add content to scroll view
    
    
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    
    
    count=0;
   [scrollView setBackgroundColor:[UIColor greenColor]];
    
    CGRect rect1=CGRectMake(20, 20, 150, 40);

    text1=[[UITextField alloc]initWithFrame:rect1];
    
    [text1 setTextColor:[UIColor redColor]];
    [text1 setBackgroundColor:[UIColor whiteColor]];
    [scrollView addSubview:text1];
    
    UIButton *buttonGo=[[UIButton alloc]initWithFrame:CGRectMake(100, 150, 150, 40)];
    [buttonGo setBackgroundColor:[UIColor yellowColor]];
    [buttonGo setTitleColor:[UIColor orangeColor] forState:normal];
    [buttonGo setTitle:@"KO " forState:normal];
   
    [scrollView addSubview:buttonGo];
    
    // atach event with button
    
    [buttonGo addTarget:self action:@selector(onGo:) forControlEvents:UIControlEventTouchUpInside];
    
    // add scroll view
    
    
}

-(void)onGo:(id)sender
{
    NSLog(@"go Clicked");
    
    
    UILabel *lbl=[[UILabel alloc]initWithFrame:CGRectMake(100, (180+count*45), 250, 40)];
         [lbl setBackgroundColor:[UIColor whiteColor]];
    [lbl setTextColor:[UIColor purpleColor]];
    lbl.text=text1.text;
    count++;
    [scrollView addSubview:lbl];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
