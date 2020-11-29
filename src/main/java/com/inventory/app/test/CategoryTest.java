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

import com.inventory.app.domain.CategoryVO;
import com.inventory.app.service.CategoryService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class CategoryTest {

	@Autowired
	@Qualifier("CategoryService")
	CategoryService service;

	CategoryVO vo1;
	CategoryVO vo2;

	@Before
	public void setUp() {
		vo1 = new CategoryVO(1, "식품");
		vo2 = new CategoryVO(2, "전자제품");
	}

	@Test
	public void test() {
		service.deleteAll();
		assertEquals(service.selectCnt(), 0);

		service.insert(vo1);
		assertEquals(service.select(vo1).toString(), vo1.toString());
		assertEquals(service.selectCnt(), 1);
		service.insert(vo2);
		assertEquals(service.select(vo2).toString(), vo2.toString());
		assertEquals(service.selectCnt(), 2);

		Iterator<CategoryVO> it = service.selectList(vo1).iterator();
		while (it.hasNext()) {
			System.out.println(it.next());
		}

		vo1.setCategoryName("조리기구");
		service.update(vo1);
		assertEquals(service.select(vo1).toString(), vo1.toString());

		service.delete(vo1);
		assertEquals(service.selectCnt(), 1);
		service.deleteAll();
	}
}
