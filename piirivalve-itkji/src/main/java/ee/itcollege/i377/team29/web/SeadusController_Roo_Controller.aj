// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package ee.itcollege.i377.team29.web;

import ee.itcollege.i377.team29.entities.Seadus;
import ee.itcollege.i377.team29.entities.Seaduse_punkt;
import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect SeadusController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String SeadusController.create(@Valid Seadus seadus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("seadus", seadus);
            addDateTimeFormatPatterns(uiModel);
            return "seaduses/create";
        }
        uiModel.asMap().clear();
        seadus.persist();
        return "redirect:/seaduses/" + encodeUrlPathSegment(seadus.getSeadus_ID().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String SeadusController.createForm(Model uiModel) {
        uiModel.addAttribute("seadus", new Seadus());
        addDateTimeFormatPatterns(uiModel);
        return "seaduses/create";
    }
    
    @RequestMapping(value = "/{seadus_ID}", method = RequestMethod.GET)
    public String SeadusController.show(@PathVariable("seadus_ID") Long seadus_ID, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("seadus", Seadus.findSeadus(seadus_ID));
        uiModel.addAttribute("itemId", seadus_ID);
        return "seaduses/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String SeadusController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("seaduses", Seadus.findSeadusEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Seadus.countSeaduses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("seaduses", Seadus.findAllSeaduses());
        }
        addDateTimeFormatPatterns(uiModel);
        return "seaduses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String SeadusController.update(@Valid Seadus seadus, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("seadus", seadus);
            addDateTimeFormatPatterns(uiModel);
            return "seaduses/update";
        }
        uiModel.asMap().clear();
        seadus.merge();
        return "redirect:/seaduses/" + encodeUrlPathSegment(seadus.getSeadus_ID().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{seadus_ID}", params = "form", method = RequestMethod.GET)
    public String SeadusController.updateForm(@PathVariable("seadus_ID") Long seadus_ID, Model uiModel) {
        uiModel.addAttribute("seadus", Seadus.findSeadus(seadus_ID));
        addDateTimeFormatPatterns(uiModel);
        return "seaduses/update";
    }
    
    @RequestMapping(value = "/{seadus_ID}", method = RequestMethod.DELETE)
    public String SeadusController.delete(@PathVariable("seadus_ID") Long seadus_ID, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Seadus.findSeadus(seadus_ID).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/seaduses";
    }
    
    @ModelAttribute("seaduses")
    public Collection<Seadus> SeadusController.populateSeaduses() {
        return Seadus.findAllSeaduses();
    }
    
    @ModelAttribute("seaduse_punkts")
    public Collection<Seaduse_punkt> SeadusController.populateSeaduse_punkts() {
        return Seaduse_punkt.findAllSeaduse_punkts();
    }
    
    void SeadusController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("seadus_avatud_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("seadus_suletud_date_format", "yyyy-MM-dd");
        uiModel.addAttribute("seadus_muudetud_date_format", "yyyy-MM-dd");
    }
    
    String SeadusController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
