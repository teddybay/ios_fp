import UIKit

class PageByWebView{
    
    var url:String
    var webView:UIWebView
    
    //呼叫這個function會產生webView的畫面
    func show(){
        guard
            let pageUrl = URL(string: url)
            else { return }
        webView.loadRequest(URLRequest(url: pageUrl))
    }
    
    init(url:String ,webViewName webView: UIWebView) {
        self.webView = webView
        self.url = url
    }
}
