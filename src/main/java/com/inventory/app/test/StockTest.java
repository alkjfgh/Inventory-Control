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

import com.inventory.app.domain.StockVO;
import com.inventory.app.service.StockService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class StockTest {
	@Autowired
	@Qualifier("StockService")
	StockService service;
	StockVO vo1;
	StockVO vo2;

	@Before
	public void setUp() {
		vo1 = new StockVO(1l, 111l, 5l, 0l, 0l, 0l);
		vo2 = new StockVO(2l, 222l, 10l, 5l, 0l, 5l);
	}

	@Test
	public void test() {
		service.deleteAll();
		assertEquals(service.selectCnt() , 0);

		service.insert(vo1);
		vo1.setNecessity(5);
		assertEquals(service.select(vo1).toString(), vo1.toString());
		assertEquals(service.selectCnt(), 1);
		service.insert(vo2);
		vo2.setNecessity(5);
		assertEquals(service.select(vo2).toString(), vo2.toString());
		assertEquals(service.selectCnt(), 2);

		Iterator<StockVO> it = service.selectList(vo1).iterator();
		while (it.hasNext()) {
			System.out.println(it.next());
		}

		vo1.setItemSeq(111L);
		service.update(vo1);
		assertEquals(service.select(vo1).toString(), vo1.toString());

		service.delete(vo1);
		assertEquals(service.selectCnt(), 1);
	}
}
