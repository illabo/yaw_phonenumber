package app.illabo.yaw_phonenumber

import android.content.Context
import android.os.Build
import io.michaelrocks.libphonenumber.android.PhoneNumberUtil
import java.util.*

class YawPhonenumber(private val ctx: Context) {
    val phoneUtil = PhoneNumberUtil.createInstance(ctx)

    fun formatIncomplete(string: String): String {
        val locale = getCurrentLocale(ctx)
        val ayt = phoneUtil.getAsYouTypeFormatter(locale.country)
        var formated =""
        string.forEach {
            formated = ayt.inputDigit(it)
        }

        return formated
    }

    fun formatAsInternational(string: String): String{
        val locale = getCurrentLocale(ctx)
        val finalPhone = try {
            phoneUtil.parse(string, locale.country)
        } catch (t: Throwable) {
            return string
        }
        return phoneUtil.format(
                finalPhone,
                PhoneNumberUtil
                .PhoneNumberFormat
                .INTERNATIONAL)
    }

    fun isValidNumber(string: String): Boolean{
        val locale = getCurrentLocale(ctx)
        val finalPhone = try {
            phoneUtil.parse(string, locale.country)
        } catch (t: Throwable) {
            return false
        }
        return phoneUtil.isValidNumber(finalPhone)
    }

    fun isInternationallyDialable(string: String): Boolean{
        val locale = getCurrentLocale(ctx)
        val finalPhone = try {
            phoneUtil.parse(string, locale.country)
        } catch (t: Throwable) {
            return false
        }
        return phoneUtil.canBeInternationallyDialled(finalPhone)
    }

    private fun getCurrentLocale(context: Context): Locale {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            return context.resources.configuration.locales.get(0)
        } else {
            @Suppress("DEPRECATION")
            return context.resources.configuration.locale
        }
    }
}