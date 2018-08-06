//
//  AppDelegate.m
//  Mac_WebView
//
//  Created by Gome on 2018/8/6.
//  Copyright © 2018年 Gome. All rights reserved.
//

#import "AppDelegate.h"
#import "XMPPSocketUtil.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self.window.contentView addSubview:[XMPPSocketUtil shareXMPPSocketUtil].webView];

}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
