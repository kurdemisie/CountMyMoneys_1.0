//
//  HomeView.swift
//  CountMyMoneys_1.0
//
//  Created by Monika Herain on 3.10.2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model:ContentModel
    @State var timerOn = false
    
    let gradient = LinearGradient(colors:
                                    [Color(red: 253/255, green: 207/255, blue: 39/255),
                                     Color(red: 253/255, green: 180/255, blue: 12/255),
                                     Color(red: 215/255, green: 123/255, blue: 0)],
                                  startPoint: .top,
                                  endPoint: .bottom)
    
    func timerDisplayedFormatter (time:Double) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        return(formatter.string(from: time) ?? "0:00")
    }
    func totalHoursDisplayedFormatter (time:Double) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .pad
        
        return(formatter.string(from: time) ?? "0:00")
    }
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                
                gradient
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    
                    // MARK: Summary section
                    VStack(alignment: .trailing) {
                        
                        Text(totalHoursDisplayedFormatter(time: model.hoursTotal))
                            .font(Font.custom("Helvetica", size: 24))
                            .offset(x: geo.size.width/4)
                        Text("-34,250 ISK")
                            .font(Font.custom("Helvetica", size: 24))
                            .offset(x: geo.size.width/4)
                        Text("256,700 ISK")
                            .font(Font.custom("Helvetica", size: 24))
                            .offset(x: geo.size.width/4)
                    }
                    .frame(width: geo.size.width, height: geo.size.height/4)

                    Spacer()
                    
                    // MARK: Counter
                    Text(timerDisplayedFormatter(time: model.currentTimer))
                    //Text(timerDisplayedFormatter(time: model.currentTimer))
                        .font(Font.custom("Helvetica", size: 60))
                    
                    Spacer()
                    
                    // MARK: Clock in button
                    Button(action: {
                        timerOn.toggle()
                        if timerOn {
                            model.startTimer()
                        }
                        else {
                            model.stopTimer()
                        }
                    }, label: {
                        ZStack {
                            Rectangle()
                            Text(timerOn ? "Clock out" : "Clock in")
                                .font(Font.custom("Helvetica", size: 36))
                                .foregroundStyle(.black)
                        }
                    })
                    .frame(width: geo.size.width*0.55, height: 70)
                    .clipShape(RoundedRectangle(cornerRadius: 27.0))
                    .foregroundStyle(Color(red: 127/255, green: 197/255, blue: 188/255))
                    .padding(.bottom, 50)
                    .shadow(radius: 8, x:0, y: 2)
                }
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(ContentModel())
}
