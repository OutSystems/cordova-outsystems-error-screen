#import <Cordova/CDVPlugin.h>
#import "ConnectionFailedViewController.h"

@interface CDVErrorScreen : CDVPlugin<ConnectionFailedScreenDelegate> {
  ConnectionFailedViewController* _connectionFailedVC;
}

- (void)show:(CDVInvokedUrlCommand*)command;
- (void)hide:(CDVInvokedUrlCommand*)command;

@end
