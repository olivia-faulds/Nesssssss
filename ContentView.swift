//
//  ContentView.swift
//  Ness Botanic Gardens App
//
//  Created by Olivia Faulds on 10/03/2022.
//

import MapKit
import SwiftUI
import CoreLocation



struct TrailView: View{
    var trails: [Trail] = TrailList.avaliableTrails
    var body: some View {
        NavigationView{
                ZStack{
                    Color(UIColor.lightGray)
                    List(trails, id: \.id) {trail in
                        NavigationLink(destination: TrailDetailView(trail:trail), label:{
                        VStack(alignment: .leading, spacing: 5){
                            Text(trail.title)
                                .fontWeight(.bold)
                            Text(trail.description)
                        }
                            
                        })
            
                        }
                    }
                .navigationTitle("Trails")
                }
        
                .border(Color.black)
            
            
    }
}




struct InfoView: View{
    var body: some View {
        NavigationView{
            ZStack{
                Color(UIColor.lightGray)
                VStack(spacing: 5.0){
                    Text("Infomation:")
                        .fontWeight(.bold)
                        .font(.title)
                    Text("Address:")
                        .fontWeight(.semibold)
                        .font(.subheadline)
                    Text("Neston Rd, Little Neston, Ness CH64 4AY")
                        .padding(.all, 10)
                    Text("Contact us:")
                        .fontWeight(.semibold)
                        .font(.subheadline)
                    Text("0151 795 6300 \n nessgdns@liverpool.ac.uk")
                    Text("Hours:")
                        .fontWeight(.semibold)
                        .font(.subheadline)
                    Text("Monday   10am-4:30pm \n Tuesday   10am-4:30pm \n Wednesday   10am-4:30pm \n Thursday   10am-4:30pm \n Friday   10am-4:30pm \n Saturday   10am-4:30pm \n Sunday   10am-4:30pm" )
                      
                    
                }
            }
            .navigationTitle("Info")
            .border(Color.black)
        }
    }
}




struct MapView: View{
    @StateObject private var authenticate = Authenticate()
    fileprivate let locationManager:CLLocationManager = CLLocationManager()
    
        var body: some View {
            NavigationView{
               
                MapDisplayView()
                    .ignoresSafeArea()
                    .onAppear{
                        authenticate.locationEnabled()
                    }
            }
            
            
        }
                
                
                
        
    
}

final class Authenticate: NSObject, ObservableObject, CLLocationManagerDelegate  {
    fileprivate let locationManager:CLLocationManager = CLLocationManager()
    
        func locationEnabled(){
            print("yes")
            if CLLocationManager.locationServicesEnabled(){
                locationManager.delegate = self
                locationAuthorised()
                
            }else{
                locationManager.requestWhenInUseAuthorization()
            }
        }

    
     func locationAuthorised(){
        switch locationManager.authorizationStatus{
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("Your location is restricted")
            case .denied:
                print("You have denied this application your loaction. Please head to settings to fix this.")
            case .authorizedAlways, .authorizedWhenInUse:
                break
            @unknown default:
                break
        }
     }
        
        
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            locationAuthorised()
        }
        


}










struct HomeView: View{
    private var noOfImages = 6
    var body: some View {
        NavigationView{
            ZStack{
                Color(UIColor.lightGray)
                VStack{
                    Text("Welcome to the Ness Boantic Garden app! Here you will be able to navigate the garden using GPS, discover all the different sections of the garden with detailed descriptions and follow recommended trails. Please use the tab bar below to navigate between features")
                        .padding(40)
                    
                    TabView{
                        ForEach(1..<noOfImages){ num in Image("\(num)")
                                .resizable()
                                .scaledToFit()
                                .tag(num)
                        }
                    }.tabViewStyle(PageTabViewStyle())
                    
                }
                }
            .navigationTitle("Ness Botanic Gardens")
            .border(Color.black)
        }
    }
}



struct ContentView: View {
        var body: some View {
            TabView{
                HomeView()
                    .tabItem{
                        Image(systemName: "house")
                        Text("Home")
                    }
                MapView()
                    .tabItem{
                        Image(systemName: "map")
                        Text("Map")
                    }
                TrailView()
                    .tabItem{
                        Image(systemName: "figure.walk")
                        Text("Trails")
                    }
               /* PlantView()
                    .tabItem{
                        Image(systemName: "leaf")
                        Text("Plants")
                    } */
                InfoView()
                    .tabItem{
                        Image(systemName: "info")
                        Text("Info")
                    }
            }
        }
}
                                
    struct ContentView_Previews: PreviewProvider {
                static var previews: some View {
                    ContentView()
                }
            }
                    
                    
                    
                    
                    
                    
                
            
        







 

