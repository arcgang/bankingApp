//
//  STCustomerViewController.m
//  SunTrust
//
//  Created by Archan Ganguly on 6/14/14.
//  Copyright (c) 2014 Archan Ganguly. All rights reserved.
//

#import "STCustomerViewController.h"
#import "STAppDelegate.h"
#import "JSONWrapper.h"

#define LIGHT_FONT      @"HelveticaNeue-Light"

#define ULTRALIGHT_FONT @"HelveticaNeue-UltraLight"

@interface STCustomerViewController ()

@property (strong, nonatomic) UILabel *currentTemperatureLabel;
@property (strong, nonatomic) UILabel *interestRateLabel;

@property (nonatomic, weak) IBOutlet UIImageView* profileBgImageView;

@property (nonatomic, weak) IBOutlet UIImageView* profileImageView;

@property (nonatomic, weak) IBOutlet UIView* overlayView;

@property (nonatomic, weak) IBOutlet UIImageView* friendImageView1;

@property (nonatomic, weak) IBOutlet UIImageView* friendImageView2;

@property (nonatomic, weak) IBOutlet UIImageView* friendImageView3;

@property (nonatomic, weak) IBOutlet UILabel* nameLabel;

@property (nonatomic, weak) IBOutlet UILabel* usernameLabel;

@property (nonatomic, weak) IBOutlet UILabel* followerLabel;

@property (nonatomic, weak) IBOutlet UILabel* followingLabel;

@property (nonatomic, weak) IBOutlet UILabel* updateLabel;

@property (nonatomic, weak) IBOutlet UILabel* followerCountLabel;

@property (nonatomic, weak) IBOutlet UILabel* followingCountLabel;

@property (nonatomic, weak) IBOutlet UILabel* updateCountLabel;

@property (nonatomic, weak) IBOutlet UILabel* bioLabel;

@property (nonatomic, weak) IBOutlet UILabel* friendLabel;

@property (nonatomic, weak) IBOutlet UIView* bioContainer;

@property (nonatomic, weak) IBOutlet UIView* friendContainer;

@property (nonatomic, weak) IBOutlet UIView* countContainer;

@property (nonatomic, weak) IBOutlet UIScrollView* scrollView;


@property (strong, nonatomic) UILabel* customerLabel;
@property (strong, nonatomic) UILabel* cityStateLabel;

@property (nonatomic, strong) NSMutableArray* mutableItems;
//@property (nonatomic, strong) NSArray *items;


@end

@implementation STCustomerViewController

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
    UIColor* mainColor = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:1.0f];
    
    NSString* fontName = @"Optima-Italic";
    NSString* boldFontName = @"Optima-ExtraBlack";
    
    self.nameLabel.textColor =  [UIColor whiteColor];
    self.nameLabel.font =  [UIFont fontWithName:boldFontName size:18.0f];
    self.nameLabel.text = @"Maria Llewellyngot";
    
    
    self.usernameLabel.textColor =  [UIColor whiteColor];
    self.usernameLabel.font =  [UIFont fontWithName:fontName size:14.0f];
    self.usernameLabel.text = @"@llewellyngot";
    
    UIFont* countLabelFont = [UIFont fontWithName:boldFontName size:20.0f];
    self.followerCountLabel.textColor =  mainColor;
    self.followerCountLabel.font =  countLabelFont;
    self.followerCountLabel.text = @"132k";
    
    self.followingCountLabel.textColor =  mainColor;
    self.followingCountLabel.font =  countLabelFont;
    self.followingCountLabel.text = @"200";
    
    self.updateCountLabel.textColor =  mainColor;
    self.updateCountLabel.font =  countLabelFont;
    self.updateCountLabel.text = @"20k";
    
    
    UIFont* socialFont = [UIFont fontWithName:boldFontName size:10.0f];
    UIColor* socialColor = [UIColor lightGrayColor];
    
    self.followerLabel.textColor =  socialColor;
    self.followerLabel.font =  socialFont;
    self.followerLabel.text = @"FOLLOWERS";
    
    self.followingLabel.textColor =  socialColor;
    self.followingLabel.font =  socialFont;
    self.followingLabel.text = @"FOLLOWING";
    
    self.updateLabel.textColor =  socialColor;
    self.updateLabel.font =  socialFont;
    self.updateLabel.text = @"UPDATES";
    
    
    self.bioLabel.textColor =  mainColor;
    self.bioLabel.font =  [UIFont fontWithName:fontName size:14.0f];
    self.bioLabel.text = @"Founder, CEO of Mavin Records, Entrepreneur mom and action gal";
    
    self.friendLabel.textColor =  mainColor;
    self.friendLabel.font =  [UIFont fontWithName:boldFontName size:20.0f];;
    self.friendLabel.text = @"Friends";
    
    self.profileBgImageView.image = [UIImage imageNamed:@"bridge.jpg"];
    self.profileBgImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    self.profileImageView.image = [UIImage imageNamed:@"profile.jpg"];
    self.profileImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.cornerRadius = 48.0f;
    self.profileImageView.layer.borderWidth = 4.0f;
    self.profileImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    
    self.overlayView.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.5f];
    
    self.countContainer.backgroundColor = [UIColor colorWithWhite:0.95 alpha:0.5f];
    
    self.bioContainer.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.bioContainer.layer.borderWidth = 1.0f;
    
    self.friendContainer.layer.borderColor = [UIColor colorWithWhite:0.9 alpha:0.7].CGColor;
    self.friendContainer.layer.borderWidth = 1.0f;
    
    UIColor* imageBorderColor = [UIColor colorWithRed:50.0/255 green:102.0/255 blue:147.0/255 alpha:0.4f];
    
   
    
    self.scrollView.contentSize = CGSizeMake(320, 590);
    
    
    
    UIStoryboard* sidebarStoryboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    
    

    UIViewController *rearVC = [sidebarStoryboard instantiateViewControllerWithIdentifier:@"SlideBarController1"];
    
    UIViewController* frontController = [[UIViewController alloc] init];
//    frontController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"images.jpg"]];
    
    CGRect fullScreenRect=[[UIScreen mainScreen] applicationFrame];
    UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:fullScreenRect];
    scrollView.contentSize=CGSizeMake(320,758);
    
    
    scrollView.contentInset=UIEdgeInsetsMake(64.0,0.0,44.0,0.0);
    scrollView.scrollIndicatorInsets=UIEdgeInsetsMake(64.0,0.0,44.0,0.0);
   // [frontController.view addSubview:scrollView];
    
    UIImage *image = [UIImage imageNamed:@"atlanta-world-hd-wallpaper-1920x1200-2656.jpg"];
    //
       UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,  CGRectGetWidth(frontController.view.bounds), CGRectGetHeight(frontController.view.bounds))];
    [imageView setImage:image];
    
    
    UINavigationController *nav = [sidebarStoryboard instantiateViewControllerWithIdentifier:@"commonController"];
    nav = [nav initWithRootViewController:frontController];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:frontController];
    
    
    UIButton* menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 28, 20)];
    [menuButton setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    
    frontController.navigationItem.leftBarButtonItem = menuItem;
   
      STAppDelegate *deleg = [[UIApplication sharedApplication] delegate];
    Customer *customer = [[Customer alloc] init];
    NSMutableString *customerAPIURI = [[NSMutableString alloc] init];
    [customerAPIURI appendString:@"/api/customers/"];
    NSString *customerID = deleg.customerID;
    [customerAPIURI appendString:customerID];
  
    
    [JSONWrapper performRequestWithUri:customerAPIURI completionHandler:^(NSDictionary *response, NSError *error) {
        
        if (error) {NSLog(@"error = %@", error);}
        
        NSLog(@"response: %@", response);
        
        
        
        NSString *fname = [response objectForKey:@"firstName"];
        NSString *lname = [response objectForKey:@"lastName"];
        
        NSMutableString *fullName = [[NSMutableString alloc] init];

        [fullName appendString:fname];
        [fullName appendString:@" "];
        [fullName appendString:lname];
        
        customer.fullName = fullName;
        
        NSDictionary *accounts = [ response objectForKey:@"accounts"];
        
        customer.accounts = accounts;
        
        NSLog(@"contact pref%@", [response objectForKey:@"contactPreference"]);
        
        
        
        NSDictionary *contactPref = [ response objectForKey:@"contactPreference"];
        NSDictionary *postalAddress = nil;
        
        NSMutableString *cityStateLabelTxt = [[NSMutableString alloc] init];
        
       

        
        for (NSDictionary *obj in contactPref)
        {
            
            postalAddress =  [obj objectForKey:@"postalAddress"];
            
            for (NSDictionary *pAddres in postalAddress) {
                
                [cityStateLabelTxt appendString:[pAddres objectForKey:@"city"]];
                
                customer.city = [pAddres objectForKey:@"city"];
                
                [cityStateLabelTxt appendString:@", "];
                [cityStateLabelTxt appendString:[pAddres objectForKey:@"stateCode"]];
                
                customer.state = [pAddres objectForKey:@"stateCode"];
            }
        }
        
        
        
        [frontController.view addSubview:imageView];
       
    
    
    //  Initialize Ribbon
  /*  UIView *ribbon = [[UIView alloc]initWithFrame:CGRectMake(0, 0.5*self.view.center.y, self.view.bounds.size.width, 70)];
    [ribbon setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.25]];
    const NSInteger aprFontSize = 22;
    self.customerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.5*ribbon.center.x,0, CGRectGetWidth(ribbon.bounds), CGRectGetHeight(ribbon.bounds))];
    self.customerLabel.textColor =  [UIColor whiteColor];
    self.customerLabel.font =  [UIFont fontWithName:boldFontName size:18.0f];
    self.customerLabel.text = fullName;
   
    [frontController.view addSubview:ribbon];
        
    //    [scrollView addSubview:ribbon];
    [ribbon addSubview:self.customerLabel];
        const NSInteger cityStateFontLabel = 12;
        self.cityStateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.55*ribbon.center.x,25, CGRectGetWidth(ribbon.bounds), CGRectGetHeight(ribbon.bounds))];
        
        //self.customerLabel = [[UILabel alloc] init];
        
        self.cityStateLabel.textColor =  [UIColor whiteColor];
        self.cityStateLabel.font =  [UIFont fontWithName:boldFontName size:12.0f];
        self.cityStateLabel.text = cityStateLabelTxt;
        [ribbon addSubview:self.cityStateLabel];*/
         [deleg setCustomerModel:customer];
        
        self.mutableItems = [[NSMutableArray alloc] init];
       
        
        int accountCount = 0;
        for (NSDictionary *obj in accounts)
        {
            
            
            NSString *accountType = [obj objectForKey:@"accountType"];
            
            NSDictionary* accountObject = [NSDictionary dictionaryWithObjects:@[accountType , @"0", @"account" ] forKeys:@[ @"title", @"count", @"icon" ]];
            
            [self.mutableItems addObject: accountObject];

            
            
            UITapGestureRecognizer *singleFingerTap =
            [[UITapGestureRecognizer alloc] initWithTarget:self
                                                    action:@selector(handleSingleTap:)];
            
            NSLog(@"%@", [obj objectForKey:@"accountType"]);
            
            //  Initialize Ribbon
            UIView *accountRibbon = [[UIView alloc]initWithFrame:CGRectMake(0, (0.2+0.4*accountCount)*self.view.center.y, self.view.bounds.size.width, 70)];
            [accountRibbon setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.25]];
            [accountRibbon addGestureRecognizer:singleFingerTap];
            [accountRibbon setTag:accountCount];
            
            ///Account Type Labels
            const NSInteger rateNameFontSize = 22;
            UILabel *accountTypeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,  0, CGRectGetWidth(accountRibbon.bounds), CGRectGetHeight(accountRibbon.bounds))];
            [accountTypeLabel setFont:[UIFont fontWithName:LIGHT_FONT size:rateNameFontSize]];
            [accountTypeLabel setBackgroundColor:[UIColor clearColor]];
            [accountTypeLabel setTextColor:[UIColor whiteColor]];
            [accountTypeLabel setTextAlignment:NSTextAlignmentCenter];
            [accountTypeLabel setText:[obj objectForKey:@"accountType"]];
            [accountRibbon addSubview:accountTypeLabel];
            
            [frontController.view addSubview:accountRibbon];
            
            const NSInteger aprFontSize = 12;
            UILabel *accountNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 0.4 * CGRectGetWidth(accountRibbon.bounds), aprFontSize)];
            [accountNumberLabel setFont:[UIFont fontWithName:LIGHT_FONT size:aprFontSize]];
            [accountNumberLabel setBackgroundColor:[UIColor clearColor]];
            [accountNumberLabel setTextColor:[UIColor whiteColor]];
            [accountNumberLabel setTextAlignment:NSTextAlignmentCenter];
            [accountNumberLabel setText:@"Account Number"];
            [accountNumberLabel setHidden:TRUE];
            [accountRibbon addSubview:accountNumberLabel];
            
            const NSInteger fontSize = 15;
            UILabel *accountNumberTxt = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, 0.4 * CGRectGetWidth(accountRibbon.bounds), fontSize)];
            [accountNumberTxt setFont:[UIFont fontWithName:LIGHT_FONT size:fontSize]];
            [accountNumberTxt setBackgroundColor:[UIColor clearColor]];
            [accountNumberTxt setTextColor:[UIColor whiteColor]];
            [accountNumberTxt setTextAlignment:NSTextAlignmentCenter];
            [accountNumberTxt setText:[obj objectForKey:@"accountNumber"]];
            [accountNumberTxt setHidden:TRUE];
            [accountRibbon addSubview:accountNumberTxt];
            
            /*const NSInteger balanceLabelFontSize = 15;
            UILabel *balanceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 1.4 * CGRectGetWidth(accountRibbon.bounds), balanceLabelFontSize)];
            [balanceLabel setFont:[UIFont fontWithName:LIGHT_FONT size:balanceLabelFontSize]];
            [balanceLabel setBackgroundColor:[UIColor clearColor]];
            [balanceLabel setTextColor:[UIColor whiteColor]];
            [balanceLabel setTextAlignment:NSTextAlignmentCenter];
            [balanceLabel setText:@"Balance"];
            [balanceLabel setHidden:TRUE];
            [accountRibbon addSubview:balanceLabel];*/
            
            NSMutableString *accountBalance = [[NSMutableString alloc] init];
            [accountBalance appendString:@"$"];
            NSString *balance = [obj objectForKey:@"accountBalance"];
            [accountBalance appendString:balance];
            
            const NSInteger balanceTxtFontSize = 40;
            UILabel *balanceTxt = [[UILabel alloc]initWithFrame:CGRectMake(0, 18, 1.4 * CGRectGetWidth(accountRibbon.bounds), balanceTxtFontSize)];
            [balanceTxt setFont:[UIFont fontWithName:LIGHT_FONT size:balanceTxtFontSize]];
            [balanceTxt setBackgroundColor:[UIColor clearColor]];
            [balanceTxt setTextColor:[UIColor whiteColor]];
            [balanceTxt setTextAlignment:NSTextAlignmentCenter];
            [balanceTxt setText:accountBalance];
            [balanceTxt setHidden:TRUE];
            [accountRibbon addSubview:balanceTxt];

            
            
            
            
            accountCount++;
        }
        
        
        // set account array in global scope. To be used in SideBar Controller for side bar options
        [deleg setAccountsArray:self.mutableItems];
        
          self.sidebarViewController = rearVC;
        
    }];

    
   /// self.navigationItem.leftBarButtonItem = menuItem;
    
  
    [deleg setNav:nav];
    [deleg setPrevNav:nav];
    
    
    self.contentViewController = nav;
//    self.sidebarViewController = rearVC;
    
    [deleg setCustomer:self];
    
    
}

//The event handling method
- (void)handleSingleTap:(UITapGestureRecognizer *)recognizer {
    // self.interestRateLabel.hidden = YES;
    

    NSArray *arrayView = recognizer.view.subviews;
    
    //    NSArray *arrayView = [recognizer.view.subviews];
    UILabel *accountType = arrayView[0];
    if(accountType.hidden){
        [accountType setHidden:FALSE];
        for (int i=1; i<arrayView.count; i++) {
            [arrayView[i] setHidden:TRUE];
        }
    }else {
        [accountType setHidden:TRUE];
        for (int i=1; i<arrayView.count; i++) {
            [arrayView[i] setHidden:FALSE];
        }
        
    }
    //  [arrayView[0] setHidden:TRUE];
    //    [self.interestRateLabel.hidden
    
}


- (void)revealToggle:(id)sender {
    //SidebarController1 *rearVC = (SidebarController1 *)self.sidebarViewController;
    
    [super toggleSidebar:!self.sidebarShowing duration:kGHRevealSidebarDefaultAnimationDuration];
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
