//
//  AllIntakesTableViewController.m
//  Snus
//
//  Created by Arthur Onoszko on 22/01/14.
//  Copyright (c) 2014 Arthur Onoszko. All rights reserved.
//

#import "AllIntakesTableViewController.h"
#import "StateHelper.h"

@interface AllIntakesTableViewController ()
@property (nonatomic, strong) NSArray *allIntakes;
@end

@implementation AllIntakesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(NSArray *)allIntakes
{
    return [StateHelper getAllSavedIntakesSortedByDate];
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allIntakes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    NSDictionary *intake = self.allIntakes[indexPath.row];
    NSString *snusName = [intake objectForKey:KEY_NAME];
    NSDate *intakeDate = [intake objectForKey:KEY_DATE];
    
    cell.textLabel.text = snusName;
    cell.detailTextLabel.text = [StateHelper getDateString:intakeDate];
    return cell;
}
@end
