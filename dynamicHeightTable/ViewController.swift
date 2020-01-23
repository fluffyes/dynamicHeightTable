//
//  ViewController.swift
//  dynamicHeightTable
//
//  Created by Soulchild on 08/04/2019.
//  Copyright © 2019 fluffy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let quoteCellReuseIdentifier = "quoteCellReuseIdentifier"
    
    let quotes = [
        "I always was a crybaby, wasn’t I",
        "Do not worry about me. Someone has to take care of these flowers.",
        "They were the one that wanted to... ...to use our full power. I was the one that resisted. And then, because of me, we... Well, that's why I ended up a flower",
        "But I can feel every other monster's as well. They all care about each other so much. And... they care about you too, Frisk. I wish I could tell you how everyone feels about you.",
        
        "As a flower, I was soulless. I lacked the power to love other people. However, with everyone's souls inside me... I not only have my own compassion back... But I can feel every other monster's as well."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.register(UINib(nibName: String(describing: QuoteTableViewCell.self), bundle: nil), forCellReuseIdentifier: quoteCellReuseIdentifier)
        self.tableView.rowHeight  = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 80
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: quoteCellReuseIdentifier, for: indexPath) as! QuoteTableViewCell
        cell.authorLabel.text = "Asriel"
        cell.quoteLabel.text = quotes[indexPath.row]
        
        return cell
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
