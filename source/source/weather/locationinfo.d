module weather.locationinfo;

import std.datetime;

struct LocationInfo {
private:
    string name_;
    string region_;
    string country_;
    string timezoneID_;
    DateTime localtime_;
public:
    string name() const {
        return name_;
    }
    string region() const {
        return region_;
    }
    string country() const {
        return country_;
    }
    string timezoneID() const {
        return timezoneID_;
    }
    DateTime localtime() const {
        return localtime_;
    }
}