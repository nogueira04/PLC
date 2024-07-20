public class Game {
    private Car[] cars = new Car[0];

    public Car addCar(String id, double max_speed, double power) {
        Car newCar = new Car(id, max_speed, power);
        Car[] newCars = new Car[cars.length + 1];
        for (int i = 0; i < cars.length; i++) {
            newCars[i] = cars[i];
        }
        newCars[cars.length] = newCar;
        cars = newCars;

        return newCar;
    }

    public Car addHybridCar(String id, double max_speed, double power, String state) {
        HybridCar newCar = new HybridCar(id, max_speed, power, state);
        Car[] newCars = new Car[cars.length + 1];
        for (int i = 0; i < cars.length; i++) {
            newCars[i] = cars[i];
        }
        newCars[cars.length] = newCar;
        cars = newCars;

        return newCar;
    }


    public void removeCar(String id) throws InexistentCarException {
        Car[] newCars = new Car[cars.length - 1];
        int j = 0;
        for (int i = 0; i < cars.length; i++) {
            if (cars[i].getID().equals(id)) {
                continue;
            }
            newCars[j] = cars[i];
            j++;
        }
        if (j == cars.length) {
            throw new InexistentCarException();
        }
        cars = newCars;
    }

    public void printCars() {
        System.out.println("------ Cars -------");
        for (int i = 0; i < cars.length; i++) {
            System.out.println("Car ID: " + cars[i].getID() + " Max Speed: " + cars[i].getMaxSpeed() + " Power: " + cars[i].getPower());
        }
        System.out.println("---------------------");
    }
    
    public static void main(String[] args) throws NegativePowerException, NegativeSpeedException, InexistentCarException {
        Game game = new Game();
        Car newCar1 = game.addCar("1", 100, 100);
        game.printCars();
        newCar1.setMaxSpeed(300);
        game.printCars();

        Car newCar2 = game.addHybridCar("2", 100, 100, "terrestre");
        ((HybridCar) newCar2).transform();
    
        game.printCars();

        game.removeCar("1");

        game.printCars();

    }
}