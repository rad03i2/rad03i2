import java.util.ArrayList;
import java.util.List;

class Student {
    private final String name;
    private final List<Integer> grades;

    Student(String name, List<Integer> grades) {
        this.name = name;
        this.grades = grades;
    }

    double average() {
        int sum = 0;
        for (int grade : grades) {
            sum += grade;
        }
        return grades.isEmpty() ? 0 : (double) sum / grades.size();
    }

    String status() {
        return average() >= 50 ? "Passed" : "Failed";
    }

    void printReport() {
        System.out.printf("%s average: %.2f — %s%n", name, average(), status());
    }
}

public class Main {
    public static void main(String[] args) {
        List<Student> students = new ArrayList<>();
        students.add(new Student("Ali", List.of(70, 85, 90)));
        students.add(new Student("Sara", List.of(45, 40, 55)));
        students.add(new Student("Omar", List.of(60, 63, 75)));

        for (Student student : students) {
            student.printReport();
        }
    }
}
