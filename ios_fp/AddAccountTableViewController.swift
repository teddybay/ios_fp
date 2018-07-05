
import UIKit

class AddAccountTableViewController: UITableViewController , UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var accDate: UITextField!
    @IBOutlet weak var accName: UITextField!
    @IBOutlet weak var accMoney: UITextField!
    @IBOutlet weak var accImg: UIImageView!
    @IBOutlet weak var accTxv: UITextView!
    
    //@IBOutlet weak var conceptTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(AddAccountTableViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func done(_ sender: Any) {
        if accName.text?.characters.count == 0
        {
            let controller = UIAlertController(title: "小提醒", message: "請輸入商品名稱", preferredStyle: .alert)
            let action = UIAlertAction(title: "確定", style: .default, handler: { (action) in
                
            })
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
            return
        }
        else if accMoney.text?.characters.count == 0
        {
            let controller = UIAlertController(title: "小提醒", message: "請輸入金額", preferredStyle: .alert)
            let action = UIAlertAction(title: "確定", style: .default, handler: { (action) in
                
            })
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
            return
        }
        else if accDate.text?.characters.count == 0
        {
            let controller = UIAlertController(title: "小提醒", message: "請輸入日期", preferredStyle: .alert)
            let action = UIAlertAction(title: "確定", style: .default, handler: { (action) in
                
            })
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
            return
        }
        else if accImg.image == nil
        {
            let controller = UIAlertController(title: "小提醒", message: "請選擇圖片", preferredStyle: .alert)
            let action = UIAlertAction(title: "確定", style: .default, handler: { (action) in
                
            })
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
            return
        }
        let interval = Date().timeIntervalSinceReferenceDate
        
        let data = UIImageJPEGRepresentation(accImg.image!, 0.8)
        let fileManager = FileManager.default
        let docUrls =
            fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("\(interval)")
        
        try? data?.write(to: url!)
        
        let paid = ["name":accName.text!, "money":accMoney.text!, "date":accDate.text!, "photo":"\(interval)", "txv":accTxv.text!]
        let notiName = Notification.Name("AddaccList")
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: paid)
        navigationController?.popViewController(animated: true)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        print(info)
        accImg.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func selectPhoto(_ sender: Any) {
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        present(controller, animated: true, completion: nil)
        //navigationController?.pushViewController(controller, animated: true)
    }
    
    var datePicker : UIDatePicker!
    
    @IBAction func DateTextFieldEdit(_ sender: UITextField) {
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.datePickerMode = UIDatePickerMode.date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        accDate.inputView = self.datePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
        
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        accDate.inputAccessoryView = toolBar

    }
    
    @objc func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        dateFormatter1.dateFormat = "yyyy/MM/dd"
        accDate.text = dateFormatter1.string(for: datePicker.date)
        accDate.resignFirstResponder()
    }
    @objc func cancelClick() {
        accDate.resignFirstResponder()
    }
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "MMMM dd yyyy"
        accDate.text = dateFormatter.string(from: sender.date)
        
    }
    
    
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return true
        
    }

    // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
