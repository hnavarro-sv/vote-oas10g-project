package com.springsource.vote.domain;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooEntity
public class Choice {

    @NotNull
    @Size(min = 1, max = 30)
    private String namingChoice;

    @Size(max = 80)
    private String description;
}
