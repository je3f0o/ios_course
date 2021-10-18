//
//  ContentView.swift
//  SwiftUI - 2nd day
//
//  Created by Batkhishig on 2021.10.15.
//

import SwiftUI

struct NumberInput: UIViewRepresentable {
    func makeUIView(context: Context) -> UITextField {
        let view = UITextField()
        
        view.keyboardType = .numberPad
        
        return view
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        
    }
}

struct MyInput: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 8) {
            HStack(spacing: 8) {
                SecureField("Нэвтрэх нэр", text: $text)
                Image(systemName: "person")
                    .foregroundColor(Color.black.opacity(0.5))
                
                NumberInput()
            }
            .padding(.horizontal, 12)
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
        .background(Color.black.opacity(0.08))
        .background(Color.white)
        .cornerRadius(12)
    }
}

struct ContentView: View {
    @State var username = ""
    @State var password = ""
    
    @State var is_a_view_active = false
    @State var is_b_view_active = false
    
    @State var toggle = false
    
    var backup: some View {
        VStack(spacing: 0) {
            Image("apple")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 80)
                .background(Color.blue)
            
            Text("myparking")
                .font(.title)
                .fontWeight(.bold)
                .italic()
                .padding(.top, 20)
                .background(Color.red)
            
            MyInput(placeholder: "Нэвтрэх нэр", text: $username)
        }
        .background(Color.green)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: AView(is_active: $is_a_view_active),
                    isActive: $is_a_view_active,
                    label: {
                        Text("A View")
                            .font(.title)
                            .padding()
                            .frame(width: 250)
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(16)
                    })
                
                NavigationLink(
                    destination: BView(),
                    isActive: $is_b_view_active,
                    label: {
                        Text("B View")
                            .font(.title)
                            .padding()
                            .frame(width: 250)
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(16)
                    })
                
                Button(action: {
                    toggle.toggle()
                }, label: {
                    Text("Button \(toggle ? "toggled" : "")")
                })
            }
        }
    }
}

struct AView: View {
    @Binding var is_active: Bool
    
    @State var is_b_view_active = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("A View")
                .font(.system(size: 80))
                .foregroundColor(.white)
            
            Button(action: {
                is_active = false
            }, label: {
                Text("Back")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
            })
            
            NavigationLink(
                destination: BView(),
                isActive: $is_b_view_active,
                label: {
                    Text("B View")
                        .font(.title)
                        .padding()
                        .frame(width: 250)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(16)
                })
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .navigationTitle("A View")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
//        .ignoresSafeArea()
    }
}

struct BView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("B View")
                .font(.system(size: 80))
                .foregroundColor(.white)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    fileprivate struct InputPreview: View {
        @State var text = ""
        
        var body: some View {
            VStack {
                Spacer()
                Text("Binded text: \(text)")
                MyInput(placeholder: "Нэвтрэх нэр", text: $text)
                    .padding()
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .ignoresSafeArea()
        }
    }
    
    static var previews: some View {
//        Group {
//            ContentView()
//                .preferredColorScheme(.dark)
            
        
//        BView()
        
//        InputPreview()
        
            ContentView()
//                .preferredColorScheme(.light)
//        }
        
    }
}
