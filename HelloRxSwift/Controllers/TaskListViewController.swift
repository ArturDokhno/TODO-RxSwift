//
//  TaskListViewController.swift
//  HelloRxSwift
//
//  Created by Артур Дохно on 08.06.2022.
//

import UIKit
import RxSwift
import RxRelay

class TaskListViewController: UIViewController {
    
    @IBOutlet var segmentControl: UISegmentedControl!
    @IBOutlet var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    private var tasks = BehaviorRelay<[Task]>(value: [])
    private var filteredTasks = [Task]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "TaskTableViewCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "TaskTableViewCell")
        tableView.dataSource = self
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navVC = segue.destination as? UINavigationController,
              let addTVC = navVC.viewControllers.first as? TaskListViewController else {
                  return
              }
        
        addTVC
    }
    
    @IBAction func segmentControlDidChange(_ sender: UISegmentedControl) {
        
    }
}

extension TaskListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell",
                                                 for: indexPath) as! TaskTableViewCell
        
        cell.textLabel?.text = filteredTasks[indexPath.row].title
        
        return cell
    }
}
