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
#import "StateHelper.h"
#import "SnusBrandCollectionCell.h"
#import "SnusTypeCollectionCell.h"

#define FONT_LATO_HAIRLINE(s) [UIFont fontWithName:@"Lato-Hairline" size:s]

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonAddSnus;
@property (weak, nonatomic) IBOutlet UILabel *labelDayCountSnus;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewBrands;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewTypes;
@property (nonatomic, strong) NSArray *snusBrands;
@property (nonatomic, strong) NSArray *snusTypes;

@property (nonatomic) int dayCountSnus;

@end

@implementation MainViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dayCountSnus = [StateHelper getDayCount];
    
    self.snusBrands = [SnusBrand getBrands];
    self.snusTypes = [SnusType getTypesWithImages];
    
    self.collectionViewBrands.delegate = self;
    self.collectionViewBrands.dataSource = self;
    
    self.collectionViewTypes.delegate = self;
    self.collectionViewTypes.dataSource = self;
    
    self.labelDayCountSnus.font = FONT_LATO_HAIRLINE(15);
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background-gradient"]];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) setDayCountSnus:(int)dayCountSnus
{
    _dayCountSnus = dayCountSnus;
    [StateHelper saveDayCount:dayCountSnus];
    self.labelDayCountSnus.text = [NSString stringWithFormat:@"Total: %d",self.dayCountSnus];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonAddSnusTapped:(UIButton *)sender
{
    self.dayCountSnus++;
}


#pragma mark - Collection View Delegate and Datasource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if(collectionView == self.collectionViewBrands)
    {
        return self.snusBrands.count;
    }
    else if(collectionView == self.collectionViewTypes)
    {
        return self.snusTypes.count;
    }
    return 0;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(collectionView == self.collectionViewBrands)
    {
        SnusBrand *brand = self.snusBrands[indexPath.row];
        SnusBrandCollectionCell *brandCell = (SnusBrandCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Brand Cell" forIndexPath:indexPath];

        brandCell.labelBrandName.text = brand.name;
        brandCell.labelBrandManufacturer.text = brand.manufacturer;
        
        brandCell.labelBrandName.font = FONT_LATO_HAIRLINE(35);
        brandCell.labelBrandManufacturer.font = FONT_LATO_HAIRLINE(20);
        return brandCell;
    }
    else if(collectionView == self.collectionViewTypes)
    {
        SnusType *type = self.snusTypes[indexPath.row];
        SnusTypeCollectionCell *typeCell = (SnusTypeCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Type Cell" forIndexPath:indexPath];
        
        typeCell.imageType.image = type.image;
        
        return typeCell;
    }
    return nil;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height);
}
@end
