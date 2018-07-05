
import UIKit

class AccountDetailViewController: UIViewController {
    
    var accountDic : [String : String]!
    
    @IBOutlet weak var accName: UILabel!
    @IBOutlet weak var accMoney: UILabel!
    @IBOutlet weak var accTxv: UITextView!
    @IBOutlet weak var accImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent(accountDic["photo"]!)
        navigationItem.title = accountDic["date"]
        accImg.image = UIImage(contentsOfFile: url!.path)
        accMoney.text = "$" + accountDic["money"]!
        accName.text = accountDic["name"]
        accTxv.text = accountDic["txv"]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
