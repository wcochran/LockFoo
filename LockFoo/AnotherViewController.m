//
//  AnotherViewController.m
//  LockFoo
//
//  Created by Wayne Cochran on 6/10/14.
//  Copyright (c) 2014 WSUV. All rights reserved.
//

#import "AnotherViewController.h"

@interface AnotherViewController ()
@property (strong, nonatomic) UIImageView *lockImageView;
@end

@implementation AnotherViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)showHideLock:(id)sender {
    if (self.lockImageView == nil) {
//        self.lockImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
//        self.lockImageView.image = [UIImage imageNamed:@"Lock"];
        UIImage *lockImage = [UIImage imageNamed:@"lock"];
        NSLog(@"lockImage = %@, size=%@", lockImage, NSStringFromCGSize(lockImage.size));
        self.lockImageView = [[UIImageView alloc] initWithImage:lockImage];
        NSLog(@"lockImageView = %@", self.lockImageView);
        [self.view addSubview:self.lockImageView];
    } else {
        [self.lockImageView removeFromSuperview];
        self.lockImageView = nil;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Show/Hide Lock" style:UIBarButtonItemStylePlain target:self action:@selector(showHideLock:)];
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
