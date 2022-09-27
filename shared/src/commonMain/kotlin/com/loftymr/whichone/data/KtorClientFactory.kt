package com.loftymr.whichone.data

import io.ktor.client.HttpClient

/**
 * Created by talhafaki on 26.09.2022.
 */
expect class KtorClientFactory {
    fun build(): HttpClient
}