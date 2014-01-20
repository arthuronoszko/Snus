//
//  ViewController.m
//  Snus
//
//  Created by Arthur Onoszko on 20/01/14.
//  Copyright (c) 2014 Arthur Onoszko. All rights reserved.
//

#import "MainViewController.h"
#import "SnusType.h"
#import "SnusBrand.h"

#define FONT_LATO_HAIRLINE(s) [UIFont fontWithName:@"Lato-Hairline" size:s]

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonAddSnus;
@property (weak, nonatomic) IBOutlet UILabel *labelDayCountSnus;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewSnusType;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewSnusBrand;
@property (nonatomic) int dayCountSnus;
@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initScrollViewWithTypes];
    [self initScrollViewWithBrands];
    
    self.labelDayCountSnus.font = FONT_LATO_HAIRLINE(15);
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background-gradient"]];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) initScrollViewWithTypes
{
    self.scrollViewSnusType.delegate = self;
    NSDictionary *typesWithImages = [SnusType getTypesWithImages];
    CGFloat cx = 0;
    for(NSString *type in typesWithImages)
    {
        UIImage *snusTypeImage = [typesWithImages objectForKey:type];
        UIImageView *imageViewSnusType = [[UIImageView alloc] initWithImage:snusTypeImage];
        
        CGRect typeRect = imageViewSnusType.frame;
        typeRect.size.height = 100;
        typeRect.size.width = 100;
        typeRect.origin.x = cx + self.view.frame.size.width/2 - typeRect.size.width/2;
        typeRect.origin.y = self.scrollViewSnusType.frame.size.height/2 - typeRect.size.height/2;
        imageViewSnusType.frame = typeRect;
        cx += self.view.frame.size.width;
        [self.scrollViewSnusType addSubview:imageViewSnusType];
    }
    [self.scrollViewSnusType setContentSize:CGSizeMake(typesWithImages.count * self.view.frame.size.width, self.scrollViewSnusType.frame.size.height
                                                       )];
}
-(void) initScrollViewWithBrands
{
    self.scrollViewSnusBrand.delegate = self;
    NSArray *snusBrands = [SnusBrand getBrandNames];
    CGFloat cx = 0;
    for(NSString *brand in snusBrands)
    {
        UILabel *snusBrandLabel = [[UILabel alloc] initWithFrame:CGRectMake(cx, 0, self.view.frame.size.width , self.scrollViewSnusBrand.frame.size.height)];
        snusBrandLabel.textAlignment = NSTextAlignmentCenter;
        snusBrandLabel.text = [brand uppercaseString];
        snusBrandLabel.font = FONT_LATO_HAIRLINE(30);
        snusBrandLabel.textColor = [UIColor blackColor];
        cx += self.view.frame.size.width;
        [self.scrollViewSnusBrand addSubview:snusBrandLabel];
    }
    [self.scrollViewSnusBrand setContentSize:CGSizeMake(snusBrands.count * self.view.frame.size.width, self.scrollViewSnusBrand.frame.size.height
                                                       )];

    
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
