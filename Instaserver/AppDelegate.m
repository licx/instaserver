//
//  AppDelegate.m
//  Instaserver
//
//  Created by Carlo Licciardi on 10/13/12.
//  Copyright (c) 2012 Carlo Licciardi. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize serverAddressTextField;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSString *appPath =[[[NSBundle mainBundle] bundlePath] stringByDeletingLastPathComponent];
    
    server = [[ISHttpServer alloc] init];
    server.webRoot= appPath;
    [server run];

    
    serverAddress= [server getListeningAddress];
    
    serverAddressTextField.stringValue = serverAddress;
    
    [self performSelector:@selector(openBrowser) withObject:self afterDelay:1.0 ];
}

- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender{
    [server stop];
    return NSTerminateNow;
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}

- (void) openBrowser{
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:serverAddress]];
}




@end
