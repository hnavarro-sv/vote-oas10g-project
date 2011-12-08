package com.springsource.vote.web;

import com.springsource.vote.domain.Choice;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "choices", formBackingObject = Choice.class)
@RequestMapping("/choices")
@Controller
public class ChoiceController {
}
