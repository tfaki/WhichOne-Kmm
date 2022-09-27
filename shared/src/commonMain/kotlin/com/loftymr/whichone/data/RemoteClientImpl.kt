package com.loftymr.whichone.data

import com.loftymr.whichone.domain.model.RingsOfThePowerResponse
import io.ktor.client.HttpClient
import io.ktor.client.*
import io.ktor.client.request.*
/**
 * Created by talhafaki on 26.09.2022.
 */

class RemoteClientImpl(private val httpClient: HttpClient): RemoteClient {
    override suspend fun getRingsOfThePowerSurveys(): RingsOfThePowerResponse {
        return httpClient.get(
            ENDPOINT
        )
    }
}