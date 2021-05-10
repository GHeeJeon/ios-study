//
//  ContentView.swift
//  Login
//
//  Created by 지민호 on 2021/04/27.
//
// 글자 수 제한, 비밀번호 토글

import SwiftUI

var storedIdentity = ""
var storedPassword = ""
// let storedIdentity = "1234"
// let storedPassword = "1234"


struct ContentView : View {
    
    @State var showAlert = false

    @State var identity: String = ""
    @State var password: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    
    @State var editingMode: Bool = false
    
    var body: some View {
        
        ZStack {
            NavigationView{
                VStack {
                    logo()
                    IdentityTextField(identity: $identity, editingMode: $editingMode)
                    PasswordSecureField(password: $password)
                    
                    if authenticationDidFail {
                        if self.identity.isEmpty {
                            Text("아이디를 입력해주세요.")
                            .offset(y: -10)
                            .foregroundColor(.red)
                        } else if self.password.isEmpty {
                            Text("비밀번호를 입력해주세요.")
                                .offset(y: -10)
                                .foregroundColor(.red)
                        } else {
                            Text("아이디와 비밀번호를 다시 확인해주세요.")
                                .offset(y: -10)
                                .foregroundColor(.red)
                        }
                    }
                    Button(action: {
                        if self.identity == storedIdentity && self.password == storedPassword {
                            self.showAlert.toggle()
                            self.authenticationDidSucceed = true
                            self.authenticationDidFail = false
                        } else {
                            self.authenticationDidFail = true
                            self.authenticationDidSucceed = false
                        }
                    })
                    {
                        LoginButtonContent()
                    }
                    
                    NavigationLink(
                        destination: SignUpView(),
                        label: {
                            SignInButtonContent()
                        })
                    symbol()

                }.padding()
        }.offset(y: editingMode ? -10 : 0)
        .alert(isPresented: $authenticationDidSucceed) { () -> Alert in
            Alert(title: Text("로그인 성공!"), message: Text("환영합니다."))
        }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            SignUpView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
        }
    }
}
#endif

struct logo : View {
    var body: some View {
        return Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 100)
            .clipped()
            .padding()
    }
}

struct symbol : View {
    var body: some View {
        return Image("symbol")
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .clipped()
            .padding(.top, 80)
        
    }
}

struct LoginButtonContent : View {
    var body: some View {
        return Text("로그인")
            .font(.headline)
            //change
            .foregroundColor(.white)
            .padding()
            .frame(width: 350, height: 40)
            .background(Color(red: 0.323, green: 0.795, blue: 0.988))
            .cornerRadius(15.0)
    }
}

struct SignInButtonContent : View {
    var body: some View {
        return Text("회원가입")
            .font(.headline)
            //change
            .foregroundColor(.white)
            .padding()
            .frame(width: 350, height: 40)
            .background(Color(hue: 0.611, saturation: 0.708, brightness: 0.971))
            .cornerRadius(15.0)
    }
}

struct SignUpButtonContent : View {
    var body: some View {
        return Text("가입하기")
            .font(.headline)
            //change
            .foregroundColor(.white)
            .padding()
            .frame(width: 350, height: 40)
            .background(Color(hue: 0.611, saturation: 0.704, brightness: 0.838))
            .cornerRadius(15.0)
    }
}

struct IdentityTextField : View {
    
    @Binding var identity: String
    
    @Binding var editingMode: Bool
    
    var body: some View {
        return TextField("아이디", text: $identity, onEditingChanged: {edit in
            if edit == true
            {self.editingMode = true}
            else
            {self.editingMode = false}
        })
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct PasswordSecureField : View {
    
    @Binding var password: String
    
    var body: some View {
        return SecureField("비밀번호", text: $password)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.top, -20)
    }
}

struct SignUpUsernameTextField : View {
    
    @Binding var signupUsername: String
    
    var body: some View {
        return TextField("이름", text: $signupUsername)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct SignUpIdentityTextField : View {
    
    @Binding var signupIdentity: String
    
    var body: some View {
        return TextField("아이디", text: $signupIdentity)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct SignUpPasswordTextField : View {
    
    @Binding var signupPassword: String
    
    var body: some View {
        return TextField("비밀번호", text: $signupPassword)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct SignUpView: View {
    @State var showAlert = false
    
    @State var storedIdentity = UserDefaults.standard.string(forKey: "storedIdentity")
    @State var storedPassword = UserDefaults.standard.string(forKey: "storedPassword")
    
    @State var signupUsername: String = ""
    @State var signupIdentity: String = ""
    @State var signupPassword: String = ""
    
    @State var SignUpDidFail: Bool = false
    @State var SignUpDidSucceed: Bool = false
    
    @State var editingMode: Bool = false
    
    var body: some View {
        
        ZStack {
            NavigationView{
                VStack {
                    SignUpUsernameTextField(signupUsername: $signupUsername)
                    SignUpIdentityTextField(signupIdentity: $signupIdentity)
                    SignUpPasswordTextField(signupPassword: $signupPassword)
                    
                    if SignUpDidFail {
                        if self.signupUsername.isEmpty {
                            Text("이름을 입력해주세요.")
                            .offset(y: -10)
                            .foregroundColor(.red)
                        } else if self.signupIdentity.isEmpty {
                            Text("아이디를 입력해주세요.")
                            .offset(y: -10)
                            .foregroundColor(.red)
                        } else if self.signupPassword.isEmpty {
                            Text("비밀번호를 입력해주세요.")
                                .offset(y: -10)
                                .foregroundColor(.red)
                        } else {
                            Text("아이디와 비밀번호를 다시 확인해주세요.")
                                .offset(y: -10)
                                .foregroundColor(.red)
                        }
                    }
                    
                    Button(action: {
                        if self.signupUsername != "" && self.signupIdentity != "" && self.signupPassword != "" {
                            self.showAlert.toggle()
                            self.SignUpDidSucceed = true
                            self.SignUpDidFail = false
                        } else {
                            self.SignUpDidFail = true
                            self.SignUpDidSucceed = false
                        }
                    })
                    {
                        SignUpButtonContent()
                    }
                    
                }.padding()
        }.offset(y: editingMode ? -10 : 0)
        .alert(isPresented: $SignUpDidSucceed) { () -> Alert in
            Alert(title: Text("회원가입 완료!"), message: Text(signupUsername))
        }
    }
}
}
