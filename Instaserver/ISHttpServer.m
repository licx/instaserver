//
//  Server.m
//  Instaserver
//
//  Created by Carlo Licciardi on 10/13/12.
//  Copyright (c) 2012 Carlo Licciardi. All rights reserved.
//

#import "ISHttpServer.h"


@implementation ISHttpServer
@synthesize webRoot;


-(id) init{
    self =  [super init];
    //Creating the HTTPServer object
    httpServer = [[HTTPServer alloc] init];
    
    //Creating the socket used to test available ports
    socketQueue = dispatch_queue_create("socketQueue", NULL);
    
    portTestSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:socketQueue];
    
    return self;
}

#pragma mark "Public methods"

//Starts the server
-(void) run{
    
    //Looking for an available port
    currentPort =[self getFreePortAvailable];
    //Set the port
    [httpServer setPort:currentPort];
    //Sets document root
    [httpServer setDocumentRoot:webRoot];
    NSError *error = nil;
	if(![httpServer start:&error])
	{
        NSLog(@"Error starting HTTP Server: %@", error);
    }
    
       
}
//Stops the server
-(void) stop{
    [httpServer stop];
}

- (NSString*) getListeningAddress{
    return [NSString stringWithFormat:@"http://localhost:%ld", currentPort];
}







#pragma mark "Private methods"

- (int)getFreePortAvailable{
    NSError *error = nil;
    int i;
    for(i=2012;i<65535;i++){
        if(![portTestSocket acceptOnPort:i error:&error])
        {
            NSLog(@"Error starting server, port %d in use",i);
        }else{
            break;
        }
    }
    [portTestSocket disconnect];

    
    return i;
}

- (NSString*) getNodeBinaryPath{
    NSString *execPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"node"];
    return execPath;
}

- (NSString*) getNodeServerScriptPath{
    NSString *scriptPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/nodeApp.js"];
    return scriptPath;
}


@end
