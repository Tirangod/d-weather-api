module weather.measureunits;

struct Temperature {
private:
    float value_; //Kelvin
public:
    static Temperature asKelvin(float value) {
        return Temperature(value);
    }
    static Temperature asCelsius(float value) {
        return Temperature(value + 273.15);
    }
    static Temperature asFahrenheit(float value) {
        return Temperature((value - 32.0)*(5.0/9.0) + 273.15);
    }

    float getKelvin() const {
        return value_;
    }
    float getCelsius() const {
        return value_ - 273.15;
    }
    float getFahrenheit() const {
        return (value_ - 273.15)*(9.0/5.0) + 32.0;
    }
}

struct Speed {
private:
    float value_; //kmh
public:
    static Speed asKmph(float value) {
        return Speed(value);
    }
    static Speed asMph(float value) {
        return Speed(value / 0.621371192);
    }

    float getKmph() const {
        return value_;
    }
    float getMph() const {
        return value_ * 0.621371192;
    }
}

struct Length {
private:
    float value_; //m
public:
    static Length asKilometers(float value) {
        return Length(value * 1000.0);
    }
    static Length asCantimeters(float value) {
        return Length(value / 100.0);
    }
    static Length asMilimeters(float value) {
        return Length(value / 1000.0);
    }
    static Length asMeters(float value) {
        return Length(value);
    }
    static Length asInches(float value) {
        return Length(value / 0.0254);
    }

    float getKilometers() const {
        return value_ / 1000.0;
    }
    float getCantimeters() const {
        return value_ * 100.0;
    }
    float getMilimeters() const {
        return value_ * 1000.0;
    }
    float getMeters() const {
        return value_;
    }
    float getInches() const {
        return value_ * 0.0254;
    }
}

