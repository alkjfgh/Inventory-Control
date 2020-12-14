package com.inventory.app.test;

import static org.junit.Assert.assertEquals;

import java.util.Iterator;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.inventory.app.domain.CategoryVO;
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
			service.insert(new SoldLogVO(i, i, 1, 1, 1));
			assertEquals(service.selectCnt(), i * 2);
		}
		
		System.out.println("==============");
		SoldLogVO voTest = new SoldLogVO(0, 0, 1, 0, 0);
		voTest.setWeek(5);
		voTest.setMonth(2);
		voTest.setStart(10);
		voTest.setEnd(27);
		
		Iterator<CategoryVO> categoryIt = service.selectCategoryList(voTest).iterator();
		while(categoryIt.hasNext())
			System.out.println(categoryIt.next());
		
		categoryIt = service.selectCategoryWeek(voTest).iterator();
		while(categoryIt.hasNext())
			System.out.println(categoryIt.next());
		
		categoryIt = service.selectCategoryMonth(voTest).iterator();
		while(categoryIt.hasNext())
			System.out.println(categoryIt.next());
		
		categoryIt = service.selectCategoryPeriod(voTest).iterator();
		while(categoryIt.hasNext())
			System.out.println(categoryIt.next());
		System.out.println("==============");

		SoldLogVO vo = new SoldLogVO(5, 5, 1, 1, 1);
		assertEquals(service.select(vo).toString(), vo.toString());
	
		assertEquals(service.selectList(null).size(), 70);

		assertEquals(service.selectCnt(), 70);
		
		vo.setWeek(5);
		assertEquals(service.selectWeek(vo), 224l);
		
		vo.setMonth(2);
		assertEquals(service.selectMonth(vo), 1365l);

		assertEquals(service.selectMaxCount(), 70l);
	}
}
