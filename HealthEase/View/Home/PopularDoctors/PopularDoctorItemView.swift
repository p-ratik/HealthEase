//
//  PopularDoctorItemView.swift
//  HealthEase
//
//  Created by Pratik Chougule on 07/08/23.
//

import SwiftUI
import Kingfisher

struct PopularDoctorItemView: View {
    @EnvironmentObject var readViewModel: ReadViewModel
    
    var count: Int = 4
    var body: some View {
        TabView {
            if(!readViewModel.doctors.isEmpty) {
                ForEach(readViewModel.doctors) { doctor in
                    if(Int(doctor.rating)!) > 4 {
                        
                        NavigationLink(destination: DoctorDetailView(doctor: doctor), label: {
                            HStack {
                                VStack(alignment: .leading, spacing: 15) {
                                    VStack(alignment: .leading) {
                                        Text(doctor.name)
                                            .font(.title3)
                                            .foregroundColor(.black)
                                           // .minimumScaleFactor(0.8)
                                            .fontWeight(.heavy)
                                        Text(doctor.speciality)
                                            .foregroundColor(.black)
                                    }
                                    RatingView(rating: doctor.rating)
                                    .padding(.vertical, 10)
                                    
                                    VStack(alignment: .leading){
                                        Text("Experience")
                                            .foregroundColor(.black)
                                        Text(doctor.experience)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                    }
                                    VStack(alignment: .leading){
                                        Text("Patients")
                                            .foregroundColor(.black)
                                        Text(doctor.patients)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                    }
                                    
                                }
                                
                                KFImage(URL(string: doctor.image))
                                    .resizable()
                                    .placeholder({
                                        LoadingView(color: Color.blue)
                                            .scaleEffect(0.5)
                                    })
                                    .scaledToFit()
                                    .frame(width: 150, height: 150)
                            }
                            .padding(5)
                        })
                    }
                }
            } else {
                HStack(spacing: 10) {
                    Text("Loading")
                        .foregroundColor(.gray)
                    LoadingView(color: Color.gray)
                        .scaleEffect(0.5)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width-30, height: 250)
        .background(Color.white)
        .cornerRadius(12)
        .tabViewStyle(.page)
        .onAppear {
            setupAppearance()
            
        }
   
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
      }
}

struct PopularDoctorItemView_Previews: PreviewProvider {
    static var previews: some View {
        PopularDoctorItemView()
            .environmentObject(ReadViewModel())
    }
}
