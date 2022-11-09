//
//  ViewController.swift
//  NetworkingIntro
//
//  Created by Consultant on 11/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    var tableView: UITableView?
    

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.createUserInt()
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
        self.createUserInt()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUserInt()
        
    }
        
    let network = NetworkManager()
    


    
    
    private func createUserInt() {

        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.dataSource = self
        table.register(ProgTableViewCell.self, forCellReuseIdentifier: "ProgCell")
        
        self.view.addSubview(table)
        table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        table.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        table.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        table.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.tableView = table

    }


}
    

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProgCell", for: indexPath) as? ProgTableViewCell else {
            fatalError("Something is wrong")
        }
        //let progTableViewCell = ProgTableViewCell()
        //let frame = progTableViewCell.stockImageView.frame
        //cell.stockImageView.image = progTableViewCell.stockImageView.image

        let frame = cell.stockImageView.frame
        self.network.fetchImageData(path: "https://picsum.photos/\(Int(frame.width))/\(Int(frame.height))") {[weak self] data in
            guard let data = data else {return}
            print(data)
            DispatchQueue.main.async {
                cell.stockImageView.image = UIImage(data: data )
                guard let intID = self?.network.tempID as? String else {return}
                
                    cell.stockImageID.text = "ID: \(intID)"
            }

        }
        
        
        return cell
        
    }
}
