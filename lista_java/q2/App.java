public class App {
    public static void main(String[] args) {
        AbstractForma forma = new Quadrado(5);
        System.out.println("Área do quadrado: " + forma.getArea());
        System.out.println("Perímetro do quadrado: " + forma.getPerimetro());

        forma = new Triangulo(5, 3);
        System.out.println("Área do triângulo: " + forma.getArea());
        System.out.println("Perímetro do triângulo: " + forma.getPerimetro());

        forma = new Trapezio(5, 3, 4);
        System.out.println("Área do trapézio: " + forma.getArea());
        System.out.println("Perímetro do trapézio: " + forma.getPerimetro());
    }
}