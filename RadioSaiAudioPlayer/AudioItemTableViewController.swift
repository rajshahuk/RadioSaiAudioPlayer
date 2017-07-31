//
//  AudioItemTableViewController.swift
//  RadioSaiAudioPlayer
//
//  Created by Rajesh Shah on 29/07/2017.
//  Copyright © 2017 Rajesh Shah. All rights reserved.
//

import UIKit

class AudioItemTableViewController: UITableViewController {
    
    //MARK: Properties
    var audioItems = [AudioItem]()
    
    let AUDIO_ITEMS_URL = "https://radio-sai-api.appspot.com/api/audioItems"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAudioItemsFromApi() {(value) in
            print("Return value: \(value)")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
            // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return audioItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AudioItemTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? AudioItemTableViewCell  else {
            fatalError("The dequeued cell is not an instance of AudioItemTableViewCell.")
        }
        let audioItem = audioItems[indexPath.row]
        print("AudioItem: \(audioItem)")
        cell.dateLabel.text = audioItem.date
        cell.titleLabel.text = audioItem.title
        return cell
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // Get the new view controller using segue.destinationViewController.
        switch (segue.identifier ?? "") {
        case "ShowItem":
            guard let audioItemViewController = segue.destination as? AudioItemViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedAudioItemCell = sender as? AudioItemTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            guard let indexPath = tableView.indexPath(for: selectedAudioItemCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            let selectedAudioItem = audioItems[indexPath.row]
            audioItemViewController.audioItem = selectedAudioItem
        default:
            print(segue.identifier as Any)
        }
        // Pass the selected object to the new view controller.
    }
    
    
    //MARK: Private Methods
    
    private func getAudioItemsFromApi(completion: @escaping (Int) -> ()) {
        let url = URL(string: AUDIO_ITEMS_URL)
        URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            print("Data:  \(data)")
            let json:NSArray = try! JSONSerialization.jsonObject(with: data, options: []) as! NSArray
            for item in json {
                let dictResult = item as! NSDictionary
                let a = AudioItem.init(id: (dictResult.value(forKey: "id") as! Int),
                                       date: (dictResult.value(forKey: "dateString") as! String),
                                       title: (dictResult.value(forKey: "title") as! String),
                                       url: (dictResult.value(forKey: "url") as! String))
                self.audioItems.append(a)
            }
            completion(self.audioItems.count)
            print("Count: \(json.count)" )
        }).resume()
    }
}
