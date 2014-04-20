//
//  TWTViewController.m
//  LocalizeTesting
//
//  Created by Josh Johnson on 4/20/2014.
//  Copyright (c) 2014 Two Toasters.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
