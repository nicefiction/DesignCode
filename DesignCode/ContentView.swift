//
//  ContentView.swift
//  DesignCode
//
//  Created by Olivier Van hamme on 07/09/2020.
//  Copyright © 2020 nicefiction. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
     // ////////////////////////
    //  MARK: PROPERTY WRAPPERS
    
    @State private var isShowing: Bool = false
    @State private var viewState: CGSize = CGSize.zero
    @State private var isShowingCard: Bool = false
    
    
    
     // //////////////////////////
    //  MARK: COMPUTED PROPERTIES
    
    var body: some View {
        
        ZStack {
            TitleView()
                .blur(radius : isShowing ? 20.0 : 0.0)
                .opacity(isShowingCard ? 0.40 : 1.00)
                .offset(y : isShowingCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.10)
            )

            
            BackCardView()
                .frame(width : isShowingCard ? 300.00 : 340.00 ,
                       height : 220.0)
                .background(isShowing ? Color("card3") : Color("card4"))
                .cornerRadius(20.0)
                .shadow(radius: 20.0)
                .offset(x : 0.0 ,
                        y : isShowing ? -400.0 : -40.0)
                .offset(x : viewState.width ,
                        y : viewState.height )
                .offset(y : isShowingCard ? -180 : 0)
                .scaleEffect(isShowingCard ? 1 : 0.90)
                .rotationEffect(Angle(degrees : isShowing ? 0.00 : 10.00))
                .rotationEffect(Angle(degrees: isShowingCard ? -10.00 : 0.00))
                .rotation3DEffect(Angle(degrees : isShowingCard ? 0 : 10.00) ,
                                  axis : (x : 10 ,
                                          y : 0 ,
                                          z : 0))
                .blendMode(.hardLight)
                .animation(Animation.easeInOut(duration : 0.50))
            
            
            BackCardView()
                .frame(width : 340.0 ,
                       height : 220.0)
                .background(isShowing ? Color("card4") : Color("card3"))
                .cornerRadius(20.0)
                .shadow(radius: 20.0)
                .offset(x : 0.0 ,
                        y : isShowing ? -200.0 : -20.0)
                .offset(x : viewState.width ,
                        y : viewState.height )
                .offset(y : isShowingCard ? -140 : 0)
                .scaleEffect(isShowingCard ? 1 : 0.95)
                .rotationEffect(Angle(degrees : isShowing ? 0.00 : 5.00))
                .rotationEffect(Angle(degrees: isShowingCard ? -5.00 : 0.00))
                .rotation3DEffect(Angle(degrees : isShowingCard ? 0 : 5.00) ,
                                  axis : (x : 10 ,
                                          y : 0 ,
                                          z : 0))
                .blendMode(BlendMode.hardLight)
                .animation(Animation.easeInOut(duration: 0.30))
            
            
            CardView()
                .frame(width : isShowingCard ? 340 * 1.1 : 340 ,
                       height : isShowingCard ? 220.0 * 1.1 : 220) // Olivier
                .background(Color.black)
//                .cornerRadius(20.0)
                .clipShape(RoundedRectangle(cornerRadius : isShowingCard ? 30 : 20 ,
                                            style : .continuous))
                .shadow(radius : 20)
                .offset(x : viewState.width ,
                        y : viewState.height )
                .offset(y : isShowingCard ? -100 : 0)
                .blendMode(BlendMode.hardLight)
                .animation(Animation.spring(response : 0.30,
                                            dampingFraction : 0.60 ,
                                            blendDuration : 0.00))
                .onTapGesture {
                    self.isShowingCard.toggle()
            } // .onTapGesture {}
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.viewState = value.translation
                            self.isShowing = true
                    } // .onChanged {}
                        .onEnded { value in
                            self.viewState = CGSize.zero
                            self.isShowing = false
                    } // .onEnded {}
            ) // .gesture()
            
            
            BottomCardView()
                .offset(x : 0 ,
                        y : isShowingCard ? 360.00 : 1_000.0)
                .blur(radius : isShowing ? 20.0 : 0.0)
                .animation(Animation.timingCurve(0.20 ,
                                                 0.80 ,
                                                 0.20 ,
                                                 1.00 ,
                                                 duration : 0.80))
            
            
        } // ZStack {}
        
        
        
        
        
    } // var body: some View {}
} // struct ContentView: View {}





 // ///////////////
//  MARK: CardView

struct CardView: View {
    var body: some View {
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
    }
}



 // ///////////////////
//  MARK: BackCardView

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}


struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                Spacer()
            }
            .padding()
            
            
            Image("Background1")
            
            
            Spacer()
        }
    }
}



 // /////////////////////
//  MARK: BottomCardView

struct BottomCardView: View {
    var body: some View {
        VStack(spacing : 20.0) {
            Rectangle()
                .frame(width : 40.0 ,
                       height : 6.0)
                .cornerRadius(3.0)
                .opacity(0.1)
            
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.center)
                .font(.subheadline)
                .lineSpacing(4.0)
            
            Spacer()
        }
        .padding(.top , 8.0)
        .padding(.horizontal , 20.0)
        .frame(maxWidth : .infinity)
        .background(Color.white)
        .cornerRadius(30.0)
        .shadow(radius : 20.0)
    }
}





 // ///////////////
//  MARK: PREVIEWS

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
