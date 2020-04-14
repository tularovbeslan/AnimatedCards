import Foundation
import Combine

class UserStore: ObservableObject {
    
    @Published var users: [UserElement] = []

    private let publisher = CurrentValueSubject<URL?, Never>(Bundle.main.url(forResource: "collapse", withExtension: "json"))
    private var cancellable = Set<AnyCancellable>()
    
    func loadUsers() {
        self.cancellable.insert(
            self.publisher
                .compactMap { $0 }
                .tryMap { try Data(contentsOf: $0) }
                .decode(type: [UserElement].self, decoder: JSONDecoder())
                .mapError { error in fatalError("\(error)") }
                .receive(on: RunLoop.main)
                .print()
                .sink {
                    self.users = $0
            }
        )
    }
    
    init() {
        loadUsers()
    }
    
    deinit {
        cancellable.forEach { item in
            item.cancel()
        }
    }
}
