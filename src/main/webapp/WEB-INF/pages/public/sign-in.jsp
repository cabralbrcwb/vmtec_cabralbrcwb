<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="pt-BR">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Vm Tec | Formulários de Login e Registro</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value='/assets/public/css/bootstrap.min.css'/>">
    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="<c:url value='/assets/public/css/fontawesome-all.min.css'/>">
    <!-- Flaticon CSS -->
    <link rel="stylesheet" href="<c:url value='/assets/public/font/flaticon.css'/>">
    <!-- Google Web Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<c:url value='/assets/public/css/style.css'/>">
</head>

<body>
    <!--[if lt IE 8]>
        <p class="browserupgrade">
            Você está usando um navegador <strong>desatualizado</strong>.
            Por favor, <a href="http://browsehappy.com/">atualize seu navegador</a>
            para melhorar sua experiência.
        </p>
    <![endif]-->

    <!-- Preloader -->
    <div id="preloader" class="preloader">
        <div class='inner'>
            <div class='line1'></div>
            <div class='line2'></div>
            <div class='line3'></div>
        </div>
    </div>

    <section class="fxt-template-animation fxt-template-layout24">
        <!-- Área de Vídeo de Fundo -->
        <div class="fxt-video-background">
            <div class="fxt-video">
               <div
                  id="fxtVideo"
                  data-property="{
                      videoURL:'n_30MdZ9kL8',
                      autoPlay:true,
                      mute:true,
                      loop:true,
                      startAt:0,
                      opacity:1,
                      quality:'default',
                      showControls:false,
                      optimizeDisplay:true,
                      containment:'.fxt-video-background'
                  }">
               </div>
            </div>
        </div>
        <!-- Fim da Área de Vídeo -->

        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <div class="fxt-content">
                        <h2>Faça login em sua conta</h2>

                        <!-- Se o parâmetro "error" estiver presente na URL (ex.: /login?error=true), exibe a mensagem abaixo -->
                        <c:if test="${param.error ne null}">
                            <div class="alert alert-danger text-center mb-4" role="alert">
                                Usuário ou senha inválidos! Por favor, tente novamente.
                            </div>
                        </c:if>

                        <div class="fxt-form">
                            <!-- Formulário de login -->
                            <!-- Certifique-se de que o SecurityConfig define .loginProcessingUrl("/j_spring_security_check")
                                 e utiliza j_username/j_password como parâmetros -->
                            <form action="<c:url value='/j_spring_security_check'/>" method="post">
                                <div class="form-group">
                                    <div class="fxt-transformY-50 fxt-transition-delay-1">
                                        <input
                                            type="email"
                                            id="email"
                                            class="form-control"
                                            name="j_username"
                                            placeholder="Email"
                                            required="required"
                                            autocomplete="new-password"
                                        >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="fxt-transformY-50 fxt-transition-delay-2">
                                        <input
                                            id="password"
                                            type="password"
                                            class="form-control"
                                            name="j_password"
                                            placeholder="********"
                                            required="required"
                                            autocomplete="new-password"
                                        >
                                        <i
                                            toggle="#password"
                                            class="fa fa-fw fa-eye toggle-password field-icon"
                                        ></i>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="fxt-transformY-50 fxt-transition-delay-3">
                                        <div class="fxt-checkbox-area">
                                            <div class="checkbox">
                                                <input id="checkbox1" type="checkbox">
                                                <label for="checkbox1">Mantenha-me conectado</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="fxt-transformY-50 fxt-transition-delay-4">
                                        <button
                                            type="submit"
                                            class="fxt-btn-fill"
                                            style="background-color:#01cc66"
                                        >
                                            Entrar
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <div class="fxt-footer">
                            <div class="fxt-transformY-50 fxt-transition-delay-9">
                                <p>Não tem uma conta?
                                    <a
                                        href="<c:url value='/register'/>"
                                        class="switcher-text2 inline-text"
                                    >
                                        Registrar
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div> <!-- /fxt-content -->
                </div> <!-- /col-lg-6 -->
            </div> <!-- /row -->
        </div> <!-- /container -->
    </section>

    <!-- jQuery -->
    <script src="<c:url value='/assets/public/js/jquery-3.5.0.min.js'/>"></script>
    <!-- Bootstrap JS -->
    <script src="<c:url value='/assets/public/js/bootstrap.min.js'/>"></script>
    <!-- ImagesLoaded JS -->
    <script src="<c:url value='/assets/public/js/imagesloaded.pkgd.min.js'/>"></script>
    <!-- YouTube Plugin JS -->
    <script src="<c:url value='/assets/public/js/jquery.mb.YTPlayer.min.js'/>"></script>
    <!-- Validator JS -->
    <script src="<c:url value='/assets/public/js/validator.min.js'/>"></script>
    <!-- Custom JS -->
    <script src="<c:url value='/assets/public/js/main.js'/>"></script>

</body>
</html>
