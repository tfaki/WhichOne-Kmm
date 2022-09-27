package com.loftymr.whichone

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform