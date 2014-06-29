//
//  STRatesViewController.m
//  SunTrust
//
//  Created by Archan Ganguly on 6/14/14.
//  Copyright (c) 2014 Archan Ganguly. All rights reserved.
//

#import "STRatesViewController.h"
#import "JSONWrapper.h"

#define LIGHT_FONT      @"HelveticaNeue-Light"

#define ULTRALIGHT_FONT @"HelveticaNeue-UltraLight"

@interface STRatesViewController ()

@property (strong, nonatomic) UILabel *currentTemperatureLabel;
@property (strong, nonatomic) UILabel *interestRateLabel;

// Light-Colored ribbon to display temperatures and forecasts on
//@property (strong, nonatomic) UIView                    *ribbon;

@end

@implementation STRatesViewController

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
    // Do any additional setup after loading the view.
    
    [JSONWrapper performRequestWithUri:@"/api/rates"  completionHandler:^(NSDictionary *response, NSError *error) {
        
        if (error) {NSLog(@"error = %@", error);}
        
        // NSLog(@"response: %@", response);
        
        

        
        for (NSDictionary *obj in response)
        {
            //            [self.myData addObject:obj];
            //  NSLog(@"each Object: %@", obj);
            NSLog(@"%@", [obj objectForKey:@"rates"]);
            
            
            NSDictionary *ratesArray =[ obj objectForKey:@"rates"];
            int i=0;
            for (NSDictionary *rates in ratesArray) {
                NSLog(@"each Rate: %@", rates);
                
                NSLog(@"APR ->%@", [rates objectForKey:@"APR"]);
                
                UITapGestureRecognizer *singleFingerTap =
                [[UITapGestureRecognizer alloc] initWithTarget:self
                                                        action:@selector(handleSingleTap:)];
//                
//                UIScrollView *scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, (0.2+i*0.3) * self.view.center.y, self.view.bounds.size.width, 60)];
//                [scroller setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.25]];
//                [scroller setScrollEnabled:(YES)];
                
                
                //  Initialize Ribbon
                UIView *ribbon = [[UIView alloc]initWithFrame:CGRectMake(0, (0.2+i*0.3) * self.view.center.y, self.view.bounds.size.width, 60)];
                [ribbon setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.25]];
                [ribbon addGestureRecognizer:singleFingerTap];
                [ribbon setTag:i];
//                [self.view addSubview:scroller];
//                [scroller addSubview:ribbon];
              [self.view addSubview:ribbon];
                
                ///Rate Name
                const NSInteger rateNameFontSize = 22;
                self.interestRateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,  0, CGRectGetWidth(ribbon.bounds), CGRectGetHeight(ribbon.bounds))];
                [self.interestRateLabel setFont:[UIFont fontWithName:LIGHT_FONT size:rateNameFontSize]];
                [self.interestRateLabel setBackgroundColor:[UIColor clearColor]];
                [self.interestRateLabel setTextColor:[UIColor whiteColor]];
                [self.interestRateLabel setTextAlignment:NSTextAlignmentCenter];
                [self.interestRateLabel setText:[rates objectForKey:@"rateName"]];
                [ribbon addSubview:self.interestRateLabel];
                
                
                const NSInteger aprFontSize = 12;
                self.interestRateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, 0.2 * CGRectGetWidth(ribbon.bounds), aprFontSize)];
                [self.interestRateLabel setFont:[UIFont fontWithName:LIGHT_FONT size:aprFontSize]];
                [self.interestRateLabel setBackgroundColor:[UIColor clearColor]];
                [self.interestRateLabel setTextColor:[UIColor whiteColor]];
                [self.interestRateLabel setTextAlignment:NSTextAlignmentCenter];
                [self.interestRateLabel setText:@"APR"];
                [self.interestRateLabel setHidden:TRUE];
                [ribbon addSubview:self.interestRateLabel];
                
                const NSInteger fontSize = 20;
                self.currentTemperatureLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, 0.3 * CGRectGetWidth(ribbon.bounds), fontSize)];
                [self.currentTemperatureLabel setFont:[UIFont fontWithName:LIGHT_FONT size:fontSize]];
                [self.currentTemperatureLabel setBackgroundColor:[UIColor clearColor]];
                [self.currentTemperatureLabel setTextColor:[UIColor whiteColor]];
                [self.currentTemperatureLabel setTextAlignment:NSTextAlignmentCenter];
                [self.currentTemperatureLabel setText:[rates objectForKey:@"APR"]];
                [self.currentTemperatureLabel setHidden:TRUE];
                [ribbon addSubview:self.currentTemperatureLabel];
             
                
                
                const NSInteger discountFontSize = 12;
                self.interestRateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, 0.8 * CGRectGetWidth(ribbon.bounds), discountFontSize)];
                [self.interestRateLabel setFont:[UIFont fontWithName:LIGHT_FONT size:discountFontSize]];
                [self.interestRateLabel setBackgroundColor:[UIColor clearColor]];
                [self.interestRateLabel setTextColor:[UIColor whiteColor]];
                [self.interestRateLabel setTextAlignment:NSTextAlignmentCenter];
                [self.interestRateLabel setText:@"Discount Pts"];
                [self.interestRateLabel setHidden:TRUE];
                [ribbon addSubview:self.interestRateLabel];
                
                const NSInteger discountPtsFontSize = 22;
                self.currentTemperatureLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, 0.8* CGRectGetWidth(ribbon.bounds), discountPtsFontSize)];
                [self.currentTemperatureLabel setFont:[UIFont fontWithName:LIGHT_FONT size:discountPtsFontSize]];
                [self.currentTemperatureLabel setBackgroundColor:[UIColor clearColor]];
                [self.currentTemperatureLabel setTextColor:[UIColor whiteColor]];
                [self.currentTemperatureLabel setTextAlignment:NSTextAlignmentCenter];
                [self.currentTemperatureLabel setText:[rates objectForKey:@"discountPts"]];
                [self.currentTemperatureLabel setHidden:TRUE];
                [ribbon addSubview:self.currentTemperatureLabel];
                
            
                
                const NSInteger interestRateLabelFontSize = 12;
                self.interestRateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, 1.3 * CGRectGetWidth(ribbon.bounds), interestRateLabelFontSize)];
                [self.interestRateLabel setFont:[UIFont fontWithName:LIGHT_FONT size:interestRateLabelFontSize]];
                [self.interestRateLabel setBackgroundColor:[UIColor clearColor]];
                [self.interestRateLabel setTextColor:[UIColor whiteColor]];
                [self.interestRateLabel setTextAlignment:NSTextAlignmentCenter];
                [self.interestRateLabel setText:@"Interest Rate"];
                [self.interestRateLabel setHidden:TRUE];
                [ribbon addSubview:self.interestRateLabel];
                
                const NSInteger interestRateFontSize = 22;
                self.currentTemperatureLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, 1.3* CGRectGetWidth(ribbon.bounds), interestRateFontSize)];
                [self.currentTemperatureLabel setFont:[UIFont fontWithName:LIGHT_FONT size:interestRateFontSize]];
                [self.currentTemperatureLabel setBackgroundColor:[UIColor clearColor]];
                [self.currentTemperatureLabel setTextColor:[UIColor whiteColor]];
                [self.currentTemperatureLabel setTextAlignment:NSTextAlignmentCenter];
                [self.currentTemperatureLabel setText:[rates objectForKey:@"interestRate"]];
                [self.currentTemperatureLabel setHidden:TRUE];
                [ribbon addSubview:self.currentTemperatureLabel];

                
                
                const NSInteger originationFeeLabelFontSize = 12;
                self.interestRateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, 1.8 * CGRectGetWidth(ribbon.bounds), originationFeeLabelFontSize)];
                [self.interestRateLabel setFont:[UIFont fontWithName:LIGHT_FONT size:originationFeeLabelFontSize]];
                [self.interestRateLabel setBackgroundColor:[UIColor clearColor]];
                [self.interestRateLabel setTextColor:[UIColor whiteColor]];
                [self.interestRateLabel setTextAlignment:NSTextAlignmentCenter];
                [self.interestRateLabel setText:@"Orig Fee"];
                [self.interestRateLabel setHidden:TRUE];
                [ribbon addSubview:self.interestRateLabel];
                
                const NSInteger originationFeeFontSize = 22;
                self.currentTemperatureLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, 1.8* CGRectGetWidth(ribbon.bounds), originationFeeFontSize)];
                [self.currentTemperatureLabel setFont:[UIFont fontWithName:LIGHT_FONT size:originationFeeFontSize]];
                [self.currentTemperatureLabel setBackgroundColor:[UIColor clearColor]];
                [self.currentTemperatureLabel setTextColor:[UIColor whiteColor]];
                [self.currentTemperatureLabel setTextAlignment:NSTextAlignmentCenter];
                [self.currentTemperatureLabel setText:[rates objectForKey:@"originationFee"]];
                [self.currentTemperatureLabel setHidden:TRUE];
                [ribbon addSubview:self.currentTemperatureLabel];
                
                i++;
            }
        }
        
        
    }];
    
    
    
    
}


//The event handling method
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
   // self.interestRateLabel.hidden = YES;
    
    int v = recognizer.view.tag;
//    [recognizer.view setHidden:TRUE];
    NSArray *arrayView = recognizer.view.subviews;
    
//    NSArray *arrayView = [recognizer.view.subviews];
    UILabel *rateName = arrayView[0];
    if(rateName.hidden){
        [rateName setHidden:FALSE];
        for (int i=1; i<arrayView.count; i++) {
            [arrayView[i] setHidden:TRUE];
        }
    }else {
        [rateName setHidden:TRUE];
        for (int i=1; i<arrayView.count; i++) {
            [arrayView[i] setHidden:FALSE];
        }

    }
//  [arrayView[0] setHidden:TRUE];
//    [self.interestRateLabel.hidden
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
