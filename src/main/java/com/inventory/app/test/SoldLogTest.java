package com.inventory.app.test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.inventory.app.domain.SoldLogVO;
import com.inventory.app.service.SoldLogService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class SoldLogTest {

	@Autowired
	@Qualifier("SoldLogService")
	SoldLogService service;

	@Test
	public void test() {
		service.deleteAll();
		assertEquals(service.selectCnt(), 0);

		for (int i = 1; i <= 70; i++) {
			service.insert(new SoldLogVO(i, i, 1, 1, 1));
			assertEquals(service.selectCnt(), i);
		}

		SoldLogVO vo = new SoldLogVO(5, 5, 1, 1, 1);
		assertEquals(service.select(vo).toString(), vo.toString());
	
		assertEquals(service.selectList(null).size(), 70);

		assertEquals(service.selectCnt(), 70);
		
		vo.setWeek(5);
		assertEquals(service.selectWeek(vo), 224l);
		
		vo.setMonth(2);
		assertEquals(service.selectMonth(vo), 1365l);

		assertEquals(service.selectMaxCount(), 70l);
		
		service.deleteAll();
	}
}
