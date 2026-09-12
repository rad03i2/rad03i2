fn celsius_to_fahrenheit(celsius: f64) -> f64 {
    celsius * 9.0 / 5.0 + 32.0
}

fn kilometers_to_miles(kilometers: f64) -> f64 {
    kilometers * 0.621371
}

fn main() {
    let temperature = 25.0;
    let distance = 10.0;

    println!("{temperature}°C = {:.2}°F", celsius_to_fahrenheit(temperature));
    println!("{distance} km = {:.2} miles", kilometers_to_miles(distance));
}
