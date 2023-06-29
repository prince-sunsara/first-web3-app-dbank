import Debug "mo:base/Debug";
import Float "mo:base/Float";
import Time "mo:base/Time";

actor DBank {
  stable var currentValue: Float = 300;
  // currentValue := 100;
  // Debug.print(debug_show (currentValue));

  var startTime = Time.now();
  // Debug.print(debug_show (startTime));


  public func topUp(amount : Float) {
    currentValue += amount;
    // Debug.print(debug_show (currentValue));
  };

  public func withdraw(amount : Float) {
    if (currentValue - amount >= 0) {
      currentValue -= amount;
      // Debug.print(debug_show (currentValue));
    } else {
      Debug.print("Amount too large, currentValue less then zero.");
    };
  };

  public query func checkBalance(): async Float {
    // Debug.print(debug_show (currentValue));
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS/1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }
};
