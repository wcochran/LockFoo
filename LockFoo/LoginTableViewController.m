//
//  LoginTableViewController.m
//  LockFoo
//
//  Created by Wayne Cochran on 6/10/14.
//  Copyright (c) 2014 WSUV. All rights reserved.
//

#import "LoginTableViewController.h"
#import "AppDelegate.h"

@interface LoginTableViewController ()

@end

@implementation LoginTableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// STATIC CELLS

- (IBAction)login:(id)sender {
    
    NSString *username = [self.usernameTextField text];
    NSString *password = [self.passwordTextfield text];
    
    NSLog(@"login: username=%@, password=%@", username, password);
    
    if ([username isEqualToString:@"foo"] && [password isEqualToString:@"bar"]) {
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        appDelegate.userLoggedIn = YES;
        [self dismissViewControllerAnimated:YES completion:^{
            if ([self.loginDelegate respondsToSelector:@selector(didLogin)]) {
                [self.loginDelegate didLogin];
            }
        }];
    }
}

@end
