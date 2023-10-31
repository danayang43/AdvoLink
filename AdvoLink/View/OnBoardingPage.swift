//
//  OnBoardingPage.swift
//  AdvoLink
//
//  Created by Dana Yang on 10/24/23.
//

import SwiftUI

let customFont = "Raleway-Regular"

struct OnBoardingPage: View {
    @State var showLoginPage: Bool = false
    var body: some View {
        NavigationView {
            VStack{
                Image("advolink")
                    .resizable()
                    .frame(width:350, height:350)
                
                NavigationLink(destination: Login()) {
                               ButtonView()
                }
            }
            .padding()
            .padding(.top,getRect().height < 750 ? 20 : 0)
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .background(Color("Purple"))
            .overlay{
                Group{
                    if showLoginPage{
                        Login()
                            .transition(.move(edge: .bottom))
                    }
                }
            }
        }
    }
}

struct ButtonView: View {
    var body: some View {
        Text("Get Started")
            .font(.custom(customFont, size: 20))
            .fontWeight(.semibold)
            .padding(.vertical, 18)
            .frame(maxWidth: .infinity)
            .background(Color("Purple2"))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
            .foregroundColor(Color.white)
        
            .padding(.horizontal, 30)
            .offset(y: getRect().height < 750 ? 20:40)
    }
}
    
struct OnBoardingPage_Previews: PreviewProvider{
    static var previews: some View{
        OnBoardingPage()
    }
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
