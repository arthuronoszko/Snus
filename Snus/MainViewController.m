//
//  ViewController.m
//  Snus
//
//  Created by Arthur Onoszko on 20/01/14.
//  Copyright (c) 2014 Arthur Onoszko. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonAddSnus;
@property (weak, nonatomic) IBOutlet UILabel *labelDayCountSnus;
@property (nonatomic) int dayCountSnus;
@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background-gradient"]];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonAddSnusTapped:(UIButton *)sender
{
    self.dayCountSnus++;
    self.labelDayCountSnus.text = [NSString stringWithFormat:@"Idag: %d",self.dayCountSnus];
}


-(void) viewWillDisappear:(BOOL)animated
{
    
}
@end
