#import "CDVErrorScreen.h"
#import "ConnectionFailedViewController.h"

@implementation CDVErrorScreen

- (void)pluginInitialize {
  _connectionFailedVC = [[ConnectionFailedViewController alloc] init];
}

- (void)show:(CDVInvokedUrlCommand *)command {
  [self.viewController addChildViewController:_connectionFailedVC];
  [self.viewController willMoveToParentViewController:_connectionFailedVC];

  _connectionFailedVC.view.frame = [self.viewController.view bounds];
  _connectionFailedVC.delegate = self;

  [self.viewController.view addSubview:_connectionFailedVC.view];
}

- (void)hide:(CDVInvokedUrlCommand *)command {
    [self.viewController removeFromParentViewController];
    [self.viewController.view removeFromSuperview];
}

@end
