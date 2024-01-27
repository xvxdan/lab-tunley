//
//  ViewController.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/1/22.
//

import UIKit

struct Track {
    let trackName: String
    let artistName: String
    let artworkUrl100: URL
    let collectionName: String
    let primaryGenreName: String
    let releaseDate: Date
    let trackTimeMillis: Int
}

class TracksViewController: UIViewController, UITableViewDataSource {

    // TODO: Pt 1 - Add a tracks property
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {

            // Deselect the row at the corresponding index path
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    var tracks: [Track] = []
    

    // TODO: Pt 1 - Add table view outlet
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self

        // TODO: Pt 1 - Set tracks property with mock tracks array
        tracks = Track.mockTracks
        print(tracks)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a cell with identifier, "TrackCell"
        // the `dequeueReusableCell(withIdentifier:)` method just returns a generic UITableViewCell so it's necessary to cast it to our specific custom cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as! TrackCell

        // Get the track that corresponds to the table view row
        let track = tracks[indexPath.row]

        // Configure the cell with it's associated track
        cell.configure(with: track)

        // return the cell for display in the table view
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Pt 1 - Pass the selected track to the detail view controller
        // Get the cell that triggered the segue
        if let cell = sender as? UITableViewCell,
           // Get the index path of the cell from the table view
           let indexPath = tableView.indexPath(for: cell),
           // Get the detail view controller
           let detailViewController = segue.destination as? DetailViewController {

            // Use the index path to get the associated track
            let track = tracks[indexPath.row]

            // Set the track on the detail view controller
            detailViewController.track = track
        }


    }

    // TODO: Pt 1 - Add table view data source methods

    @IBOutlet weak var tableView: UITableView!

}

extension Track {

    /// An array of mock tracks
    static var mockTracks: [Track]  = [
        Track(trackName: "Ice Cream",
              artistName: "BLACKPINK & Selena Gomez",
              artworkUrl100: URL(string:"https://is5-ssl.mzstatic.com/image/thumb/Music125/v4/c3/64/46/c364465f-6271-8aae-93a8-b9979d2befe5/20UMGIM82075.rgb.jpg/100x100bb.jpg")!,
             collectionName: "The Album",
             primaryGenreName: "K-Pop",
              releaseDate: Date(),
              trackTimeMillis: 157705),
        Track(trackName: "Sour Candy",
              artistName: "Lady Gaga & BLACKPINK",
              artworkUrl100: URL(string: "https://is5-ssl.mzstatic.com/image/thumb/Music115/v4/5d/4d/f9/5d4df96a-e95e-2fe9-404a-5d570513762d/20UMGIM15390.rgb.jpg/100x100bb.jpg")!,
              collectionName: "The Album",
              primaryGenreName: "K-Pop",
               releaseDate: Date(),
               trackTimeMillis: 157705),
        Track(trackName: "WHISTLE",
              artistName: "BLACKPINK",
              artworkUrl100: URL(string: "https://is2-ssl.mzstatic.com/image/thumb/Music125/v4/89/eb/82/89eb82a7-52ec-9e02-87e9-fcc0ac7e0377/BLACKPINK_SQUARE2-1.jpg/100x100bb.jpg")!,
              collectionName: "The Album",
              primaryGenreName: "K-Pop",
               releaseDate: Date(),
               trackTimeMillis: 157705)
    ]

    // We can now access this array of mock tracks anywhere like this:
    // let tracks = Tracks.mockTracks
}
