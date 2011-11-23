package ee.itcollege.i377.team29.generic;
import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;

import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreRemove;
import javax.persistence.PreUpdate;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.context.SecurityContextHolder;

@MappedSuperclass
public abstract class AbstractEntity implements Serializable {
	// test
	private static final long serialVersionUID = 1L;
	
	@Size(min = 0, max = 255)
	private String kommentaar;
	
	@NotNull
	@Size(min = 0, max = 32)
	private String avaja;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@NotNull
	private Date avatud;
	
	@Size(min = 0, max = 32)
	private String sulgeja;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@NotNull
	private Date suletud;
	
	@NotNull
	@Size(min = 0, max = 32)
	private String muutja;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@NotNull
	private Date muudetud;
	
    @PrePersist
    public void recordCreated() {
    	Date currentDate = new Date();
        setAvatud(currentDate);
        setMuudetud(currentDate);
        
        String author = SecurityContextHolder.getContext().getAuthentication().getName();
        setAvaja(author);
        setMuutja(author);
        
        Calendar surrogate = Calendar.getInstance();
        surrogate.set(9999, Calendar.JANUARY, 1);
        setSuletud(surrogate.getTime());
    }

    @PreUpdate
    public void recordModified() {
        setMuudetud(new Date());
        setMuutja(SecurityContextHolder.getContext().getAuthentication().getName());
    }

    @PreRemove
    public void preventRemove() {
        throw new SecurityException("Permanent deletion of entities is not permitted! Didn't you read the requirements @Moodle ??");
    }
    
    /* Getters/Setters ******************************************************************************************************************/
    
	public String getKommentaar() {
		return kommentaar;
	}
	
	public void setKommentaar(String kommentaar) {
		this.kommentaar = kommentaar;
	}
	
	public String getAvaja() {
		return avaja;
	}

	public void setAvaja(String avaja) {
		this.avaja = avaja;
	}

	public Date getAvatud() {
		return avatud;
	}

	public void setAvatud(Date avatud) {
		this.avatud = avatud;
	}

	public String getSulgeja() {
		return sulgeja;
	}

	public void setSulgeja(String sulgeja) {
		this.sulgeja = sulgeja;
	}

	public Date getSuletud() {
		return suletud;
	}

	public void setSuletud(Date suletud) {
		this.suletud = suletud;
	}

	public String getMuutja() {
		return muutja;
	}

	public void setMuutja(String muutja) {
		this.muutja = muutja;
	}

	public Date getMuudetud() {
		return muudetud;
	}

	public void setMuudetud(Date muudetud) {
		this.muudetud = muudetud;
	}
}