//
//  TWTViewController.m
//  LocalizeTesting
//
//  Created by Josh Johnson on 3/8/14.
//  Copyright (c) 2014 Two Toasters, LLC. All rights reserved.
//

#import "TWTViewController.h"

typedef NS_ENUM(NSUInteger, TWTGenderType) {
    TWTGenderTypeMale = 0,
    TWTGenderTypeFemale,
    TWTGenderTypeNeutral
};

@interface TWTViewController ()

@property (weak, nonatomic) IBOutlet UILabel *zeroLabel;
@property (weak, nonatomic) IBOutlet UILabel *oneLabel;
@property (weak, nonatomic) IBOutlet UILabel *oneOfOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *pluralLabel;

@property (weak, nonatomic) IBOutlet UILabel *maleLabel;
@property (weak, nonatomic) IBOutlet UILabel *femaleLabel;
@property (weak, nonatomic) IBOutlet UILabel *neutralLabel;

@end

@implementation TWTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Reset" forState:UIControlStateNormal];
    button.frame = CGRectMake(20, 40, 100, 20);
    [button addTarget:self action:@selector(resetStrings) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [self resetStrings];
}

- (void)resetStrings
{
    // Plural Rules
    
    NSInteger totalMovies = 32;
    
    NSString *zeroRunString = [NSString localizedStringWithFormat:NSLocalizedString(@"%lu out of %lu Hasselhoff movies watched", nil), 0, totalMovies, nil];
    self.zeroLabel.text = zeroRunString;
    
    NSString *oneOfOneString = [NSString localizedStringWithFormat:NSLocalizedString(@"%lu out of %lu Hasselhoff movies watched", nil), 1, 1, nil];
    self.oneOfOneLabel.text = oneOfOneString;
    
    NSString *singularString = [NSString localizedStringWithFormat:NSLocalizedString(@"%lu out of %lu Hasselhoff movies watched", nil), 22, totalMovies, nil];
    self.oneLabel.text = singularString;
    
    NSString *pluralString = [NSString localizedStringWithFormat:@"%lu out of %lu Hasselhoff movies watched", 2lu, totalMovies, nil];
    self.pluralLabel.text = pluralString;
    
    // Gender
    
    NSString *hisString = [NSString localizedStringWithFormat:NSLocalizedString(@"%@ is %lu (his/her/their) name", nil), @"Nick", TWTGenderTypeMale, nil];
    self.maleLabel.text = hisString;

    NSString *herString = [NSString localizedStringWithFormat:NSLocalizedString(@"%@ is %lu (his/her/their) name", nil), @"Kayla", TWTGenderTypeFemale, nil];
    self.femaleLabel.text = herString;

    NSString *theirString = [NSString localizedStringWithFormat:NSLocalizedString(@"%@ is %lu (his/her/their) name", nil), @"Sam", TWTGenderTypeNeutral, nil];
    self.neutralLabel.text = theirString;
    
}

@end
