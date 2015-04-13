//
//  FirstViewController.m
//  CustomCellTableViewDemo


#import "FirstViewController.h"
#import "Person.h"
#import "PersonCustomCellView.h"
@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize textAge,textName,tableViewPerson,segmentGender,mArrayPerson;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    mArrayPerson=[[NSMutableArray alloc]init];
    
    Person *p=[[Person alloc]initWithName:@"Rahul" andAge:23 andGender:@"Male"];
    [mArrayPerson addObject:p];
    self.tableViewPerson.delegate=self;
    self.tableViewPerson.dataSource=self;
    
    //attach tableViewCell design/xib with tableView
    [self.tableViewPerson registerNib:[UINib nibWithNibName:@"PersonCustomCellView" bundle:nil] forCellReuseIdentifier:@"mycell"];
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [mArrayPerson count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   // UITableViewCell *cell=[[UITableViewCell alloc]init];
    
    Person *p=[mArrayPerson objectAtIndex:indexPath.row];
   // cell.textLabel.text=[p description];
    //return cell;
    
    PersonCustomCellView *cell=[self.tableViewPerson dequeueReusableCellWithIdentifier:@"mycell" forIndexPath:indexPath];
    cell.labelName.text=p.name;
    cell.labelGender.text=p.gender;
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 74;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onAdd:(id)sender {
    NSString *name=textName.text;
   
    int age=[textAge.text intValue];
    NSString *gender=@"";
    if (segmentGender.selectedSegmentIndex==0) {
        gender=@"Male";
    }
    if (segmentGender.selectedSegmentIndex==1) {
        gender=@"Female";
    }
    Person *p=[[Person alloc]initWithName:name andAge:age andGender:gender];
    [mArrayPerson addObject:p];
    [self.tableViewPerson reloadData];

}
- (IBAction)hideKeyBoard:(id)sender {
    [textName resignFirstResponder];
}

- (IBAction)onDelete:(id)sender {
   
    NSMutableIndexSet *set=[[NSMutableIndexSet alloc]init];
    //loop for all objects in array
    for (int i=0; i<[mArrayPerson count]; i++) {
        
        NSIndexPath *path=[NSIndexPath indexPathForRow:i inSection:0];
        PersonCustomCellView *cell=[tableViewPerson cellForRowAtIndexPath:path];
        if([cell.switchDelete isOn])
        {
            [set addIndex:i];
        
        }
    }
    //refresh tableView
    [mArrayPerson removeObjectsAtIndexes:set];
    [tableViewPerson reloadData];
    for (int i=0; i<[mArrayPerson count]; i++) {
        
        NSIndexPath *path=[NSIndexPath indexPathForRow:i inSection:0];
        PersonCustomCellView *cell=[tableViewPerson cellForRowAtIndexPath:path];
        cell.switchDelete.on=false;
    }

}
@end
