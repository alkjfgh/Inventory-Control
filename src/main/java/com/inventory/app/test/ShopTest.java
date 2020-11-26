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

import com.inventory.app.domain.ShopVO;
import com.inventory.app.service.ShopService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class ShopTest {

	@Autowired
	@Qualifier("ShopService")
	ShopService service;
	
	ShopVO vo1;
	ShopVO vo2;

	@Before
	public void setUp() {
		vo1 = new ShopVO(111L, "aaa", "seoul", "02-1111-1111");
		
		vo2 = new ShopVO(222L, "bbb", "jeju", "02-2222-2222");
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

		Iterator<ShopVO> it = service.selectList(vo1).iterator();
		while (it.hasNext()) {
			System.out.println(it.next());
		}

		vo1.setShopName("milk");
		service.update(vo1);
		assertEquals(service.select(vo1).toString(), vo1.toString());

		service.delete(vo1);
		assertEquals(service.selectCnt(), 1);
	}
}
