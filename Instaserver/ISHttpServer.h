//
//  Server.h
//  Instaserver
//
//  Created by Carlo Licciardi on 10/13/12.
//  Copyright (c) 2012 Carlo Licciardi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/NSPort.h>
#import <Cocoa/Cocoa.h>
#import "GCDAsyncSocket.h"
#import "HTTPServer.h"

@interface ISHttpServer : NSObject
{
    NSInteger currentPort;
    NSString* webroot;
    GCDAsyncSocket* portTestSocket;
    dispatch_queue_t socketQueue;
    HTTPServer *httpServer;


}
@property NSString* webRoot;

- (void) run;
- (void) stop;
- (NSString*) getListeningAddress;

- (int)getFreePortAvailable;
- (NSString*) getNodeBinaryPath;
- (NSString*) getNodeServerScriptPath;

@end
