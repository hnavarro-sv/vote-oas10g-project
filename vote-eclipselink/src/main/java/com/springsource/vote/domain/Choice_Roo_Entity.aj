// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.vote.domain;

import com.springsource.vote.domain.Choice;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Choice_Roo_Entity {
    
    declare @type: Choice: @Entity;
    
    @PersistenceContext
    transient EntityManager Choice.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Choice.id;
    
    @Version
    @Column(name = "version")
    private Integer Choice.version;
    
    public Long Choice.getId() {
        return this.id;
    }
    
    public void Choice.setId(Long id) {
        this.id = id;
    }
    
    public Integer Choice.getVersion() {
        return this.version;
    }
    
    public void Choice.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Choice.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Choice.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Choice attached = Choice.findChoice(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Choice.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Choice.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Choice Choice.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Choice merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Choice.entityManager() {
        EntityManager em = new Choice().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Choice.countChoices() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Choice o", Long.class).getSingleResult();
    }
    
    public static List<Choice> Choice.findAllChoices() {
        return entityManager().createQuery("SELECT o FROM Choice o", Choice.class).getResultList();
    }
    
    public static Choice Choice.findChoice(Long id) {
        if (id == null) return null;
        return entityManager().find(Choice.class, id);
    }
    
    public static List<Choice> Choice.findChoiceEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Choice o", Choice.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
