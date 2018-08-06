//
//  XMPPSocketUtil.m
//  Mac_WebView
//
//  Created by Gome on 2018/8/6.
//  Copyright © 2018年 Gome. All rights reserved.
//

#import "XMPPSocketUtil.h"
#import "AppDelegate.h"

@interface XMPPSocketUtil()<WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler>

@end

@implementation XMPPSocketUtil

/*创建连接的单例*/
+(instancetype)shareXMPPSocketUtil{
    static XMPPSocketUtil * xmppUtil = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        xmppUtil = [XMPPSocketUtil new];
    });
    
    return xmppUtil;
}

-(instancetype)init{
    if (self=[super init]) {
        [self loadWebView];
    }
    return self;
}

#pragma mark 加载网页视图
-(void)loadWebView{
    
    NSRect windowFrame = [NSApplication sharedApplication].keyWindow.frame;
    WKWebViewConfiguration * configuration =[[WKWebViewConfiguration alloc]init];
    //交互
    WKUserContentController* userContentController =[[WKUserContentController alloc]init];
    configuration.userContentController = userContentController;
    [userContentController addScriptMessageHandler:self name:@"test"];
    
    _webView = [[WKWebView alloc]initWithFrame:NSMakeRect(0, 0, windowFrame.size.width, windowFrame.size.height) configuration:configuration];
    NSString * filePath = [[[NSBundle mainBundle]resourcePath] stringByAppendingPathComponent:@"demo.html"];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
}
#pragma mark - WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    
}
// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    
}
// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    
    NSLog(@"%@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}

// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    NSLog(@"%@",navigationAction.request.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationActionPolicyCancel);
}
#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSLog(@"name:%@\\\\n body:%@\\\\n frameInfo:%@\\\\n",message.name,message.body,message.frameInfo);
    
}


@end
