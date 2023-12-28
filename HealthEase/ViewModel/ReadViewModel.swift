//
//  ReadViewModel.swift
//  HealthEase
//
//  Created by Pratik Chougule on 08/08/23.
//

import Foundation
import Firebase
import FirebaseDatabaseSwift
import SwiftUI
import Kingfisher

class ReadViewModel: ObservableObject {
    var ref = Database.database().reference()
    @Published var value: String? = nil
    @Published var object = [Category]()
    @Published var doctorCover = [DoctorCover]()
    @Published var doctors = [Doctor]()
    @Published var favDoctors: [Favourite]? = nil
    @Published var images = [KFCrossPlatformImage]()
    @AppStorage("cacheStored") var isCacheStored: Bool = false
    
    func getCategoryData() {
        self.ref.child("Categories").queryOrderedByKey().observe(.value) { snapshot in
            self.object.removeAll()
            if let snapShot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapShot {
                    if let mainDict = snap.value as? [String: String] {
                        let id = mainDict["id"]
                        let categoryName = mainDict["categoryName"]
                        let image = mainDict["image"]
                        self.object.append(Category(id: id!, categoryName: categoryName!, image: image!))
                    }
                }
            }
            else {
                print("error occured")
            }
         }
    }
    
    func getCoverData() {
        self.ref.child("DoctorCover").queryOrderedByKey().observe(.value) { snapshot in
            self.doctorCover.removeAll()
            if let snapShot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapShot {
                    if let mainDict = snap.value as? [String: String] {
                        let id = mainDict["id"]
                        let name = mainDict["name"]
                        let speciality = mainDict["speciality"]
                        let clinicName = mainDict["clinicName"]
                        let image = mainDict["image"]
                        self.doctorCover.append(DoctorCover(id: id!, name: name!, speciality: speciality!, clinicName: clinicName!, image: image!))
                    }
                }
            }
            else {
                print("error occured")
            }
         }
    }
    
    
    func getDoctorsData() {
        self.ref.child("Doctor").queryOrderedByKey().observe(.value) { (snapshot) in
            self.doctors.removeAll()
            if let snapShot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapShot {
                    if let mainDict = snap.value as? [String: String] {
                        let id = mainDict["id"]
                        let name = mainDict["name"]
                        let speciality = mainDict["speciality"]
                        let category = mainDict["category"]
                        let clinicName = mainDict["clinicName"]
                        let image = mainDict["image"]
                        let experience = mainDict["experience"]
                        let patients = mainDict["patients"]
                        let rating = mainDict["rating"]
                        let about = mainDict["about"]
                        let timeSlots = mainDict["timeSlots"]
                        self.doctors.append(Doctor(id: id!, name: name!, speciality: speciality!, category: category!, clinicName: clinicName! , image: image!, experience: experience!, patients: patients!, rating: rating!, about: about!, timeSlots: timeSlots!))
                    }
                }
            }
        }
    }
    
}
