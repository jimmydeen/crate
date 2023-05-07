//
//  AlbumDetailsViewController.swift
//  Crate
//
//  Created by JD Chiang on 4/5/2023.
//

import UIKit


class AlbumDetailsViewController: UITableViewController, AlbumDetailsDelegate {
    
    var indicator = UIActivityIndicatorView()
    var imageDownloading: Bool = false
    var currentAlbum: AlbumData?
    var url: String?
    
    @IBOutlet weak var albumCover: UIImageView!
    
    @IBOutlet weak var albumTitle: UILabel!
    
    @IBOutlet weak var artistName: UILabel!
    
    @IBOutlet weak var releaseDate: UILabel!
    
    @IBOutlet weak var upc: UILabel!
    
    @IBOutlet weak var ean: UILabel!
    
    @IBOutlet weak var albumType: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//        guard let album = currentAlbum else {
//            return
//        }
        
        guard let url else {
            return
        }
        
//        guard let image
        
//        self.setAlbumDetails(album: album)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    func fetchAlbumFromURL(url: String) async{
        do {
            let authenticator = Authenticator()
            let accessToken = try await authenticator.authenticate()
            
//            var urlRequest = URLRequest(url: href)
//            urlRequest.httpMethod = "GET"
//
//            urlRequest.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
            
            
//            var url = URL(string: href)
            guard let url = URL(string: url) else {
                print("error, invalid url")
                throw HrefError.MissingURL
            }
            
            let (data, response) =
                try await URLSession.shared.data(from: url)
            print("data:",String(describing: data), "response:", response)
//
//            let jsonData = data.data(using: String.Encoding.utf8)
//
//            if JSONSerialization.isValidJSONObject(jsonData) {
//                print("Valid Json")
//            } else {
//                print("InValid Json")
//            }
            DispatchQueue.main.async {
                self.indicator.stopAnimating()
            }
            let decoder = JSONDecoder()
            
            
            let albumData = try decoder.decode(AlbumData.self, from: data)
            
            self.currentAlbum = albumData
            
        }
        catch let error {
            print(error)
        }
    }
//    func setAlbumDetails(album: AlbumData) {
//        guard let url else {
//            return
//        }
//        fetchAlbumFromURL(url: url)
//        guard let artists = album.artistNames else {
//            return
//        }
//
//        albumTitle.text = album.title
//        artistName.text = artists
//        releaseDate.text = album.releaseDate
//        albumType.text = album.albumType
//    }
    
    func sendAlbumDetails(albumURL: String) {
        url = albumURL
    }

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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
