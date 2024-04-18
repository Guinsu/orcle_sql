package vo;


// VO (Value Object) 값을 저장할 수 있는 데이터 타입 , DTO(Data Transfer Object) , Domain(테이블 속성 값의 범위)
// VO > DTO , Domain

// VO 작성
public class Dept {
	public int deptNo;
	public String dName;
	public String loc;
}




/*
-- 결과셋을 자바에서 VO 타입으로 처리
SELECT deptno, dname, loc FROM dept; -- dept라는 vo로 받으면 된다?
SELECT empno, ename, sal FROM emp; -- emp 라는 vo로 받으면 된다?

-- 결과셋을 자바에서 Map 타입으로 처리
SELECT deptno, dname, loc, '운영중' onoff 
FROM dept; -- vo 사용 불가능

-- 조인의 결과셋도 자바에서 Map 타입으로 받자
SELECT emp.empno, emp.ename, emp.sal, emp.deptno, dept.dname
FROM emp inner join dept 
on emp.deptno = dept.deptno ;
 
 */
