//
//  FilmDetailsViewController.swift
//  api_practice_project
//
//  Created by Andrey Vanakoff on 09/02/2022.
//

import UIKit

class FilmDetailsViewController: UIViewController {
    
    var films: [TarantinoFilm] = []
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var filmImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var actorsLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    private func fetchImage() {
        guard let url = URL(string: Link.pulpFictionImage.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.filmImageView.image = image
                self.activityIndicator.stopAnimating()
            }
        } .resume()
    }
    
//    private func fetchImage() {
//        NetworkManager.shaerd.fetchImage(from: Link.pulpFictionImage.rawValue) { result in
//            switch result {
//            case .success(let data):
//                self.filmImageView.image = UIImage(data: data)
//                self.activityIndicator.stopAnimating()
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }

    /*
     
     private func fetchImage() {
         NetworkManager.shared.fetchImage(from: Link.imageURL.rawValue) { result in
             switch result {
             case .success(let data):
                 self.imageView.image = UIImage(data: data)
                 self.activityIndicator.stopAnimating()
             case .failure(let error):
                 print(error.localizedDescription)
             }
         }
     }
     
    func fetchCoursesV2() {
        NetworkManager.shared.fetch(dataType: [CourseV2].self,
                                    from: Link.exampleFive.rawValue,
                                    convertFromSnakeCase: false) { result in
            switch result {
            case .success(let courses):
                self.coursesV2 = courses
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
     */

}
