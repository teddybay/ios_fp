
import UIKit

class DiaryDetailViewController: UIViewController {
    
    var diaryDic : [String : String]!
    
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var conceptTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent(diaryDic["photo"]!)
        navigationItem.title = diaryDic["date"]
        Image.image = UIImage(contentsOfFile: url!.path)
        conceptTextView.text = diaryDic["concept"]
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
