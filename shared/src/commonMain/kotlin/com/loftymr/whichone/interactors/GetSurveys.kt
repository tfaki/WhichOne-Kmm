package com.loftymr.whichone.interactors

import com.loftymr.whichone.data.RemoteClient
import com.loftymr.whichone.domain.model.RingsOfThePowerResponse
import com.loftymr.whichone.util.CommonFlow
import com.loftymr.whichone.util.asCommonFlow
import kotlinx.coroutines.flow.flow

/**
 * Created by talhafaki on 26.09.2022.
 */

class GetSurveys(
    private val remoteClient: RemoteClient
) {
    fun execute(): CommonFlow<RingsOfThePowerResponse> = flow {
        emit(remoteClient.getRingsOfThePowerSurveys())
    }.asCommonFlow()
}