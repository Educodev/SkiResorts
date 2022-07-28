//
//  ContentView.swift
//  SkiResorts
//
//  Created by Eduardo Herrera on 11/7/22.
//


import SwiftUI

struct ContentView: View {
    let model = Model()
    
    let heightCover = UIScreen.main.bounds.height/2
    
    var body: some View {
        
        ZStack(alignment: .top) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    
                    HeaderView(heightCover: heightCover)
                    
                    
                    VStack {
                        
                        CategoriesView()
                        
                        
                        HListPlacesView(model: model)
                    }.background(Color.white)
                        .cornerRadius(16)
                        .offset(y: -32)
                    
                    
                }
                
                
            }
            
            LinearGradient(colors: [.black.opacity(0.5), .clear], startPoint: .top, endPoint: .bottom)
                .frame(height: heightCover/2)
            
            
            
            HStack {
                Image(systemName: "arrow.backward")
                
                Spacer()
                Image(systemName: "magnifyingglass")
            }
            .padding()
            .padding(.top, 24)
            .imageScale(.large)
            .foregroundColor(.white)
            
            
            
        }.ignoresSafeArea(.all, edges: .top)
        
    }
}


struct HeaderView: View {
    let heightCover: Double
    
    var body: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .global).minY
            
            ZStack(alignment: .leading) {
                Image("HeaderImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: offset > 0 ? heightCover+offset : heightCover)
                    .clipped()
                    .offset(y: -offset)
                
                Text("Ski Resorts")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.blue)
                    .offset(y: -offset)
                    .padding(.horizontal)
            }
            
            
        }.frame(height: heightCover)
    }
}

struct CategoriesView: View {
    @State var categorySelected = ""
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 32){
                let categories = ["Recommended","Popular","Largest", "Others"]
                
                ForEach(categories, id: \.self) { category in
                    Button {
                        categorySelected = category
                    } label: {
                        VStack(spacing: 16) {
                            Text(category)
                                .fontWeight(categorySelected == category ? .bold : .regular)
                                .foregroundColor(categorySelected == category ? .black : .gray)
                                .cornerRadius(16)
                                .frame(height:8)
                            
                            if categorySelected == category {
                                Color.black
                                    .frame(height: 2)
                            }
                        }
                    }
                    
                }
                .padding(.vertical)
            }
            .padding()
            .onAppear {
                categorySelected = "Recommended"
            }
        }
    }
}

struct HListPlacesView: View {
    let model: Model
   
    
    var body: some View {
        
        VStack (spacing:16 ){
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach (model.places){place in
                                                    CardView(place: place)
                                .frame(width: 160)
                                .cornerRadius(16)
            
        
                    }
                    .padding(.bottom, 32)
                    .shadow(color: .gray.opacity(0.3), radius: 10, x: 1, y: 10)
                    
                }
                .padding(.horizontal)
                .frame(height: 260)
                
            }
            
            HStack {
                Text("Sorted by") + Text(" Rating")
                    .fontWeight(.black)
                Spacer()
                Button {
                    
                } label: {
                    Text("Filter")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
            }.padding(.horizontal)
                .foregroundColor(.black)
            
            
            
            VStack(spacing: 32) {
                
                ForEach(model.places) { place in
                    VStack(spacing: 16) {
                        HStack {
                            Text(place.province + ", " + place.country)
                                .fontWeight(.bold)
                                .font(.caption)
                                .foregroundColor(.blue)
                            
                            Spacer()
                            
                            Image(place.country)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipped()
                                .clipShape(Circle())
                        }
                        
                        GeometryReader { proxy in
                            let heightGradient = proxy.frame(in: .global).height/2.8
                            let height = proxy.frame(in: .global).height
                            let width = proxy.frame(in: .global).width
                            ZStack(alignment: .bottomLeading) {
                                Image(place.imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: width, height: height)
                                    .clipped()
                                
                                LinearGradient(colors: [.gray.opacity(0.5), .clear], startPoint: .bottom, endPoint: .top)
                                    .frame(height: heightGradient)
                                Text(place.title)
                                    .font(.title3)
                                    .fontWeight(.black)
                                    .padding()
                                    .foregroundColor(.white)
                                
                            }
                            .cornerRadius(16)
                        }
                        .frame(height: UIScreen.main.bounds.height/4)
                    }
                    
                    
                    Divider()
                }
            }
            .padding(.horizontal)
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 1, y: 10)
            
   
        }
        
        
        
    }
}


