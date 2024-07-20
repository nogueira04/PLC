public class Car {
    private String ID;
    private double max_speed, power;
    
    public Car(String ID, double max_speed, double power) {
        this.ID = ID;
        this.max_speed = max_speed;
        this.power = power;
    }

    public String getID() {
        return ID;
    }

    public double getMaxSpeed() {
        return max_speed;
    }

    public double getPower() {
        return power;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public void setMaxSpeed(double max_speed) throws NegativeSpeedException {
        if (max_speed < 0) {
            throw new NegativeSpeedException();
        }
        this.max_speed = max_speed;
    }

    public void setPower(double power) throws NegativePowerException {
        if (power < 0) {
            throw new NegativePowerException();
        }
        this.power = power;
    }
}