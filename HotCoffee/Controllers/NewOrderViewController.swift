//
//  NewOrderViewController.swift
//  HotCoffee
//
//  Created by Riad Mohamed on 10/20/20.
//

import UIKit

class NewOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    var newOrderVM = AddNewOrderViewModel()
    
    private var coffeeSizesSegmentedControl: UISegmentedControl!
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newOrderVM.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.newOrderTableViewCell, for: indexPath)
        cell.textLabel?.text = self.newOrderVM.types[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        self.coffeeSizesSegmentedControl = UISegmentedControl(items: newOrderVM.sizes)
        self.coffeeSizesSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.coffeeSizesSegmentedControl)
        
        self.coffeeSizesSegmentedControl.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 20).isActive = true
        
        self.coffeeSizesSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    @IBAction func saveButtonTapped() {
        
        guard let selectedCoffeeType = tableView.cellForRow(at: tableView.indexPathForSelectedRow!)?.textLabel?.text else {
            fatalError("Error getting the selected coffee type")
//            return
        }
        
        let selectedCoffeeSize = self.coffeeSizesSegmentedControl.titleForSegment(at: self.coffeeSizesSegmentedControl.selectedSegmentIndex)
        
        let name = self.nameTextField.text
        let email = self.emailTextField.text
        
        self.newOrderVM.name = name
        self.newOrderVM.email = email
        self.newOrderVM.type = selectedCoffeeType
        self.newOrderVM.size = selectedCoffeeSize
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
