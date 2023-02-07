import weather.api;

import std.stdio;
import weather.api;

import weather.timeutils;
import std.datetime;

void main() {
    auto api = WeatherAPI("fdf746bda16d40bba3680826230102");
    api.doRequest("Luxemburg", 2);
    writeln(api.forecastDays[1]);
}