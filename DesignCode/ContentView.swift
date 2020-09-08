//
//  ContentView.swift
//  DesignCode
//
//  Created by Olivier Van hamme on 07/09/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
            }
            .frame(width : 300.0 , height : 220.0)
            .background(Color.blue)
            .cornerRadius(20.0)
            .shadow(radius: 20.0)
            .offset(x : 0.0 , y : -20.0)
            
            
            VStack {
                HStack {
                    VStack(alignment : .leading) {
                        Text("Hello, World!")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                        Text("Certificate")
                            .foregroundColor(Color("accent"))
                    }
                    Spacer()
                    Image("Logo1")
                }
                .padding([.horizontal , .top] , 20)
                
                Spacer()
                
                Image("Card1")
                    .resizable()
                    .aspectRatio(contentMode : .fill)
                    .frame(width : 300.0 ,
                           height : 110.0 ,
                           alignment : .top)
            }
            .frame(width : 340.0 , height : 220.0)
            .background(Color.black)
            .cornerRadius(20.0)
            .shadow(radius : 20)
        }
        
        
        
        
        
    } // var body: some View {}
} // struct ContentView: View {}




 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
