import SwiftUI

struct ContentView: View {
    
    @ObservedObject var store: UserStore
    @State var translation = CGSize.zero

    var body: some View {
        VStack {
            ZStack {
                DraggableView(user: store.users[2])
                    .frame(width: 200, height: 150, alignment: .center)
                    .background(Color.red)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .scaleEffect(0.8)
                    .offset(x: self.translation.width / 6, y: (self.translation.height / 6) + 40)
                    .rotation3DEffect(Angle(degrees: Double(self.translation.width / 10)), axis: (x: 0, y: 30, z: 10))
                
                DraggableView(user: store.users[1])
                    .frame(width: 200, height: 150, alignment: .center)
                    .background(Color.green)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .scaleEffect(0.9)
                    .offset(x: self.translation.width / 2, y: (self.translation.height / 2) + 20)
                    .rotation3DEffect(Angle(degrees: Double(self.translation.width / 10)), axis: (x: 0, y: 30, z: 10))
                
                DraggableView(user: store.users[0])
                    .frame(width: 200, height: 150, alignment: .center)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .offset(x: self.translation.width, y: self.translation.height)
                    .rotation3DEffect(Angle(degrees: Double(self.translation.width / 10)), axis: (x: 0, y: 30, z: 10))
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                print(value)
                                self.translation = value.translation
                            }
                        .onEnded{ value in
                            self.translation = .zero
                        }
                    )
            }
            .animation(.spring(response: 0.3, dampingFraction: 0.4, blendDuration: 0))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: UserStore())
    }
}
