module weather.forecasthourinfo;

import std.datetime;
import weather.measureunits;

struct ForecastHourInfo {
private:
    DateTime time_;
    Temperature temp_;
    bool isDay_;
    string description_;
    Speed windSpeed_;
    int windDegree_;
    string windDirection_;
    int pressure_; // TODO: add Pressure measure unit struct
    Length precipitate_;
    int humidity_;
    int cloud_;
    Temperature feelsLikeTemp_;
    Temperature windChillTemp_;
    bool willItRain_;
    int chanceOfRain_;
    bool willItSnow_;
    int chanceOfSnow_;
    Length visibility_;
    Speed gustSpeed_;
public:
    DateTime time() const {
        return time_;
    }
    Temperature temp() const {
        return temp_;
    }
    bool isDay() const {
        return isDay_;
    }
    string description() const {
        return description_;
    }
    Speed windSpeed() const {
        return windSpeed_;
    }
    int windDegree() const {
        return windDegree_;
    }
    string windDirection() const {
        return windDirection_;
    }
    int pressure() const {
        return pressure_;
    }
    Length precipitate() const {
        return precipitate_;
    }
    int humidity() const {
        return humidity_;
    }
    int cloud() const {
        return cloud_;
    }
    Temperature feelsLikeTemp() const {
        return feelsLikeTemp_;
    }
    Temperature windChillTemp() const {
        return windChillTemp_;
    }
    bool willItRain() const {
        return willItRain_;
    }
    int chanceOfRain() const {
        return chanceOfRain_;
    }
    bool willItSnow() const {
        return willItSnow_;
    }
    int chanceOfSnow() const {
        return chanceOfSnow_;
    }
    Length visibility() const {
        return visibility_;
    }
    Speed gustSpeed() const {
        return gustSpeed_;
    }
}