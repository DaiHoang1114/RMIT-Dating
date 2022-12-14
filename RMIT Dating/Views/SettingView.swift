/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Authors (ID):
    Nguyen Minh Tri    (s3726096)
    Duong Minh Nhat    (s3715125)
    Hoang Quoc Dai    (s3426353)
    Vu Duy Khoi    (s3694615)
  Created  date: 10/09/2022
  Last modified: 18/09/2022
  Acknowledgement:
    https://firebase.google.com/docs/build
    https://www.appcoda.com/swiftui-camera-photo-library/
    https://youtube.com (tutorial videos)
*/


// References: https://www.appcoda.com/swiftui-camera-photo-library/

import SwiftUI
import FirebaseStorage

struct SettingView: View {
    
    @EnvironmentObject var userInfoVM: UserInfoViewModel
    @EnvironmentObject var userVM: UserViewModel
    
    @State var userInfoDto: UserInfo = UserInfo()
    @State var page: Int = 1
    
    @State var selectedUIImages: [UIImage] = []
    
    var body: some View {
        VStack {
            switch page {
            case 1:
                FirstPage(userInfoDto: $userInfoDto)
            case 2:
                SecondPage(userInfoDto: $userInfoDto)
            case 3:
                ThirdPage(userInfoDto: $userInfoDto)
            case 4:
                ImagePage(images: $selectedUIImages)
            default:
                FirstPage(userInfoDto: $userInfoDto)
            }
            if page < 4 {
                Button("Next") {
                    page += 1
                }
            } else if page == 4 {
                Button("Finish User Settings") {
                    userInfoVM.createUserInfo(userId: userVM.getUUID(),userInfoDto: userInfoDto, images: selectedUIImages)
                    userVM.saveUserToUserDefault()
                    userVM.setIsLogin(status: true)
                }
            }
        }
    }
}

struct FirstPage: View {
    @Binding var userInfoDto: UserInfo
    
    var body: some View {
        Form {
            TextField(text: $userInfoDto.name) {
                Text("Full Name")
            }
            DatePicker(selection: $userInfoDto.dob, in: ...Date(), displayedComponents: .date) {
                Text("Date of Birth")
                    .foregroundColor(.gray)
            }
            .fixedSize()
            TextField(text: $userInfoDto.phone) {
                Text("Phone")
            }
        }
    }
}

struct SecondPage: View {
    @Binding var userInfoDto: UserInfo
    
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $userInfoDto.maritalStatus) {
                    Text("Single").tag("Single")
                    Text("Married").tag("Married")
                } label: {
                    Text("Marital Status:")
                }
                
                Picker(selection: $userInfoDto.gender) {
                    Text("Male").tag("Male")
                    Text("Female").tag("Female")
                    Text("Others").tag("Others")

                } label: {
                    Text("Gender")
                }
                
                Picker(selection: $userInfoDto.religion) {
                    Text("Buddha").tag("Buddha")
                    Text("Christian").tag("Christian")
                    Text("Muslim").tag("Muslim")
                    Text("None").tag("None")
                    Text("Others").tag("Others")
                } label: {
                    Text("Religion")
                }
            }
        }
    }
}

struct ThirdPage: View {
    @Binding var userInfoDto: UserInfo
    
    let hobbiesList = ["Sport", "Esport"]
    let musicList = ["Pop", "Rock", "Classic"]
    
    var body: some View {
        Form {
            Section {
                Text("Hobbies")
                ForEach(hobbiesList, id: \.self) { item in
                    SelectionRow (
                        title: item,
                        selected: userInfoDto.hobbies.contains(item))
                    {
                        if userInfoDto.hobbies.contains(item) {
                            userInfoDto.hobbies.removeAll
                            {
                                selectedItem in
                                selectedItem == item
                            }
                        } else {
                            userInfoDto.hobbies.append(item)
                        }
                    }
                }
            }
            
            Section {
                Text("Music")
                ForEach(musicList, id: \.self) { item in
                    SelectionRow (
                        title: item,
                        selected: userInfoDto.musics.contains(item))
                    {
                        if userInfoDto.musics.contains(item) {
                            userInfoDto.musics.removeAll
                            {
                                selectedItem in
                                selectedItem == item
                            }
                        } else {
                            userInfoDto.musics.append(item)
                        }
                    }
                }
            }
        }
    }
}

struct ImagePage: View {
    @Binding var images: [UIImage]
    @State var showLibrary = false
    let gridSpacing: CGFloat = 10
    let gridPadding: CGFloat = 5
    
    let columns = [
        GridItem(spacing: 10),
        GridItem(spacing: 10),
        GridItem(spacing: 10)
    ]
    
    var body: some View {
        VStack {
            Text("Your Images")
                .font(.title)
                .bold()
            ScrollView {
                let size: CGFloat = (UIScreen.main.bounds.width/3) - gridSpacing - gridPadding
                LazyVGrid(columns: columns, spacing: gridSpacing) {
                    if !images.isEmpty {
                        ForEach(images, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size, height: size, alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                    }
                    Button {
                        showLibrary = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .stroke()
                                .foregroundColor(.black)
                                .frame(width: size, height: size, alignment: .leading)
                            Image(systemName: "plus")
                        }
                    }
                }
                .padding(.horizontal, gridPadding)
            }
        }
        .sheet(isPresented: $showLibrary) {
            ImagePicker(selectedImages: $images)
        }
    }
}
    
struct SelectionRow: View {
    var title: String
    var selected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            HStack {
                Text(title)
                    .foregroundColor(.black)
                if selected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        })
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    var source: UIImagePickerController.SourceType = .photoLibrary
    @Environment(\.presentationMode) private var presentationMode
    @Binding var selectedImages: [UIImage]
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = source
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
         
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                if !parent.selectedImages.contains(image) {
                    parent.selectedImages.append(image)
                }
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
