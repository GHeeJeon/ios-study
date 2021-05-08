//
//  ContentView.swift
//  Login
//
//  Created by 지민호 on 2021/04/27.
//
import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

let skyBlueColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)

let storedUsername = "1234"
let storedPassword = "1234"

struct ContentView : View {
    
    // @State var showAlert = false
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var authenticationDidFail: Bool = false
    @State var authenticationDidSucceed: Bool = false
    @State var usernameIsNil: Bool = false
    @State var passwordIsNil: Bool = false
    
    @State var editingMode: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack {
                // WelcomeText()
                logo()
                UsernameTextField(username: $username, editingMode: $editingMode)
                PasswordSecureField(password: $password)
                
                /* if authenticationDidFail {
                    if self.username == "" {
                        Text("아이디를 입력해주세요.")
                            .offset(y: -10)
                            .foregroundColor(.red)
                    }
                    else if self.password == "" {
                        Text("비밀번호를 입력해주세요.")
                            .offset(y: -10)
                            .foregroundColor(.red)
                    }
                    else {
                        /*
                         MARK: UI 오류
                         아이디와 비밀번호를 정상적으로 입력 한 상태에서도 해당 문구가 보이네요!
                         이 부분은 수정이 필요할 것 같아 보여요!
                         제 생각은 해당 필드를 공백으로 주고 로그인 버튼을 눌렀을 때 맞는 비밀번호인지 틀린 비밀번호인지 체크하는게 좋아 보입니다!
                         그렇다면 버튼을 눌렀을 때 alert가 표시가 되도록 해야겠죠?
                         */
                        Text("아이디와 비밀번호를 다시 확인해주세요.")
                            .offset(y: -10)
                            .foregroundColor(.red)
                    }
                } */
                Button(action: {
                    if self.username == storedUsername && self.password == storedPassword {
                        // self.showAlert.toggle()
                        self.authenticationDidSucceed = true
                        self.authenticationDidFail = false
                        self.usernameIsNil = false
                        self.passwordIsNil = false
                    }
                    else if self.username == "" {
                        self.usernameIsNil = true
                        self.authenticationDidSucceed = false
                        self.authenticationDidFail = false
                        self.passwordIsNil = false
                    }
                    else if self.username != "" && self.password == "" {
                        self.passwordIsNil = true
                        self.authenticationDidSucceed = false
                        self.authenticationDidFail = false
                        self.usernameIsNil = false
                    } else {
                        self.authenticationDidFail = true
                        self.authenticationDidSucceed = false
                        self.usernameIsNil = false
                        self.passwordIsNil = false
                        
                    }
                })
                {
                    Text("로그인")
                        .font(.headline)
                        //change
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 350, height: 40)
                        .background(Color(red: 0.323, green: 0.795, blue: 0.988))
                        .cornerRadius(15.0)
                }
                symbol()
                }
                .padding()
        }.offset(y: editingMode ? -10 : 0)
        .alert(isPresented: $authenticationDidSucceed) { () -> Alert in
            /*
             MARK: 분기
             여기서 id와 pw가 맞다면 성공을 리턴, 틀리다면 틀렸다는 alert를 리턴할 수 있겠네요!
             */
            Alert(title: Text("로그인 성공!"), message: Text("환영합니다."))
        }
        .alert(isPresented: $usernameIsNil) { () -> Alert in
         Alert(title: Text("로그인 실패"), message: Text("아이디를 입력해주세요."))
        }
        .alert(isPresented: $passwordIsNil) { () -> Alert in
            Alert(title: Text("로그인 실패"), message: Text("비밀번호를 입력해주세요."))
        }
        .alert(isPresented: $authenticationDidFail) { () -> Alert in
            Alert(title: Text("로그인 실패"), message: Text("아이디와 비밀번호를 다시 확인해주세요."))
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))

    }
}
#endif

struct WelcomeText : View {
    var body: some View {
        return Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

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

struct UsernameTextField : View {
    
    @Binding var username: String
    
    @Binding var editingMode: Bool
    
    var body: some View {
        return TextField("", text: $username, onEditingChanged: {edit in
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
        return SecureField("", text: $password)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.top, -20)
    }
}
