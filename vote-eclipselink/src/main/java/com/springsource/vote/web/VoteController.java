package com.springsource.vote.web;

import com.springsource.vote.domain.Vote;
import org.springframework.roo.addon.web.mvc.controller.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RooWebScaffold(path = "votes", formBackingObject = Vote.class)
@RequestMapping("/votes")
@Controller
public class VoteController {
}
