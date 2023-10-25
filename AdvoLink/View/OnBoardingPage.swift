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
        VStack{
            Text("AdvoLink")
                .foregroundColor(.white)
                .font(.custom(customFont, size: 55))
                .fontWeight(.bold)
            
            Button{
                withAnimation{
                    showLoginPage = true
                }
            } label: {
                
                Text("Get started")
                    .font(.custom(customFont, size: 20))
                    .fontWeight(.semibold)
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color("Purple"))
            }
            .padding(.horizontal, 30)
            .offset(y: getRect().height < 750 ? 20:40)
            
            
        }
        .padding()
        .padding(.top,getRect().height < 750 ? 20 : 0)
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .background(
            Color("Purple")
        )
        .overlay{
            Group{
                if showLoginPage{
                    LoginPage()
                        .transition(.move(edge: .bottom))
                }
            }
        }
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
