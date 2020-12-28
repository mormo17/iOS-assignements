//
//  CollectionViewController.swift
//  Contact Book
//
//  Created by Mariam on 12/23/20.
//
import UIKit
import CoreData

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, NSFetchedResultsControllerDelegate {
    lazy var contacts = [Contact]()
    
    var dbContext = DBManager.shared.persistentContainer.viewContext
    var frc: NSFetchedResultsController<Contact>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLongPress()
        fetchContacts()
    }
    
    func setUpLongPress(){
        let longPressGR = UILongPressGestureRecognizer(target: self, action: #selector(deleteContact(longPressGR:)))
        longPressGR.minimumPressDuration = 0.5
        longPressGR.delaysTouchesBegan = true
        self.collectionView.addGestureRecognizer(longPressGR)
    }
    
    func fetchContacts(){
        let request = Contact.fetchRequest() as NSFetchRequest<Contact>
        
        let predicate = NSPredicate(format: "(name CONTAINS[cd] %@) OR (name BEGINSWITH %@)", "a", "b")
        let sort = NSSortDescriptor(key: "name", ascending: true)
        
        request.predicate = predicate
        request.sortDescriptors = [sort]
        
        do {
            contacts = try dbContext.fetch(request)
            collectionView.reloadSections(IndexSet(integer: 0))
        } catch {}
    }
        
    @IBAction func add(_ sender: Any) {
        let alert = UIAlertController(title: "Add Contact", message: nil, preferredStyle: .alert)

        var nameField: UITextField?
        var numberfield: UITextField?
        alert.addTextField { textField in
            textField.placeholder = "Contact Name"
            nameField = textField
        }
        alert.addTextField { textField in
            textField.placeholder = "Contact Number"
            numberfield = textField
        }

        alert.addAction(
            UIAlertAction(
                title: "Save",
                style: .default,
                handler: { [unowned self] _ in
                    guard let nameTextField = nameField, let name = nameTextField.text, !name.isEmpty else { return }
                    guard let numberTextfield = numberfield, let number = numberTextfield.text, (!number.isEmpty || containtLetters(number: number)) else { return }
                    let person = Contact(context: dbContext)
                    person.name = name
                    person.number = number
                    do {
                        try dbContext.save()
                        fetchContacts()
                    } catch {}
                }
            )
        )
        
        alert.addAction(
            UIAlertAction(
                title: "Cancel",
                style: .cancel,
                handler: nil
            )
        )

        present(alert, animated: true, completion: nil)
    }
    
    func containtLetters(number: String) -> Bool{
        for ch in number{
            if (ch >= "a" && ch <= "z") || (ch >= "A" && ch <= "Z"){
                return false
            }
        }
        
        return true
    }
    
    @objc func deleteContact(longPressGR: UILongPressGestureRecognizer) {
        if longPressGR.state != .ended {
            return
        }
        
        let indexPath = self.collectionView.indexPathForItem(at: longPressGR.location(in: self.collectionView))
        var messageToSet = "Contact "
        if indexPath != nil {
            messageToSet += contacts[indexPath!.row].name! + " will be deleted"
        }
        
        let alert = UIAlertController(title: "Delete Contact?", message: messageToSet, preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "Delete",
                style: .destructive,
                handler: { [unowned self] _ in
                    let person = contacts[indexPath!.row]
                    dbContext.delete(person)
                    do {
                        try dbContext.save()
                        fetchContacts()
                    } catch {}
                }
            )
        )
        
        alert.addAction(
            UIAlertAction(
                title: "Cancel",
                style: .cancel,
                handler: nil
            )
        )
        if indexPath != nil {   // in case it is pressed on blank area, for example below contacts.
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomView{
            let fullName    = contacts[indexPath.row].name
            let fullNameArr = fullName!.components(separatedBy: " ")
            let initials = fullNameArr.reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
            
            let name    = fullNameArr[0]
            let numberToSet = contacts[indexPath.row].number!
            
            customCell.configure(with: initials, with: numberToSet, with: name)
            cell = customCell
        }
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
       {
        
        return CGSize(width: self.collectionView!.bounds.width/4, height: self.collectionView!.bounds.width/2.76)
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
