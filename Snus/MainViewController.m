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
@property (nonatomic, strong) SnusBrand *chosenBrand;
@property (nonatomic, strong) SnusType *chosenType;


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
    
    self.dayCountSnus = [StateHelper getDayCount];
    
	// Do any additional setup after loading the view, typically from a nib.
}
-(void) viewWillAppear:(BOOL)animated
{
    NSInteger chosenBrandIndex = [StateHelper getSavedChosenBrandIndex];
    NSIndexPath *chosenBrandIndexPath = [NSIndexPath indexPathForRow:chosenBrandIndex inSection:0];
    [self.collectionViewBrands scrollToItemAtIndexPath:chosenBrandIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
    NSInteger chosenTypeIndex = [StateHelper getSavedChosenTypeIndex];
    NSIndexPath *chosenTypeIndexPath = [NSIndexPath indexPathForRow:chosenTypeIndex inSection:0];
    [self.collectionViewTypes scrollToItemAtIndexPath:chosenTypeIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
}
-(void) viewWillDisappear:(BOOL)animated
{
    //TODO: Save chosen type and brand to nsuserdefaults
    [StateHelper saveChosenBrand:self.chosenBrand andChosenType:self.chosenType];
}

-(void) setDayCountSnus:(int)dayCountSnus
{
    _dayCountSnus = dayCountSnus;
    self.labelDayCountSnus.text = [[NSString stringWithFormat:@"Idag: %d",self.dayCountSnus] uppercaseString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonAddSnusTapped:(UIButton *)sender
{
    [StateHelper addSnusIntakeTodayWithType:self.chosenType Brand:self.chosenBrand];
    self.dayCountSnus = [StateHelper getDayCount];
}
-(SnusType*) getChosenSnusType
{
    SnusTypeCollectionCell *chosenType = [self.collectionViewTypes visibleCells][0];
    NSIndexPath *chosenTypeIndex = [self.collectionViewTypes indexPathForCell:chosenType];
    SnusType *type = self.snusTypes[chosenTypeIndex.row];
    return type;
    
}
-(SnusBrand*) getChosenSnusBrand
{
    SnusBrandCollectionCell *chosenBrand = [self.collectionViewBrands visibleCells][0];
    NSIndexPath *chosenBrandIndex = [self.collectionViewBrands indexPathForCell:chosenBrand];
    SnusBrand *brand = self.snusBrands[chosenBrandIndex.row];
    return brand;
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
        self.chosenBrand = brand;
        SnusBrandCollectionCell *brandCell = (SnusBrandCollectionCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Brand Cell" forIndexPath:indexPath];
        
        brandCell.labelBrandName.text = [brand.name uppercaseString];
        brandCell.labelBrandManufacturer.text = [brand.manufacturer uppercaseString];
        
        brandCell.labelBrandName.font = FONT_LATO_HAIRLINE(25);
        brandCell.labelBrandManufacturer.font = FONT_LATO_HAIRLINE(12);
        return brandCell;
    }
    else if(collectionView == self.collectionViewTypes)
    {
        SnusType *type = self.snusTypes[indexPath.row];
        self.chosenType = type;
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
