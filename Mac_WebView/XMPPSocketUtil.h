//
//  XMPPSocketUtil.h
//  Mac_WebView
//
//  Created by Gome on 2018/8/6.
//  Copyright © 2018年 Gome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface XMPPSocketUtil : NSView
/*网页视图*/
@property(nonatomic,strong)WKWebView * webView;
/*创建连接的单例*/
+(instancetype)shareXMPPSocketUtil;

@end
