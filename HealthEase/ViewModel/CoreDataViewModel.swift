//
//  CoreDataViewModel.swift
//  HealthEase
//
//  Created by Pratik Chougule on 16/08/23.
//

import Foundation
import CoreData

class CoreDataViewModel: ObservableObject {
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "HealthEase")
        container.loadPersistentStores(completionHandler: { (description, error) in
            if let error = error {
                print("Error in loading core data \(error)")
            }
        })
    }
    
    func addUser(email: String, password: String) {
        let newUser = UserEntity(context: container.viewContext)
        newUser.email = email
        newUser.password = password
        do {
            try container.viewContext.save()
            print("User Added Successfully.")
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func fetchUser(email: String) -> UserEntity? {
        let request: NSFetchRequest<UserEntity> = UserEntity.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        let requestPredicate = NSPredicate(format: "email MATCHES %@", email)
        request.predicate = requestPredicate
        
        do {
            let record = try container.viewContext.fetch(request)
            if(record.isEmpty) {
                return nil
            } else {
                return record[0]
            }
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func addToAppointment(id: String, date: String, time: String, doctorName: String, doctorSpeciality: String, user: UserEntity) -> Bool {
        let newAppointment = Appointment(context: container.viewContext)
        newAppointment.date =  date
        newAppointment.time = time
        newAppointment.doctorName = doctorName
        newAppointment.speciality = doctorSpeciality
        newAppointment.id = id
        newAppointment.toUser = user
        
        do {
            try container.viewContext.save()
            return true
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        return false
    }
    
    func removeFromAppointment(id: String, date: String, time: String, doctorName: String, email: String) -> Bool {
        let request: NSFetchRequest<Appointment> = Appointment.fetchRequest()
        request.returnsObjectsAsFaults = false
        let requestPredicate = NSPredicate(format: "id MATCHES %@ and date MATCHES %@ and time MATCHES %@ and doctorName MATCHES %@ and toUser.email MATCHES %@", id,
        date, time, doctorName, email
        )
        request.predicate = requestPredicate
        
        do {
            let records = try container.viewContext.fetch(request)
            for r in records {
                container.viewContext.delete(r)
            }
            do {
                try container.viewContext.save()
                return true
            }
            catch let error as NSError {
                print("Error while deleteing appointment: \(error.localizedDescription)")
            }
        }
        catch let error as NSError {
            print("Error while deleteing appointment: \(error.localizedDescription)")
        }
        return false
    }
    
    func checkIfAppointmentBooked(id: String, date: String, time: String, doctorName: String, email: String) -> Bool {
        let request: NSFetchRequest<Appointment> = Appointment.fetchRequest()
        request.returnsObjectsAsFaults = false
        let requestPredicate = NSPredicate(format: "id MATCHES %@ and date MATCHES %@ and time MATCHES %@ and doctorName MATCHES %@ and toUser.email MATCHES %@", id,
        date, time, doctorName, email
        )
        request.predicate = requestPredicate
        
        do {
            let records = try container.viewContext.fetch(request)
            if records.count == 1 {
                return true
            }
        }
        catch let error as NSError {
            print("Error while deleteing appointment: \(error.localizedDescription)")
        }
        return false
    }
    
    func addToFavourites(id: String, user: UserEntity) -> Bool {
        let newFavourite = Favourite(context: container.viewContext)
        newFavourite.id = id
        newFavourite.toUser = user
        do {
            try container.viewContext.save()
            return true
        }
        catch let error as NSError {
            print("Error while adding data to favourites: \(error.localizedDescription)")
        }
        return false
    }
    
    func deleteFromFavorites(id: String, email: String) -> Bool{
        let request: NSFetchRequest<Favourite> = Favourite.fetchRequest()
        request.returnsObjectsAsFaults = false
        let requestPredicate = NSPredicate(format: "id MATCHES %@ and toUser.email MATCHES %@", id, email)
        request.predicate = requestPredicate
        
        do {
            let records = try container.viewContext.fetch(request)
            for r in records {
                container.viewContext.delete(r)
            }
            do {
                try container.viewContext.save()
                return true
            }
            catch let error as NSError {
                print("Error while deleteing Favourites: \(error.localizedDescription)")
            }
        }
        catch let error as NSError {
            print("Error while deleteing Favourites: \(error.localizedDescription)")
        }
        return false
    }
    
    
}
