#import "CDVErrorScreen.h"
#import "ConnectionFailedViewController.h"

@implementation CDVErrorScreen

- (void)pluginInitialize {
  _connectionFailedVC = [[ConnectionFailedViewController alloc] init];
}

- (void)show:(CDVInvokedUrlCommand *)command {
  [self addChildViewController:_connectionFailedVC];
  [self willMoveToParentViewController:_connectionFailedVC];

  _connectionFailedVC.view.frame = [self.view bounds];
  _connectionFailedVC.delegate = self;

  [self.view addSubview:_connectionFailedVC.view];
}

- (void)hide:(CDVInvokedUrlCommand *)command {
  [super didReceiveMemoryWarning];
}

@end
