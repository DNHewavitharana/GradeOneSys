package com.aurora.account.web;

import com.aurora.account.model.AssignedApplicant;
import com.aurora.account.service.AssignedApplicantService;
import com.aurora.account.validator.AssignedApplicantValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AssignedApplicantController extends AbstractController{

    @Autowired
    private AssignedApplicantService assignedApplicantService;
    @Autowired
    private AssignedApplicantValidator assignedApplicantValidator;

    @RequestMapping(value = "/assignapplicant", method = RequestMethod.GET)
    public String assignApplicant(Model model, String ok){
        model.addAttribute("assignForm",new AssignedApplicant());
        setNav(model,8);

        if (ok != null)
        {
            setNav(model, 8);
            model.addAttribute("message", "<div class='alert alert-info'>Assigned successfully.</div>");
        }

        return "assignapplicant";

    }
    @RequestMapping(value = "/assignapplicant", method = RequestMethod.POST)
    public String assignApplicant(@ModelAttribute("assignForm") AssignedApplicant assignForm, BindingResult bindingResult, Model model){
        assignedApplicantValidator.validate(assignForm,bindingResult);

        if (bindingResult.hasErrors())
        {
            setNav(model, 8);
            return "assignapplicant";
        }
        assignedApplicantService.saveAssign(assignForm);
        return "redirect:assignapplicant?ok";
    }

    @RequestMapping("checkAssignId")
    @ResponseBody
    public String  checkUser(String application_id){

        return String.valueOf(assignedApplicantService.checkAvailability(application_id));
    }



}
