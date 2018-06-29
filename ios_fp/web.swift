
import UIKit

class web: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //使用 PageByWebView
        let webPage = PageByWebView(url: "https://www.youtube.com/", webViewName: webView)
        webPage.show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
