//
//  ViewController.m
//  WebAccesDemo
//
//  Created by Rajesh on 19/12/14.
//  Copyright (c) 2014 Wimc_051. All rights reserved.
//

#import "ViewController.h"

static NSString *XMLFilePath;
BOOL nameFound=false,priceFound=false;
@interface ViewController ()
{
    NSString *strData;
}
@end

@implementation ViewController
@synthesize myImageView,activityIndicator;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onXML:(id)sender {

NSString *strUrl=@"http://www.w3schools.com/xml/simple.xml";
    NSURL *urlXMLFile=[NSURL URLWithString:strUrl];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:urlXMLFile];
    
    NSOperationQueue *q=[[NSOperationQueue alloc]init];
    
     [activityIndicator startAnimating];
    [NSURLConnection sendAsynchronousRequest:request queue:q completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        //create path to store xml dtaa
        
        NSArray *arrayPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE);
        
        XMLFilePath=[[arrayPath objectAtIndex:0]stringByAppendingPathComponent:@"sample.xml"];
        
        NSLog(@"%@",XMLFilePath);
        
        [data writeToFile:XMLFilePath atomically:YES];
        
        [activityIndicator stopAnimating];
        
    }];


}

- (IBAction)onIMAGE:(id)sender {
    
    
    [NSThread detachNewThreadSelector:@selector(downloadImage) toTarget:self withObject:nil];
    
    [activityIndicator startAnimating];
    
}

-(void)downloadImage
{
    NSString *strUrl=@"http://www.rc-network.de/forum/attachment.php?attachmentid=642428&stc=1&d=1304949422";
    NSURL *url=[NSURL URLWithString:strUrl];
    
    NSData *data=[NSData dataWithContentsOfURL:url];
    
    UIImage *img=[UIImage imageWithData:data];
    
    // create a block
    
    dispatch_async(dispatch_get_main_queue(), ^{
    
         myImageView.image=img;
        [activityIndicator stopAnimating];
    });
}

- (IBAction)onXMLParsing:(id)sender {
    
    NSXMLParser *parser=[[NSXMLParser alloc]initWithData:[NSData dataWithContentsOfFile:XMLFilePath]];
    
    parser.delegate=self;
    if([parser parse])
        
    {
        NSLog(@"Parsing Done");
    }
    
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    if ([elementName isEqual:@"name"] || [elementName isEqual:@"price"]) {
        nameFound=TRUE;
        NSLog(@"name end found");
    }
    
    if ([elementName isEqual:@"name"] ) {
        strData=[[NSString alloc] init];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqual:@"price"]) {
         NSLog(@"%@",strData);
        strData=nil;
    }
    
    if ([elementName isEqual:@"name"] || [elementName isEqual:@"price"]) {
        nameFound=false;
        NSLog(@"name end found");
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{

    if (nameFound) {
        
        strData=[[strData stringByAppendingString:@" "]stringByAppendingString:string];
       
    }
}



@end
