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


-(NSArray *)allIntakes
{
    return [StateHelper getAllSavedIntakesSortedByDate];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *allIntakesArray = self.allIntakes;
}
- (IBAction)back:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}



@end
