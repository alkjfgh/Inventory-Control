package com.inventory.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.inventory.app.service.ItemService;

@Controller
public class ItemController {

	@Autowired
	private ItemService service;
}
