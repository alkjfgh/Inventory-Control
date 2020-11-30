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

import com.inventory.app.domain.ItemVO;
import com.inventory.app.service.ItemService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class ItemTest {
	
	@Autowired
	@Qualifier("ItemService")
	ItemService service;
	
	ItemVO vo1;
	ItemVO vo2;

	@Before
	public void setUp() {
//		vo1 = new ItemVO(111L, 1L, "water", 1000L, "JEJU");
//		vo2 = new ItemVO(222L, 2L, "milk", 2000L, "SEOUL");
	}

	@Test
	public void test() {
		service.deleteAll();
		assertEquals(service.selectCnt() , 0);

		service.insert(vo1);
		assertEquals(service.select(vo1).toString(), vo1.toString());
		assertEquals(service.selectCnt(), 1);
		service.insert(vo2);
		assertEquals(service.select(vo2).toString(), vo2.toString());
		assertEquals(service.selectCnt(), 2);

		Iterator<ItemVO> it = service.selectList(vo1).iterator();
		while (it.hasNext()) {
			System.out.println(it.next());
		}

		vo1.setItemName("milk");
		service.update(vo1);
		assertEquals(service.select(vo1).toString(), vo1.toString());

		service.delete(vo1);
		assertEquals(service.selectCnt(), 1);
	}
}
