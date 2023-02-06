module weather.forecastday;

import std.datetime;
import weather.dayinfo;
import weather.astroinfo;
import weather.forecasthourinfo;

struct ForecastDay {
private:
    int id_;
    Date date_;
    DayInfo dayInfo_;
    AstroInfo astroInfo_;
    ForecastHourInfo[] hoursInfoList_;
public:
    int id() const {
        return id_;
    }
    Date date() const {
        return date_;
    }
    DayInfo dayInfo() const {
        return dayInfo_;
    }
    AstroInfo astroInfo() const {
        return astroInfo_;
    }
    const(ForecastHourInfo[]) hoursInfoList() const {
        return hoursInfoList_;
    }
}