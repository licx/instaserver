//
//  AppDelegate.h
//  Instaserver
//
//  Created by Carlo Licciardi on 10/13/12.
//  Copyright (c) 2012 Carlo Licciardi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ISHttpServer.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>{
    ISHttpServer* server;
    NSString* serverAddress;
}

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *serverAddressTextField;
@property NSTask* nodeProcess;
@end
