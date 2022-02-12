//
//  SecondVC.swift
//  TestProj
//
//  Created by Piyush Agrawal on 12/02/22.
//

import Foundation
import UIKit

enum Myerror : Error {
    case InvalidURL
    case failed
}

class SecondVC : UIViewController {
    
    @IBOutlet weak var table : UITableView!
    
    var api_number : Int = 1
    
    var arr_users = [UserModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        repeat {
            self.api_number -= 1
            DispatchQueue.global().async {
                
                self.callAPi { result in
                    switch result {
                    case .success(let user):
                        DispatchQueue.main.async {[weak self] in
                            self?.arr_users.append(user)
                            self?.table.reloadData()
                        }
                        
                    case .failure(let err):
                        debugPrint(err.localizedDescription)
                    }
                }
            }
        }
        while (api_number > 0)
    }
    
    
    
    func callAPi(completion: @escaping (Result<UserModel,Error>)-> Void) {
        guard let url = URL(string: "https://mocki.io/v1/26106195-43ea-4f58-a0b7-e4724c176e61") else {
            completion(.failure(Myerror.InvalidURL))
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error == nil {
                guard let data = data else {
                    completion(.failure(Myerror.failed))
                    return
                }
                
                do {
                    let user = try JSONDecoder().decode(UserModel.self, from: data)
                    completion(.success(user))
                } catch  {
                    completion(.failure(error))
                }
                

            }
        }.resume()
    }
}

extension SecondVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arr_users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! cellTableViewCell
        cell.lbl_num.text = "\(indexPath.row + 1)"
        cell.setupCell(user: arr_users[indexPath.row])
        
        return cell
    }
    
    
    
}
