package com.inventory.app.test;

import static org.junit.Assert.assertEquals;

import java.util.Iterator;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.inventory.app.domain.UserVO;
import com.inventory.app.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class UserTest {

	@Autowired
	@Qualifier("UserService")
	UserService service;

	UserVO vo1;
	UserVO vo2;

	@Before
	public void setUp() {
		vo1 = new UserVO("ccc", "ccc@naver.com", "02-3333-3333", "123", 333L, "ccc", "ccc", (short) 1);
		vo2 = new UserVO("ddd", "ddd@naver.com", "02-4444-4444", "123", 444L, "ddd", "ddd", (short) 1);
	}

	@Test
	public void test() {
		service.deleteAll();
		assertEquals(service.selectCnt(), 0);

		service.insert(vo1);
		vo1.setUserRegdate(service.select(vo1).getUserRegdate());
		assertEquals(service.select(vo1).toString(), vo1.toString());
		assertEquals(service.selectCnt(), 1);
		service.insert(vo2);
		vo2.setUserRegdate(service.select(vo2).getUserRegdate());
		assertEquals(service.select(vo2).toString(), vo2.toString());
		assertEquals(service.selectCnt(), 2);

		Iterator<UserVO> it = service.selectList(vo1).iterator();
		while (it.hasNext()) {
			System.out.println(it.next());
		}

		vo1.setUserName("milk");
		service.update(vo1);
		vo1.setUserRegdate(service.select(vo1).getUserRegdate());
		assertEquals(service.select(vo1).toString(), vo1.toString());

		service.delete(vo1);
		assertEquals(service.selectCnt(), 1);
	}
}
