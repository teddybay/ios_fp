
import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var accDate: UILabel!
    @IBOutlet weak var accMoney: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
