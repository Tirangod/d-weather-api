module weather.astroinfo;

import std.datetime;

struct AstroInfo {
private:
    TimeOfDay sunriseTime_;
    TimeOfDay sunsetTime_;
    TimeOfDay moonriseTime_;
    TimeOfDay moonsetTime_;
    string moonPhase_;
    string moonIllumination_;
    bool isSunUp_;
    bool isMoonUp_;
public:
    TimeOfDay sunriseTime() const {
        return sunriseTime_;
    }
    TimeOfDay sunsetTime() const {
        return sunsetTime_;
    }
    TimeOfDay moonriseTime() const {
        return moonriseTime_;
    }
    TimeOfDay moonsetTime() const {
        return moonsetTime_;
    }
    string moonPhase() const {
        return moonPhase_;
    }
    string moonIllumination() const {
        return moonIllumination_;
    }
    bool isSunUp() const {
        return isSunUp_;
    }
    bool isMoonUp() const {
        return isMoonUp_;
    }
}