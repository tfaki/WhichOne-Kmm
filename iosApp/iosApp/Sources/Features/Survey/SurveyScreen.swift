import SwiftUI
import shared

struct SurveyScreen: View {
    private let getSurveysModule: GetSurveysModule
    private let remoteClient: RemoteClient
    @State private var questionIndex = 0
    @State private var selectedChoice: String = ""
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
        ZStack {
            VStack(spacing: 16) {
                switch viewModel.state {
                    
                case .loading:
                    VStack {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                    }
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .center
                    )
                    
                case .error: WOErrorView(clicked: {
                    viewModel.getRingsOfPowers()
                })
                    
                case .loaded:
                    
                    WOAppBar(title: "RINGS OF POWER")
                    VStack {
                        if questionImageList.count > 0 {
                            if #available(iOS 15.0, *) {
                                AsyncImage(url: URL(string: questionImageList[questionIndex])) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                } placeholder: {
                                    Color.purple.opacity(0.1)
                                }
                                .frame(
                                    minWidth: 0,
                                    maxWidth: .infinity,
                                    minHeight: 250,
                                    maxHeight: 250
                                )
                                .cornerRadius(10)
                                .padding(EdgeInsets(top: 18, leading: 8, bottom: 0, trailing: 8))
                            } else {
                                WhichOneImage(urlString: questionImageList[questionIndex])
                            }
                            
                        }
                        
                        WOStepper(value: questionIndex, maximum: questionList.count)
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                        
                        if questionList.count > 0 {
                            Text(questionList[questionIndex].questionText ?? "")
                                .frame(
                                    minWidth: 0,
                                    maxWidth: .infinity
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color("DeepBlue"))
                                .font(.system(size: 16, weight: .heavy, design: .default))
                                .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                            
                            if questionList[questionIndex].choices!.count > 0 {
                                ForEach(questionList[questionIndex].choices!, id: \.self) { choice in
                                    WOSelectionBox(
                                        selectedChoice: self.selectedChoice,
                                        choice: choice,
                                        questionIndex: self.questionIndex,
                                        clicked: {
                                            selectedChoice = choice + String(questionIndex)
                                            if questionIndex < questionList.count - 1 {
                                                let seconds = 0.75
                                                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                                                    questionIndex += 1
                                                }
                                                
                                            } else {
                                                navigateResult = true
                                            }
                                        }
                                    )
                                    .sheet(isPresented: $navigateResult, onDismiss: {
                                        questionIndex = 0
                                        viewModel.getRingsOfPowers()
                                    }) {
                                        ResultScreen(
                                            title: $viewModel.title,
                                            imageSource: $viewModel.imageSource,
                                            description: $viewModel.description,
                                            clicked: {
                                                questionIndex = 0
                                                viewModel.getRingsOfPowers()
                                            }
                                        )
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
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 8, trailing: 8))
                }
            }
        }
        .background(Color("SolidBlue"))
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
