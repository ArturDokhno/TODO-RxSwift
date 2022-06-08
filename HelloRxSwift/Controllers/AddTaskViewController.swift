//
//  AddTaskViewController.swift
//  HelloRxSwift
//
//  Created by Артур Дохно on 08.06.2022.
//

import UIKit
import RxSwift

class AddTaskViewController: UIViewController {
    
    @IBOutlet var prioritySegmentControl: UISegmentedControl!
    @IBOutlet var taskTextField: UITextField!
    
    private let taskSubject = PublishSubject<Task>()
    
    var taskSubjectObservable: Observable<Task> {
        return taskSubject.asObserver()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveDidTap(_ sender: UIBarButtonItem) {
        guard let priority = Priority(rawValue: prioritySegmentControl.selectedSegmentIndex),
              let title = taskTextField.text else {
            return
        }
        
        let task = Task(title: title, priority: priority)
        taskSubject.onNext(task)
        dismiss(animated: true)
    }
}
