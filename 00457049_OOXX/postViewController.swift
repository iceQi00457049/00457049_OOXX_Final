import UIKit

class postViewController: UIViewController {
    var select:Score?
    @IBOutlet var label1: UILabel!
    

    @IBOutlet var text2: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        label1.text=select?.score
        text2.text=select?.name
    
    }
    


}
