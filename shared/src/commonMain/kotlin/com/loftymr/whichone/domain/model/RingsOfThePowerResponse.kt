package com.loftymr.whichone.domain.model

import kotlinx.serialization.SerialName
import kotlinx.serialization.Serializable

/**
 * Created by talhafaki on 26.09.2022.
 */
@Serializable
data class RingsOfThePowerResponse(
    @SerialName("questions")
    val questions: List<Questions>? = null,
    @SerialName("charecter")
    val character: Character? = null,
    @SerialName("backGroundPictures")
    val backgroundPictures: List<String>? = null
)

@Serializable
data class Questions(
    @SerialName("id")
    val id: String? = null,
    @SerialName("questionText")
    val questionText: String? = null,
    @SerialName("choices")
    val choices: List<String>? = null
)

@Serializable
data class Character(
    @SerialName("title")
    val title: String? = null,
    @SerialName("srcset")
    val srcSet: SrcSet? = null,
    @SerialName("description")
    val desc: String? = null
)

@Serializable
data class SrcSet(
    @SerialName("320w")
    val threeHundred: String? = null,
    @SerialName("480w")
    val fourHundred: String? = null,
    @SerialName("650w")
    val sixHundred: String? = null,
    @SerialName("970w")
    val nineHundred: String? = null
)