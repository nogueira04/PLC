public class HybridCar extends Car {
    private String state;

    public HybridCar(String ID, double max_speed, double power, String state) {
        super(ID, max_speed, power);
        this.state = state;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        if (state.equals("terrestre") || state.equals("aquatico")) {
            this.state = state;
        }
    }

    public void transform() {
        if (state.equals("terrestre")) {
            state = "aquatico";
        } else {
            state = "terrestre";
        }
    }
}