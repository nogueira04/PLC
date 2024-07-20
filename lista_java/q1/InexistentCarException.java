public class InexistentCarException extends Exception {
    public InexistentCarException() {
        super("Car does not exist");
    }
}