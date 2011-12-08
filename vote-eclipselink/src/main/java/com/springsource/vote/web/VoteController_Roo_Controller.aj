// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.vote.web;

import com.springsource.vote.domain.Choice;
import com.springsource.vote.domain.Vote;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect VoteController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String VoteController.create(@Valid Vote vote, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("vote", vote);
            addDateTimeFormatPatterns(uiModel);
            return "votes/create";
        }
        uiModel.asMap().clear();
        vote.persist();
        return "redirect:/votes/" + encodeUrlPathSegment(vote.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String VoteController.createForm(Model uiModel) {
        uiModel.addAttribute("vote", new Vote());
        addDateTimeFormatPatterns(uiModel);
        return "votes/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String VoteController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("vote", Vote.findVote(id));
        uiModel.addAttribute("itemId", id);
        return "votes/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String VoteController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("votes", Vote.findVoteEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Vote.countVotes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("votes", Vote.findAllVotes());
        }
        addDateTimeFormatPatterns(uiModel);
        return "votes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String VoteController.update(@Valid Vote vote, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("vote", vote);
            addDateTimeFormatPatterns(uiModel);
            return "votes/update";
        }
        uiModel.asMap().clear();
        vote.merge();
        return "redirect:/votes/" + encodeUrlPathSegment(vote.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String VoteController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("vote", Vote.findVote(id));
        addDateTimeFormatPatterns(uiModel);
        return "votes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String VoteController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Vote.findVote(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/votes";
    }
    
    @ModelAttribute("choices")
    public Collection<Choice> VoteController.populateChoices() {
        return Choice.findAllChoices();
    }
    
    @ModelAttribute("votes")
    public Collection<Vote> VoteController.populateVotes() {
        return Vote.findAllVotes();
    }
    
    void VoteController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("vote_registered_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    String VoteController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
