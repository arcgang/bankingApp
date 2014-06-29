//
//  STAccountViewController.m
//  SunTrust
//
//  Created by Archan Ganguly on 6/15/14.
//  Copyright (c) 2014 Archan Ganguly. All rights reserved.
//

#import "STAccountViewController.h"
#import "STAppDelegate.h"

@interface STAccountViewController ()

@end

@implementation STAccountViewController

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
    
    
    
    UIStoryboard* sidebarStoryboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    
    
    
    UIViewController *rearVC = [sidebarStoryboard instantiateViewControllerWithIdentifier:@"SlideBarController1"];
    
    
    STAppDelegate *deleg = [[UIApplication sharedApplication] delegate];
    
    UINavigationController *nav = [deleg nav];
    
//    UINavigationController *nav = [sidebarStoryboard instantiateViewControllerWithIdentifier:@"commonController"];
    
    UIViewController* frontController = [[UIViewController alloc] init];
    //    frontController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"images.jpg"]];
    
    UIImage *image = [UIImage imageNamed:@"images.jpg"];
    //
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,  CGRectGetWidth(frontController.view.bounds), CGRectGetHeight(frontController.view.bounds))];
    [imageView setImage:image];
    
    
//    UINavigationController *nav = [sidebarStoryboard instantiateViewControllerWithIdentifier:@"commonController"];
    nav = [nav initWithRootViewController:frontController];
    //    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:frontController];
    
    
    UIButton* menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 28, 20)];
    [menuButton setBackgroundImage:[UIImage imageNamed:@"menu.png"] forState:UIControlStateNormal];
    [menuButton addTarget:self action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem* menuItem = [[UIBarButtonItem alloc] initWithCustomView:menuButton];
    [frontController.view addSubview:imageView];
    frontController.navigationItem.leftBarButtonItem = menuItem;
    
    self.contentViewController = nav;
    self.sidebarViewController = rearVC;
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
