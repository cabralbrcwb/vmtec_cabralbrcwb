package br.com.vmtec.controller;

import br.com.vmtec.dto.UserRegistrationDto;
import br.com.vmtec.exception.PasswordTooShortException;
import br.com.vmtec.exception.UserAlreadyExistAuthenticationException;
import br.com.vmtec.exception.VmTecException;
import br.com.vmtec.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.Locale;

@RestController
public class SignUpController {

    private final Logger logger = LogManager.getLogger(getClass());

    @Autowired
    private MessageSource messageSource;

    @Autowired
    private UserService userService;

    @GetMapping({"/", "/register"})
    public ModelAndView register() {
        logger.info("Exibindo página de registro...");
        ModelAndView modelAndView = new ModelAndView("register");
        modelAndView.addObject("userRegistrationForm", new UserRegistrationDto());
        return modelAndView;
    }

    @PostMapping("/register")
    public ResponseEntity<String> registerUser(@Valid UserRegistrationDto userRegistrationDto,
                                               BindingResult result,
                                               HttpServletRequest request,
                                               RedirectAttributes attributes) {
        logger.info("Registrando novo usuário...");
        Locale locale = RequestContextUtils.getLocale(request);

        try {
            if (result.hasErrors()) {
                ObjectError firstError = result.getAllErrors().get(0);
                String[] errorCodes = firstError.getCodes();
                String message = null;

                for (String code : errorCodes) {
                    try {
                        message = messageSource.getMessage(code, firstError.getArguments(), locale);
                        break;
                    } catch (NoSuchMessageException e) {
                        continue;
                    }
                }

                if (message == null) {
                    message = firstError.getDefaultMessage();
                }

                return ResponseEntity.badRequest().body(message);
            }

            userService.registerNewUser(userRegistrationDto);

            String successMessage = messageSource.getMessage("message.registration.success", null, locale);
            return ResponseEntity.ok(successMessage);

        } catch (UserAlreadyExistAuthenticationException e) {
            logger.error("Erro de usuário duplicado", e);

            String errorMessage = messageSource.getMessage(
                    "message.registration.email.exists.error",
                    new Object[]{e.getEmail()},
                    locale
            );
            return ResponseEntity.badRequest().body(errorMessage);

        } catch (PasswordTooShortException e) {
            logger.error("Erro de senha muito curta", e);

            String errorMessage = messageSource.getMessage(
                    "message.password.too.short",
                    new Object[]{e.getMinimumLength()},
                    locale
            );
            return ResponseEntity.badRequest().body(errorMessage);

        } catch (VmTecException e) {
            logger.error("Erro de VmTecException", e);
            return ResponseEntity.badRequest().body(e.getMessage());

        } catch (Exception e) {
            logger.error("Erro inesperado no registro de usuário", e);

            String genericError = messageSource.getMessage("message.generic.error", null, locale);
            return ResponseEntity.status(500).body(genericError);
        }
    }
}