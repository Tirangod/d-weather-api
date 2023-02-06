module weather.api;

import std.string;
import std.format;
import std.stdio;
import std.conv;
import std.json;
import std.datetime;
import std.exception;

import requests;

import weather.astroinfo;
import weather.dayinfo;
import weather.forecastday;
import weather.forecasthourinfo;
import weather.locationinfo;
import weather.measureunits;
import weather.timeutils;

struct WeatherAPI {
private:
    class WeatherAPIException : Exception {
        this(in string msg = "") {
            super("Weather API Exception: " ~ msg);
        }
    }

    static const string formattedRequestString = "http://api.weatherapi.com/v1/forecast.json?key=%s&q=%s&days=%d&aqi=no&alerts=no";

    const string key_;
    JSONValue baseElement_;
    LocationInfo location_;
    ForecastDay[] forecast_;

public:
    this(in string key,  int days = 1) {
        this.key_ = key;
    }

    void doRequest(in string country = "Luxemburg", int days = 1) {
        string req = format(formattedRequestString, key_, country, days);
        
        try {
            auto data = cast(string) getContent(req).data();
            baseElement_ = parseJSON(data);
            parse();
        } catch (Exception e) {
            stderr.writeln(e);
        }
    }

    private void parse() {
        alias el = baseElement_;

        auto locEl = el["location"];

        location_ = LocationInfo(
            locEl["name"].str,
            locEl["region"].str,
            locEl["country"].str,
            locEl["tz_id"].str,
            dateTimeFromISOExtString(locEl["localtime"].str)
        );

        auto forecasts = el["forecast"]["forecastday"];
        
        foreach (id, forecast; forecasts.array) {

            ForecastHourInfo[] forecastHours;
            foreach (key, info; forecast["hour"].array) {
                auto forecastHour = ForecastHourInfo(
                    dateTimeFromISOExtString(info["time"].str),
                    Temperature.asCelsius(info["temp_c"].floating),
                    to!bool(info["is_day"].integer),
                    info["condition"]["text"].str,
                    Speed.asKmph(info["wind_kph"].floating),
                    cast(int) info["wind_degree"].integer,
                    info["wind_dir"].str,
                    to!int(info["pressure_mb"].floating),
                    Length.asMilimeters(info["precip_mm"].floating),
                    cast(int) info["humidity"].integer,
                    cast(int) info["cloud"].integer,
                    Temperature.asCelsius(info["feelslike_c"].floating),
                    Temperature.asCelsius(info["windchill_c"].floating),
                    to!bool(info["will_it_rain"].integer),
                    cast(int) info["chance_of_rain"].integer,
                    to!bool(info["will_it_snow"].integer),
                    cast(int) info["chance_of_snow"].integer,
                    Length.asKilometers(info["vis_km"].floating),
                    Speed.asKmph(info["gust_kph"].floating)
                );
                forecastHours ~= forecastHour;
            }

            forecast_ ~= ForecastDay(
                cast(int) id,
                Date.fromISOExtString(forecast["date"].str),
                DayInfo(
                    Temperature.asCelsius(forecast["day"]["maxtemp_c"].floating),
                    Temperature.asCelsius(forecast["day"]["mintemp_c"].floating),
                    Temperature.asCelsius(forecast["day"]["avgtemp_c"].floating),
                    Speed.asKmph(forecast["day"]["maxwind_kph"].floating),
                    Length.asMilimeters(forecast["day"]["totalprecip_mm"].floating),
                    Length.asCantimeters(forecast["day"]["totalsnow_cm"].floating),
                    Length.asKilometers(forecast["day"]["avgvis_km"].floating),
                    forecast["day"]["avghumidity"].floating,
                    to!bool(forecast["day"]["daily_will_it_rain"].integer),
                    cast(int) forecast["day"]["daily_chance_of_rain"].integer,
                    to!bool(forecast["day"]["daily_will_it_snow"].integer),
                    cast(int) forecast["day"]["daily_chance_of_snow"].integer,
                    forecast["day"]["condition"]["text"].str
                ),
                AstroInfo(
                    timeOfDayFromHHMMXM(forecast["astro"]["sunrise"].str),
                    timeOfDayFromHHMMXM(forecast["astro"]["sunset"].str),
                    timeOfDayFromHHMMXM(forecast["astro"]["moonrise"].str),
                    timeOfDayFromHHMMXM(forecast["astro"]["moonset"].str),
                    forecast["astro"]["moon_phase"].str,
                    forecast["astro"]["moon_illumination"].str,
                    to!bool(forecast["astro"]["is_moon_up"].integer),
                    to!bool(forecast["astro"]["is_sun_up"].integer)
                ),
                forecastHours
            );
        }
    }

    JSONValue opIndex(string index) {
        return baseElement_[index];
    }

    LocationInfo locationInfo() const {
        return location_;
    }

    const(ForecastDay[]) forecastDays() {
        return forecast_;
    }

    string key() const {
        return key_;
    }

    string toString() const {
        return (cast(string) forecast_);
    }
}

