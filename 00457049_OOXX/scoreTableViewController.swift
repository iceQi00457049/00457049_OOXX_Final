import UIKit

class scoreTableViewController: UITableViewController {
    var dailys=[Score]()
    



    @IBOutlet var selectTableView: UITableView!

    @IBAction func unwind(segue: UIStoryboardSegue) {
        if let controller = segue.source as? scoreViewController, let daily = controller.date{
            
            dailys.insert(daily, at: 0)
            Score.saveToFile(dailys: dailys)
            let indexPath = IndexPath(row: 0, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let dailys = Score.readDailysFromFile() {
            self.dailys = dailys
        }
      
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    
        return dailys.count
        
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        dailys.remove(at: indexPath.row)
        Score.saveToFile(dailys: dailys)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! scoreTableViewCell

        // Configure the cell...
        let daily = dailys[indexPath.row]
        cell.dailyDetail.text = daily.date
        cell.dailyTitle.text=daily.score
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

       
        if segue.destination is postViewController{
            let controller = segue.destination as! postViewController
            
            let indexPath = self.selectTableView.indexPathForSelectedRow
            let Select = dailys[indexPath!.row]
            controller.select = Select
        }
        

        
    }
   
}
