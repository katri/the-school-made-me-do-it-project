// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.i377.team29.entities;

import ee.itcollege.i377.team29.entities.Seaduse_punkt;
import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Seaduse_punkt_Roo_Entity {
    
    @PersistenceContext
    transient EntityManager Seaduse_punkt.entityManager;
    
    @Version
    @Column(name = "version")
    private Integer Seaduse_punkt.version;
    
    public Integer Seaduse_punkt.getVersion() {
        return this.version;
    }
    
    public void Seaduse_punkt.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void Seaduse_punkt.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Seaduse_punkt.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Seaduse_punkt attached = Seaduse_punkt.findSeaduse_punkt(this.seaduse_punkt_ID);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Seaduse_punkt.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Seaduse_punkt.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Seaduse_punkt Seaduse_punkt.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Seaduse_punkt merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager Seaduse_punkt.entityManager() {
        EntityManager em = new Seaduse_punkt().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Seaduse_punkt.countSeaduse_punkts() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Seaduse_punkt o", Long.class).getSingleResult();
    }
    
    public static List<Seaduse_punkt> Seaduse_punkt.findAllSeaduse_punkts() {
        return entityManager().createQuery("SELECT o FROM Seaduse_punkt o", Seaduse_punkt.class).getResultList();
    }
    
    public static Seaduse_punkt Seaduse_punkt.findSeaduse_punkt(Long seaduse_punkt_ID) {
        if (seaduse_punkt_ID == null) return null;
        return entityManager().find(Seaduse_punkt.class, seaduse_punkt_ID);
    }
    
    public static List<Seaduse_punkt> Seaduse_punkt.findSeaduse_punktEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Seaduse_punkt o", Seaduse_punkt.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
