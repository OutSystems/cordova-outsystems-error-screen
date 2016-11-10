#import <Cordova/CDVPlugin.h>
#import "ConnectionFailedViewController.h"

@interface CDVErrorScreen : CDVPlugin {
  ConnectionFailedViewController* connectionFailedVC;
}

- (void)show:(CDVInvokedUrlCommand*)command;
- (void)hide:(CDVInvokedUrlCommand*)command;

@end
