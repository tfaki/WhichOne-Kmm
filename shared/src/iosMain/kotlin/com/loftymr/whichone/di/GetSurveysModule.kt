package com.loftymr.whichone.di

import com.loftymr.whichone.data.RemoteClient
import com.loftymr.whichone.interactors.GetSurveys

/**
 * Created by talhafaki on 26.09.2022.
 */
class GetSurveysModule(remoteClient: RemoteClient) {

    val getSurveys: GetSurveys by lazy {
        GetSurveys(remoteClient = remoteClient)
    }
}