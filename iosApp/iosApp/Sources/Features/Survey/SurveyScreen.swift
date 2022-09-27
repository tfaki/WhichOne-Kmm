import SwiftUI
import shared

struct SurveyScreen: View {
    private let getSurveysModule: GetSurveysModule
    private let remoteClient: RemoteClient
    @State private var questionIndex = 0
    @State private var selectedChoice: String?
    @State private var navigateResult: Bool = false
    
    @ObservedObject var viewModel: SurveyViewModel
    
    init(remoteClient: RemoteClient) {
        self.remoteClient = remoteClient
        self.getSurveysModule = GetSurveysModule(
            remoteClient: self.remoteClient
        )
        self.viewModel = SurveyViewModel(
            getSurveys: getSurveysModule.getSurveys
        )
    }
    
    var body: some View {
        let questionList = viewModel.questions
        let questionImageList = viewModel.backgroundPictures
        let bgColor = Color(0xFF3552A2)
        let transparent = Color(0xFFFFFFFFF)
        let DeepBlue = Color(0xFF005A70)
        ZStack {
            VStack(spacing: 16) {
                if questionImageList.count > 0 {
                    CustomImageView(urlString: questionImageList[questionIndex])
                }
                
                if questionList.count > 0 {
                    Text(questionList[questionIndex].questionText ?? "")
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.black)
                        .font(.system(size: 16, weight: .heavy, design: .default))
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                    
                    if questionList[questionIndex].choices!.count > 0 {
                        ForEach(questionList[questionIndex].choices!, id: \.self) { choice in
                            Button(action: {
                                selectedChoice = choice + String(questionIndex)
                                if questionIndex < questionList.count - 1 {
                                    questionIndex += 1
                                } else {
                                    navigateResult = true
                                }
                            }){
                                Text(choice)
                                    .frame(
                                        maxWidth: .infinity
                                    )
                                    .padding()
                                    .foregroundColor(self.selectedChoice == choice + String(questionIndex) ? Color.white : Color.black)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(bgColor, lineWidth: 2))
                                
                            }
                            .background(self.selectedChoice == choice + String(questionIndex) ? DeepBlue: transparent)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 4, trailing: 8))
                            .sheet(isPresented: $navigateResult, onDismiss: {
                                questionIndex = 0
                                viewModel.getRingsOfPowers()
                            }) {
                                ResultScreen(title: $viewModel.title, imageSource: $viewModel.imageSource, description: $viewModel.description)
                            }
                        }
                    }
                }
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius:10))
            .padding(EdgeInsets(top: 56, leading: 8, bottom: 8, trailing: 8))
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .background(bgColor)
    }
}

extension Color {
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: alpha
        )
    }
}

struct CustomImageView: View {
    var urlString: String
    @ObservedObject var imageLoader = ImageLoaderService()
    @State var image: UIImage = UIImage()
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .shadow(radius: 10)
                .aspectRatio(contentMode: .fill)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity
                )
                .onReceive(imageLoader.$image) { image in
                    self.image = image
                }
                .onAppear {
                    imageLoader.loadImage(for: urlString)
                }
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 250,
            maxHeight: 250
        )
        .clipShape(RoundedRectangle(cornerRadius:10))
        .padding(EdgeInsets(top: 18, leading: 8, bottom: 0, trailing: 8))
        
    }
}

class ImageLoaderService: ObservableObject {
    @Published var image: UIImage = UIImage()
    
    func loadImage(for urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data) ?? UIImage()
            }
        }
        task.resume()
    }
    
}
