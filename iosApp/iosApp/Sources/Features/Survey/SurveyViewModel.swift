//
//  SurveyViewModel.swift
//  iosApp
//
//  Created by Talha Faki on 26.09.2022.
//  Copyright © 2022 orgName. All rights reserved.
//

import Foundation
import Combine
import shared

class SurveyViewModel : ObservableObject {

    let getSurveys: GetSurveys
        
    // State
    @Published var questions = [Questions]()
    @Published var backgroundPictures = [String]()
    @Published var title: String = ""
    @Published var imageSource: String = ""
    @Published var description: String = ""
    
    init(getSurveys: GetSurveys) {
        self.getSurveys = getSurveys
        getRingsOfPowers()
    }
    
    func getRingsOfPowers() {
            do {
                try getSurveys.execute().collectCommon(
                    coroutineScope: nil,
                    callback: { dataState in
                        self.questions = (dataState?.questions)!
                        self.title = (dataState?.character?.title)!
                        self.description = (dataState?.character?.desc)!
                        self.imageSource = (dataState?.character?.srcSet?.nineHundred)!
                        self.backgroundPictures = (dataState?.backgroundPictures) as! [String]
                    }
                )
            }catch{
            
            }
        }
}
