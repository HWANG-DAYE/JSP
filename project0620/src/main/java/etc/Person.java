package etc;
// 1) 기본패키지 이외의 패키지에 속해있어야 함

public class Person {
    private String name;  // private 멤버 변수(규약 2번)
    private int age;      // private 멤버 변수(규약 2번)
    private String birth;
    
    //생성자 - name, age값
    public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	//기본생성자
	public Person() {
		super();
	}

    //getter, setter , toString()
	public String getName() {
		return  "getter호출 " + name;
	}

	public void setName(String name) {
		this.name = "setter :" + name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "Person [name=" + name + ", age=" + age + ", birth=" + birth + "]";
	}
	


	
	
}