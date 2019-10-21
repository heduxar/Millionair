//
//  ResultsController.swift
//  Millionair
//
//  Created by Юрий Султанов on 20.10.2019.
//  Copyright © 2019 Юрий Султанов. All rights reserved.
//

import UIKit

class ResultsController: UIViewController {
    
    @IBAction func back(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
extension ResultsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as? RecordCell else { preconditionFailure("RecordCell Error!") }
        let record = Game.shared.records[indexPath.row]
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        cell.date.text = "Дата:\n"+dateFormatter.string(from: record.date)
        cell.score.text = "Верных ответов:\n \(record.score)"
//        let percent = record.score*100/record.totalQuestions
        cell.percent.text = "Угадано:\n \(record.percent) %"
        return cell
    }
}
