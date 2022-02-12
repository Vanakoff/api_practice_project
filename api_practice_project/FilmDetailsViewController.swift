//
//  FilmDetailsViewController.swift
//  api_practice_project
//
//  Created by Andrey Vanakoff on 09/02/2022.
//

import UIKit

class FilmDetailsViewController: UIViewController {
    
    var films: [Film] = []
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var filmImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var actorsLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        fetchImage()
        fetchData()
    }
    
    private func fetchImage() {
        guard let url = URL(string: Link.pulpFictionImage.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            print(response)
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.filmImageView.image = image
                self.activityIndicator.stopAnimating()
            }
        } .resume()
    }
    
    private func fetchData() {
        guard let url = URL(string: Link.pulpFiction.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "no error description")
                return
            }
            print(response)
            do {
                let film = try JSONDecoder().decode(Film.self, from: data)
                print(film)
                DispatchQueue.main.async {
                    self.descriptionLabel.text = film.Plot
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } .resume()
    }
    


}
