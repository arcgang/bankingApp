//
//  SidebarController2.m
//  ADVFlatUI
//
//  Created by Tope on 05/06/2013.
//  Copyright (c) 2013 App Design Vault. All rights reserved.
//

#import "SidebarController2.h"
#import "SidebarCell2.h"
#import <QuartzCore/QuartzCore.h>
#import "STAccountViewController.h"
#import "STAppDelegate.h"
#import "STCustomerViewController.h"
#import "Customer.h"
#import "JSONWrapper.h"

#define LIGHT_FONT      @"HelveticaNeue-Light"

#define ULTRALIGHT_FONT @"HelveticaNeue-UltraLight"

@interface SidebarController2 () <UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray* mutableItems;

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, assign) BOOL isMenuVisible;
@property (nonatomic, assign) NSInteger indexOfVisibleController;

@end

@implementation SidebarController2

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
    
     Customer *customer = [[Customer alloc] init];
    STAppDelegate *deleg = [[UIApplication sharedApplication] delegate];
    NSMutableString *fullName = [[NSMutableString alloc] init];
 NSMutableString *customerAPIURI = [[NSMutableString alloc] init];
    [customerAPIURI appendString:@"/api/customers/"];
    NSString *customerID = deleg.customerID;
    [customerAPIURI appendString:customerID];
    
  
    
    [JSONWrapper performRequestWithUri:customerAPIURI  completionHandler:^(NSDictionary *response, NSError *error) {
        
        if (error) {NSLog(@"error = %@", error);}
        
        NSLog(@"response: %@", response);
        
        
        
        NSString *fname = [response objectForKey:@"firstName"];
        NSString *lname = [response objectForKey:@"lastName"];
        
        
        [fullName appendString:fname];
        [fullName appendString:@" "];
        [fullName appendString:lname];
        
        customer.fullName = fullName;
        
        NSDictionary *accounts = [ response objectForKey:@"accounts"];
        
        customer.accounts = accounts;
        
        NSLog(@"contact pref%@", [response objectForKey:@"contactPreference"]);
         self.mutableItems = [[NSMutableArray alloc] init];
        
        for (NSDictionary *obj in accounts)
        {
            
            NSLog(@" Account Type ===> %@", [obj objectForKey:@"accountType"]);
            
            NSString *accountType = [obj objectForKey:@"accountType"];
            NSString *accountNumber = [obj objectForKey:@"accountNumber"];
            NSInteger len = [accountNumber length];
            NSMutableString *accountNumberLast4Digits =[[NSMutableString alloc]init];
            [accountNumberLast4Digits appendString:@"*"];
            [accountNumberLast4Digits appendString:[accountNumber substringFromIndex:(len - 4)]];
            
            
            NSDictionary* accountObject = [NSDictionary dictionaryWithObjects:@[accountType , accountNumberLast4Digits , @"account", obj ] forKeys:@[ @"title", @"count", @"icon", @"acctObj" ]];
            
            [self.mutableItems addObject: accountObject];

            
           
        }
        
        
        
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

 
    
    
        [deleg setCustomerModel:customer];
        self.profileNameLabel.text = fullName;
        self.profileLocationLabel.text = cityStateLabelTxt;
        
          NSMutableArray *accountsArray = [deleg accountsArray];
          self.items = [self.mutableItems copy];
        
        [ self.tableView reloadData];
        
               }]; // End of JSONWrapper. REST call to backend.
        
    


    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
    
    UIColor* mainColor = [UIColor colorWithRed:47.0/255 green:168.0/255 blue:228.0/255 alpha:1.0f];
    UIColor* darkColor = [UIColor colorWithRed:10.0/255 green:78.0/255 blue:108.0/255 alpha:1.0f];
    
    self.view.backgroundColor = darkColor;
    self.tableView.backgroundColor = darkColor;
    self.tableView.separatorColor = [UIColor clearColor];
    
    NSString* fontName = @"Avenir-Black";
    NSString* boldFontName = @"Avenir-BlackOblique";
    
    self.profileNameLabel.textColor = [UIColor whiteColor];
    self.profileNameLabel.font = [UIFont fontWithName:fontName size:14.0f];
    
    
    
    
    self.profileLocationLabel.textColor = mainColor;
    self.profileLocationLabel.font = [UIFont fontWithName:boldFontName size:12.0f];
//    self.profileLocationLabel.text = @"London, UK";
    
    self.profileImageView.image = [UIImage imageNamed:@"atlanta-world-hd-wallpaper-1920x1200-2656.jpg"];
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.borderWidth = 4.0f;
    self.profileImageView.layer.borderColor = [UIColor colorWithWhite:1.0f alpha:0.5f].CGColor;
    self.profileImageView.layer.cornerRadius = 35.0f;
    
    
//   NSDictionary* object1 = [NSDictionary dictionaryWithObjects:@[ @"Inbox", @"7", @"envelope" ] forKeys:@[ @"title", @"count", @"icon" ]];
//    NSDictionary* object2 = [NSDictionary dictionaryWithObjects:@[ @"Updates", @"7", @"check" ] forKeys:@[ @"title", @"count", @"icon" ]];
   NSDictionary* object3 = [NSDictionary dictionaryWithObjects:@[ @"Account", @"0", @"account" ] forKeys:@[ @"title", @"count", @"icon" ]];
    NSDictionary* object4 = [NSDictionary dictionaryWithObjects:@[ @"Profile", @"0", @"profile" ] forKeys:@[ @"title", @"count", @"icon" ]];
    NSDictionary* object5 = [NSDictionary dictionaryWithObjects:@[ @"Transactions", @"0", @"transactions" ] forKeys:@[ @"title", @"count", @"icon" ]];

    

//    self.items = @[object3, object4,object5];
    
 
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SidebarCell2* cell = [tableView dequeueReusableCellWithIdentifier:@"SidebarCell2"];
    
    NSDictionary* item = self.items[indexPath.row];
    
    cell.titleLabel.text = item[@"title"];
    cell.iconImageView.image = [UIImage imageNamed:item[@"icon"]];
    
    NSString* count = item[@"count"];
    if(![count isEqualToString:@"0"]){
        cell.countLabel.text = count;
    }
    else{
        cell.countLabel.alpha = 0;
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 46;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    DEMONavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    STAppDelegate *deleg = [[UIApplication sharedApplication] delegate];
    
    //UINavigationController *nav = [deleg nav];
    
   
   NSDictionary* item = self.items[indexPath.row];
    NSDictionary *acctObj = item[@"acctObj"];
     NSLog(@" Account Balance ===> %@", [acctObj objectForKey:@"accountNumber"]);
    
    
    NSMutableString *transactionAPIURI = [[NSMutableString alloc] init];
    [transactionAPIURI appendString:@"/api/customers/transactions/"];
    [transactionAPIURI appendString:[acctObj objectForKey:@"accountNumber"]];

    [JSONWrapper performRequestWithUri:transactionAPIURI completionHandler:^(NSDictionary *response, NSError *error) {
        
        NSString* boldFontName = @"Optima-ExtraBlack";
        

        UINavigationController *nav = [deleg nav];
        
        UIViewController* frontController = [[UIViewController alloc] init];
        UIImage *image = [UIImage imageNamed:@"atlanta-world-hd-wallpaper-1920x1200-2656.jpg"];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,  CGRectGetWidth(frontController.view.bounds), CGRectGetHeight(frontController.view.bounds))];
        [imageView setImage:image];

        UIButton* menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 28, 20)];
        [menuButton setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
        [menuButton addTarget:self action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
        
        frontController.navigationItem.leftBarButtonItem = menuItem;
        [frontController.view addSubview:imageView];
        
        STCustomerViewController *cust = [deleg customer];
        nav = [nav initWithRootViewController:frontController];
        
        //  Initialize Ribbon
        UIView *ribbon = [[UIView alloc]initWithFrame:CGRectMake(0, 0.5*self.view.center.y, self.view.bounds.size.width, 70)];
        [ribbon setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.25]];
        
        // Add Last Withdrawal static text
        UILabel *withDrawalText = [[UILabel alloc]initWithFrame:CGRectMake(0.1*ribbon.center.x,-20, CGRectGetWidth(ribbon.bounds), CGRectGetHeight(ribbon.bounds))];
        withDrawalText.textColor =  [UIColor whiteColor];
        withDrawalText.font =  [UIFont fontWithName:LIGHT_FONT size:15.0f];
        withDrawalText.text = @"Last Withdrawal";
        [ribbon addSubview:withDrawalText];
        
        
        //Withdrawal value label.
        UILabel *customerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.2*ribbon.center.x,0, CGRectGetWidth(ribbon.bounds), CGRectGetHeight(ribbon.bounds))];
        customerLabel.textColor =  [UIColor redColor];
        customerLabel.font =  [UIFont fontWithName:boldFontName size:14.0f];
        //NSMutableString *dollarValue = [[NSMutableString alloc] init];
        
        customerLabel.text = [response objectForKey:@"lastWithdrawal"];
        [ribbon addSubview:customerLabel];
        
        //Withdrawal date label
        UILabel *cityStateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.1*ribbon.center.x,23, CGRectGetWidth(ribbon.bounds), CGRectGetHeight(ribbon.bounds))];
        cityStateLabel.textColor =  [UIColor whiteColor];
        cityStateLabel.font =  [UIFont fontWithName:LIGHT_FONT size:12.0f];
        cityStateLabel.text = [response objectForKey:@"lastWithdrawalDate"];
        [ribbon addSubview:cityStateLabel];
        
        
        /// Section to add Last Deposit
        
        // Add Last Withdrawal static text
        UILabel *depositText = [[UILabel alloc]initWithFrame:CGRectMake(1.1*ribbon.center.x,-20, CGRectGetWidth(ribbon.bounds), CGRectGetHeight(ribbon.bounds))];
        depositText.textColor =  [UIColor whiteColor];
        depositText.font =  [UIFont fontWithName:LIGHT_FONT size:15.0f];
        depositText.text = @"Last Deposit";
        [ribbon addSubview:depositText];
        
        
        //Withdrawal value label.
        UILabel *lastDepositAmount = [[UILabel alloc]initWithFrame:CGRectMake(1.2*ribbon.center.x,0, CGRectGetWidth(ribbon.bounds), CGRectGetHeight(ribbon.bounds))];
        lastDepositAmount.textColor =  [UIColor whiteColor];
        lastDepositAmount.font =  [UIFont fontWithName:boldFontName size:14.0f];
        lastDepositAmount.text = [response objectForKey:@"lastDeposit"];
        [ribbon addSubview:lastDepositAmount];
        
        //Withdrawal date label
        UILabel *lastDepositDate = [[UILabel alloc]initWithFrame:CGRectMake(1.1*ribbon.center.x,23, CGRectGetWidth(ribbon.bounds), CGRectGetHeight(ribbon.bounds))];
        lastDepositDate.textColor =  [UIColor whiteColor];
        lastDepositDate.font =  [UIFont fontWithName:LIGHT_FONT size:12.0f];
        lastDepositDate.text = [response objectForKey:@"lastDepositDate"];
        [ribbon addSubview:lastDepositDate];

        
//        [frontController.view addSubview:ribbon];
        
        //Scroll View to scroll the account transactions
        
        CGRect fullScreenRect=[[UIScreen mainScreen] applicationFrame];
        UIScrollView *txnScrollView = [[UIScrollView alloc] initWithFrame:fullScreenRect];
        txnScrollView.contentSize = CGSizeMake(320,900); //frontController.view.bounds.size;
        txnScrollView.contentInset=UIEdgeInsetsMake(64.0,0.0,44.0,0.0);
        txnScrollView.scrollIndicatorInsets=UIEdgeInsetsMake(64.0,0.0,44.0,0.0);
        txnScrollView.delegate = self;
        [txnScrollView addSubview:ribbon];

        
       NSDictionary *transactionItems = [response objectForKey:@"items"];
        int i = 3;
        for (NSDictionary *txn in transactionItems) {
            
            //  Initialize Ribbon
            UIView *ribbon = [[UIView alloc]initWithFrame:CGRectMake(0, (0.2+0.3*i)*self.view.center.y, self.view.bounds.size.width, 40)];
            //  Initialize Ribbon
//            UIView *accountRibbon = [[UIView alloc]initWithFrame:CGRectMake(0, (0.2+0.4*accountCount)*self.view.center.y, self.view.bounds.size.width, 70)];
            [ribbon setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.25]];
            
            
//            UILabel *accountNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, 0.4 * CGRectGetWidth(accountRibbon.bounds), aprFontSize)];
            
            // Add Last Withdrawal static text
            UILabel *withDrawalText = [[UILabel alloc]initWithFrame:CGRectMake(0,20, 0.4*CGRectGetWidth(ribbon.bounds), 12)];
            withDrawalText.textColor =  [UIColor whiteColor];
            withDrawalText.font =  [UIFont fontWithName:LIGHT_FONT size:15.0f];
            withDrawalText.text = @"Amount";
            [ribbon addSubview:withDrawalText];
            [txnScrollView addSubview:ribbon];
//            [frontController.view addSubview:ribbon];
            i++;
            
            NSLog(@"transaction item %@", [txn objectForKey:@"amount"]);
        }
        [frontController.view addSubview:txnScrollView];
        
//        UIViewController *vc = [nav topViewController];
        
        cust.contentViewController = nav;
        
        }
     ];
    
 /*     if (indexPath.section == 0 && indexPath.row == 0) {
          
 
    
//    UIStoryboard* sidebarStoryboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
//      
//    UIViewController *stCustomerViewController = [nav parentViewController];
    
    UIViewController* frontController = [[UIViewController alloc] init];
    
    UIImage *image = [UIImage imageNamed:@"atlanta-world-hd-wallpaper-1920x1200-2656.jpg"];
    //
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,  CGRectGetWidth(frontController.view.bounds), CGRectGetHeight(frontController.view.bounds))];
    [imageView setImage:image];
    
    STCustomerViewController *cust = [deleg customer];
    
    UIButton* menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 28, 20)];
    [menuButton setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    
    frontController.navigationItem.leftBarButtonItem = menuItem;
    [frontController.view addSubview:imageView];
    
    nav = [nav initWithRootViewController:frontController];
          
              NSString* boldFontName = @"Optima-ExtraBlack";
    
         Customer *customer = [deleg customerModel];

          
          //  Initialize Ribbon
            UIView *ribbon = [[UIView alloc]initWithFrame:CGRectMake(0, 0.5*self.view.center.y, self.view.bounds.size.width, 70)];
           [ribbon setBackgroundColor:[UIColor colorWithWhite:1.0 alpha:0.25]];
           const NSInteger aprFontSize = 22;
           UILabel *customerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.5*ribbon.center.x,0, CGRectGetWidth(ribbon.bounds), CGRectGetHeight(ribbon.bounds))];
           customerLabel.textColor =  [UIColor whiteColor];
           customerLabel.font =  [UIFont fontWithName:boldFontName size:18.0f];
           customerLabel.text = customer.fullName;
           
           [frontController.view addSubview:ribbon];
           
           //    [scrollView addSubview:ribbon];
           [ribbon addSubview:customerLabel];
           const NSInteger cityStateFontLabel = 12;
           UILabel *cityStateLabel = [[UILabel alloc]initWithFrame:CGRectMake(0.55*ribbon.center.x,25, CGRectGetWidth(ribbon.bounds), CGRectGetHeight(ribbon.bounds))];
           
           //self.customerLabel = [[UILabel alloc] init];
           
           cityStateLabel.textColor =  [UIColor whiteColor];
           cityStateLabel.font =  [UIFont fontWithName:boldFontName size:12.0f];
           cityStateLabel.text = customer.city;
           [ribbon addSubview:cityStateLabel];
          
          [frontController.view addSubview:ribbon];
          
           UIViewController *vc = [nav topViewController];
          
          cust.contentViewController = nav;
      } else if (indexPath.section == 0 && indexPath.row == 1) {
          STCustomerViewController *cust = [deleg customer];
          UINavigationController *pnav = [deleg prevNav];
          cust.contentViewController = pnav;
          
          
      
      } */

    NSLog(@"index section %d", indexPath.section);
     NSLog(@"index row %d", indexPath.row);

}

- (void)revealToggle:(id)sender {
    //SidebarController1 *rearVC = (SidebarController1 *)self.sidebarViewController;
    STAppDelegate *deleg = [[UIApplication sharedApplication] delegate];
    STCustomerViewController *cust = [deleg customer];
    
    [cust toggleSidebar:!cust.sidebarShowing duration:kGHRevealSidebarDefaultAnimationDuration];
}


- (CGRect)offScreenFrame
{
    return CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
