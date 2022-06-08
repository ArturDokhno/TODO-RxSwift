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
              let addTVC = navVC.viewControllers.first as? AddTaskViewController else {
                  return
              }

        addTVC.taskSubjectObservable.subscribe { [weak self] task in
            guard let self = self else { return }
            let priority = Priority(rawValue: self.segmentControl.selectedSegmentIndex - 1)
            
            var existingTask = self.tasks.value
            existingTask.append(task.element!)
            self.tasks.accept(existingTask)
            
            self.filterTasks(by: priority)
        }
    }
    
    @IBAction func segmentControlDidChange(_ sender: UISegmentedControl) {
        let priority = Priority(rawValue: self.segmentControl.selectedSegmentIndex - 1)
        filterTasks(by: priority)
    }
    
    func filterTasks(by priority: Priority?) {
        if priority == nil {
            filteredTasks = tasks.value
            tableView.reloadData()
        } else {
            self.tasks.map { tasks in
                return tasks.filter { $0.priority == priority }
            }.subscribe { [weak self] taskEvent in
                self?.filteredTasks = taskEvent.element ?? []
                self?.tableView.reloadData()
            }.disposed(by: disposeBag)
        }
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
