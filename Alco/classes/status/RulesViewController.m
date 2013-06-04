//
//  RulesViewController.m
//  Ersh
//
//  Created by Mike on 21.12.12.
//  Copyright (c) 2012 R&M. All rights reserved.
//

#import "RulesViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface RulesViewController ()

@end

@implementation RulesViewController

- (void)viewWillAppear:(BOOL)animated{
    [TestFlight passCheckpoint:@"Rules opened"];
    [self setTitle:@"Правила игры"];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{ NSLog (@"");
    [super viewDidLoad];
    UIView *page;
    _pageControl.imageNormal = [UIImage imageNamed:@"rules_dotNormalPage.png"];
    _pageControl.imageCurrent = [UIImage imageNamed:@"rules_dotCurrentPage.png"];
    if (IS_IPHONE_5) {
        _scrollView.frame = CGRectMake(0, 0, 320, 350);
        page = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 350)];
    }else{
        _scrollView.frame = CGRectMake(0, 0, 320, 350);
        page = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 350)];
    }
    
    page.backgroundColor = [UIColor clearColor];
    
    UIImageView *background = [[UIImageView alloc] initWithFrame:CGRectMake(12, 0, 296, 350)];
    background.image = [UIImage imageNamed:@"rules_whiteTextBackground.png"];
    [page addSubview:background];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(27, 15, 266, 150)];
    image.image = [UIImage imageNamed:@"rules_illustration1.jpg"];
    [page addSubview:image];
    
    UILabel *heading = [[UILabel alloc] initWithFrame:CGRectMake(28, 171 + 5, 250, 32)];
    heading.backgroundColor = [UIColor clearColor];
    heading.font = [UIFont fontWithName:@"MyriadPro-BoldCond" size:25.0];
    heading.textColor = UIColorFromRGB(0x525c66);
    heading.text = @"Коротко об игре";
    [page addSubview:heading];
    
    UILabel *bodyText = [[UILabel alloc] initWithFrame:CGRectMake(28, 205 + 5, 264, 125)];
    bodyText.backgroundColor = [UIColor clearColor];
    bodyText.numberOfLines = 0;
    bodyText.textColor = UIColorFromRGB(0x525c66);
    bodyText.text = @"Соберите компанию, в которой планируете хорошо повеселиться.\nПриготовьте напитки: они могут быть любыми. Разумеется, особую пикантность игре придаёт алкоголь.\nОпределите объём штрафной, которую будет выпивать игрок, если откажется от задания или не сможет его выполнить.";
    bodyText.font = [UIFont fontWithName:@"MyriadPro-Cond" size:14.0];
    [page addSubview:bodyText];
    
    
    
    UIView *page1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 350)];
    page1.backgroundColor = [UIColor clearColor];
    
    UIImageView *background1 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 0, 296, 350)];
    background1.image = [UIImage imageNamed:@"rules_whiteTextBackground.png"];
    [page1 addSubview:background1];
    
    UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(27, 15, 266, 150)];
    image1.image = [UIImage imageNamed:@"rules_illustration2.jpg"];
    [page1 addSubview:image1];
    
    UILabel *heading1 = [[UILabel alloc] initWithFrame:CGRectMake(28, 171 + 5, 250, 32)];
    heading1.backgroundColor = [UIColor clearColor];
    heading1.font = [UIFont fontWithName:@"MyriadPro-BoldCond" size:25.0];
    heading1.textColor = UIColorFromRGB(0x525c66);
    heading1.text = @"Как играть-то?";
    [page1 addSubview:heading1];
    
    UILabel *bodyText1 = [[UILabel alloc] initWithFrame:CGRectMake(28, 205 + 5, 264, 125)];
    bodyText1.backgroundColor = [UIColor clearColor];
    bodyText1.numberOfLines = 0;
    bodyText1.textColor = UIColorFromRGB(0x525c66);
    bodyText1.text = @"Теперь начните выполнять задания: прочитайте своё вслух, а затем сделайте, что написано. Не можете - выпейте штрафную. Затем передайте телефон или планшет своему соседу справа, пусть он выполняет другое задание.";
    bodyText1.font = [UIFont fontWithName:@"MyriadPro-Cond" size:16.0];
    [page1 addSubview:bodyText1];
    
    
    
    UIView *page2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 350)];
    page2.backgroundColor = [UIColor clearColor];
    
    UIImageView *background2 = [[UIImageView alloc] initWithFrame:CGRectMake(12, 0, 296, 350)];
    background2.image = [UIImage imageNamed:@"rules_whiteTextBackground.png"];
    [page2 addSubview:background2];
    
    UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(27, 15, 266, 150)];
    image2.image = [UIImage imageNamed:@"rules_illustration3.jpg"];
    [page2 addSubview:image2];
    
    UILabel *heading2 = [[UILabel alloc] initWithFrame:CGRectMake(28, 171 + 5, 250, 32)];
    heading2.backgroundColor = [UIColor clearColor];
    heading2.font = [UIFont fontWithName:@"MyriadPro-BoldCond" size:25.0];
    heading2.textColor = UIColorFromRGB(0x525c66);
    heading2.text = @"И внезапно...";
    [page2 addSubview:heading2];
    
    UILabel *bodyText2 = [[UILabel alloc] initWithFrame:CGRectMake(28, 205 + 5, 264, 125)];
    bodyText2.backgroundColor = [UIColor clearColor];
    bodyText2.numberOfLines = 0;
    bodyText2.textColor = UIColorFromRGB(0x525c66);
    bodyText2.text = @"Если вместо задания попалась карта медведя, нужно громко объявить: «Белый медведь пришёл!» - и подождать, пока все игроки, кроме вас, нырнут под стол. После того как белый медведь схватил самого нерасторопного игрока, можно объявлять: «Белый медведь ушёл!» и разрешать вылезать из-под стола.";
    bodyText2.font = [UIFont fontWithName:@"MyriadPro-Cond" size:15.0];
    [page2 addSubview:bodyText2];

    
    
    NSArray *array = [NSArray arrayWithObjects:page, page1, page2, nil];
    pageViewManager = [[PageViewManager alloc] initWithScrollView:_scrollView pageControl:_pageControl];
    [pageViewManager loadPages:array];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setPageControl:nil];
    [self setScrollView:nil];
    [super viewDidUnload];
}
@end
