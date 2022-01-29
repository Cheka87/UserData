
import Foundation
import RealmSwift


class Human: Object{
    @objc dynamic var name = ""
    let dogs = List<Dog>()
}


class Dog: Object {
   @objc dynamic var name = ""
   @objc dynamic var age = 0
   @objc dynamic var owner: Human?
}

class Persistance{
    static let shared = Persistance()
    
//    private let kUserNameKey = "Persistance.kUserNameKey"
//
//    var userName: String? {
//        set {UserDefaults.standard.set(newValue, forKey: kUserNameKey)}
//        get { return UserDefaults.standard.string(forKey: kUserNameKey)   }
//    }
    
    private let realm = try! Realm()
    
    func test(){

        
        let allDogs = realm.objects(Dog.self).first!
        try! realm.write{
            realm.delete(allDogs)
            }

        for dog in realm.objects(Dog.self){
            print("-- \(dog.name) : \(dog.age)")
        }
    }   
   
}
