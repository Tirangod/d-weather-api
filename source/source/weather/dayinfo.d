module weather.dayinfo;

import weather.measureunits;

struct DayInfo {
private:
    Temperature maxTemp_;
    Temperature minTemp_;
    Temperature averageTemp_;
    Speed windSpeed_;
    Length totalPrecipitate_;
    Length totalSnow_;
    Length totalVisibility_;
    float averageHumidity_;
    bool willItRain_;
    int chanceOfRain_;
    bool willItSnow_;
    int chanceOfSnow_;
    string description_;
public:
    Temperature maxTemp() const {
        return maxTemp_;
    }
    Temperature minTemp() const {
        return minTemp_;
    }
    Temperature averageTemp() const {
        return averageTemp_;
    }
    Speed windSpeed() const {
        return windSpeed_;
    }
    Length totalPrecipitate() const {
        return totalPrecipitate_;
    }
    Length totalSnow() const {
        return totalSnow_;
    }
    Length totalVisibility() const {
        return totalVisibility_;
    }
    float averageHumidity() const {
        return averageHumidity_;
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
    string description() const {
        return description_;
    }
}

unittest {
    alias celsisus = Temperature.asCelsius;

    auto testDayInfo = DayInfo(
        celsisus(100),
        celsisus(-100),
        celsisus(0),
        Speed.asKmph(100),
        Length.asMeters(0.5),
        Length.asMeters(0.5),
        Length.asKilometers(10),
        80,
        false,
        10,
        false,
        10,
        "Some description"
    );

    assert(testDayInfo.minTemp == 100, "minTemp");
}