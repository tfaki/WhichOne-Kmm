package com.loftymr.whichone.di

import com.loftymr.whichone.data.KtorClientFactory
import com.loftymr.whichone.data.RemoteClient
import com.loftymr.whichone.data.RemoteClientImpl

/**
 * Created by talhafaki on 26.09.2022.
 */

class NetworkModule {

    val remoteClient: RemoteClient by lazy {
        RemoteClientImpl(
            httpClient = KtorClientFactory().build(),
        )
    }
}