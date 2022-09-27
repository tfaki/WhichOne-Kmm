package com.loftymr.whichone.data

import com.loftymr.whichone.domain.model.RingsOfThePowerResponse

/**
 * Created by talhafaki on 26.09.2022.
 */
interface RemoteClient {
    suspend fun getRingsOfThePowerSurveys(): RingsOfThePowerResponse
}