/*
 
 
 
 */


import SwiftUI
import ViewModifiers
import AvatarAsyncLoad

@available(iOS 15.0, *)
public struct SidebarMenu: View {
    
    @Binding public var isSidebarVisible: Bool
    private(set) var userName: String
    private(set) var userAvatar: String
    private(set) var userNickName: String
    private var viewModel: SideBarViewModel = SideBarViewModel()
    @Binding private(set) var islogout: Bool
    
    var sideBarWidth = UIScreen.main.bounds.size.width * 0.8 // Ширина sideBar
    
    var userProfile: some View {
        
        
        
        VStack(alignment: .leading) {
            
            HStack {
                ImageAsyncLoad {
                    ImageContent(url: userAvatar, size: 50)
                }
                .shadow(radius: 4)
                .padding(.trailing, 18)
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text(userName)
                        .foregroundColor(.white)
                        .bold()
                        .font(.title3)
                    Text(verbatim: userNickName)
                        .foregroundColor(viewModel.colorSet.secondaryColor)
                        .font(.caption)
                }
            }
            .padding(.bottom, 20)
        }
        
        
        
    }
    
    var content: some View {
        
        HStack(alignment: .top) {
            ZStack(alignment: .top) {
                viewModel.colorSet.bgColor
                MenuChevron
                    .onTapGesture {
                        isSidebarVisible.toggle()
                    }
                
                VStack(alignment: .leading, spacing: 20) {
                    userProfile
                    Divider()
                        .background(Color.white)
                    viewModel.userAction
                    
                    Divider()
                        .background(Color.white)
                    viewModel.profileActions
              
                }
                .padding(.top, 80)
                .padding(.horizontal, 40)
                
            }
            .frame(width: sideBarWidth)
            .offset(x: isSidebarVisible ? 0 : -sideBarWidth)
            .animation(.default, value: isSidebarVisible)
            
            Spacer()
        }
        
        
    }
    
    var MenuChevron: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .fill(viewModel.colorSet.bgColor)
                .frame(width: 60, height: 60)
                .rotationEffect(Angle(degrees: 45))
                .offset(x: isSidebarVisible ? -18 : -5)
                .opacity(isSidebarVisible ? 1 : 0.8)
                .animation(.default, value: isSidebarVisible)
            
            Image(systemName: "chevron.right")
                .foregroundColor(viewModel.colorSet.secondaryColor)
                .rotationEffect(
                    isSidebarVisible ?
                    Angle(degrees: 180) : Angle(degrees: 0))
                .offset(x: isSidebarVisible ? -4 : 8)
                .foregroundColor(.blue)
        }
        .offset(x: sideBarWidth / 2, y: 80)
        .animation(.default, value: isSidebarVisible)
    }
    
    public var body: some View {
        let drag = DragGesture()
            .onEnded {
                if $0.translation.width < -50 {
                    withAnimation {
                        self.isSidebarVisible = false
                    }
                } else if $0.translation.width > 50 {
                    withAnimation {
                        self.isSidebarVisible = true
                    }
                }
            }
        
        ZStack {
            
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.3))
            .opacity(isSidebarVisible ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isSidebarVisible)
            .onTapGesture {
                isSidebarVisible.toggle()
            }
         
                content
                    .gesture(drag)
                    .onDisappear{
                        self.isSidebarVisible = false
                    }
                    .onAppear {
                        if UserDefaults.standard.bool(forKey: "isLogout") {
                            self.islogout = true
                            UserDefaults.standard.set(false, forKey: "isLogout")
                        }
                    }
            
            
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
    public init(isSidebarVisible: Binding<Bool>,islogout: Binding<Bool>, userName: String, userAvatar: String, userNickName: String) {
        self._isSidebarVisible = isSidebarVisible
        self.userName = userName
        self.userAvatar = userAvatar
        self.userNickName = userNickName
        self._islogout = islogout
    }
    
}
