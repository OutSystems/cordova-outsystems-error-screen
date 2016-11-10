#import "CDVErrorScreen.h"
#import "ConnectionFailedViewController.h"

#define DEFAULT_COLOR @"#C20000"

@implementation CDVErrorScreen

- (void)pluginInitialize {
    _connectionFailedVC = [[ConnectionFailedViewController alloc] init];
    backgroundColor = DEFAULT_COLOR;
}

- (void)show:(CDVInvokedUrlCommand *)command {
    [self.viewController addChildViewController:_connectionFailedVC];
    [self.viewController willMoveToParentViewController:_connectionFailedVC];

    _connectionFailedVC.view.frame = [self.viewController.view bounds];
    _connectionFailedVC.delegate = self;

    _connectionFailedVC.view.backgroundColor = [CDVErrorScreen colorFromHexString:backgroundColor];

    [self.viewController.view addSubview:_connectionFailedVC.view];
}

- (void)hide:(CDVInvokedUrlCommand *)command {
    [self.viewController removeFromParentViewController];
    [self.viewController.view removeFromSuperview];
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}

@end
