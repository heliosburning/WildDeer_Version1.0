<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WILD DEER</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"> 
    <link rel="stylesheet" href="Vista/CSS/generales.css"> 
</head>

<body>
    <div class="info-bar">
        <span>MON - SUN: 11.00 A.M. - 08.00 P.M.</span>
        <div class="social-icons">
            <a href="https://www.facebook.com/wilddeerbarbershopandbar?_rdr"><i class="fab fa-facebook-f"></i></a>
            <a href="https://www.instagram.com/wilddeerbarbershopandbar/"><i class="fab fa-instagram"></i></a>
            <a href="https://www.tiktok.com/@wilddeerbarbershop"><i class="fab fa-tiktok"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
        </div>
    </div>

    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand">WILD DEER BARBERSHOP & BAR</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav"> 
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Mi Perfil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Mi Agenda</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Agendar Cita</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Controlador/Usuario/Logout.php">Cerrar Sesión</a>
                </li>
            </ul>
        </div>
    </nav>

    <img src="Vista/Imagenes/wildbeer_barbershp&bar.jpeg" class="hero-image">


    <section class="secciones">
        <h2 class="titulo-secciones">SOBRE NOSOTROS</h2>
        <div class="partes">
            <img src="Vista/Imagenes/forest.gif" class="hero-image">
        </div>
    </section>

    <section class="secciones">
        <h2 class="titulo-secciones">CONOCE A NUESTRO EQUIPO</h2>
        <div class="partes">   
            <section class="slider-container">
                <div class="slider-images">
                  <div class="slider-img">
                    <img src="Vista/Imagenes/barber1.jpg" alt="2" />
                        <div class="overlay"></div>
                    <h1>HABILIDAD</h1>
                    <div class="details">
                      <h2>PAULINA</h2>
                      <p>2 años de experiencia</p>
                    </div>
                  </div>

                  <div class="slider-img active">
                    <img src="Vista/Imagenes/barber1.jpg" alt="3" />
                        <div class="overlay"></div>
                    <h1>PRESICIÓN</h1>
                    <div class="details">
                      <h2>MICHAEL</h2>
                      <p>10 años de experiencia</p>
                    </div>
                  </div>

                  <div class="slider-img">
                    <img src="Vista/Imagenes/barber1.jpg" alt="4" />
                        <div class="overlay"></div>
                    <h1>CREATIVIDAD</h1>
                    <div class="details">
                      <h2>HAROLD</h2>
                      <p>5 años de experiencia</p>
                    </div>
                  </div>
                </div>
            </section>
        </div>
    </section>

    <section class="secciones">
        <h2 class="titulo-secciones">NUESTROS SERVICIOS</h2>
        <div class="partes">   

        <div class="carrusel">
            <div class="carrusel-inner">
                <div class="card">
                    <img src="Vista/Imagenes/barberia.jpg" alt="Imagen 1" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">HAIRCUT</h5>
                        <p class="card-text">Get te haircut you want with our expert stylist. 
                                            Wheter it´s a classic style or something unique, just bring a picture, 
                                            and we´ll create the look you desire.</p>
                        <p class="card-text">40 min. $45.00</p>
                    </div>
                </div>
                <div class="card">
                    <img src="Vista/Imagenes/barberia.jpg" alt="Imagen 2" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">FULL CUT</h5>
                        <p class="card-text">Experience our original full haircut package:
                                            A premiu Grooming service that includes a precise haircut, detailed beard 
                                            shaping and eyebrow trimming.</p>
                        <p class="card-text">1 hour. $60.00</p>
                    </div>
                </div>
                <div class="card">
                    <img src="Vista/Imagenes/barberia.jpg" alt="Imagen 3" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">KIDS</h5>
                        <p class="card-text">We welcome kids for haircuts! For their comfort and safety, 
                                            we recommend parent and adult supervision for those who are
                                            a bit more active.</p>
                        <p class="card-text">30 min. $35.00</p>
                    </div>
                </div>
                <div class="card">
                    <img src="Vista/Imagenes/barberia.jpg" alt="Imagen 4" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">BEAR GROOMING</h5>
                        <p class="card-text">We offer precise line-ups, shaping, trimming, and shaving.
                                            Enjoy a hot towel tratment and relaxing oil for a refreshing experience.</p>
                        <p class="card-text">30 min. $30.00</p>
                    </div>
                </div>
                <div class="card">
                    <img src="Vista/Imagenes/barberia.jpg" alt="Imagen 5" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">WILD CUT</h5>
                        <p class="card-text">Come and live the Wild Deer experience, a service in personal care and
                                            well-being, leaving you feeling renewed, confident and ready for any adventure.</p>
                        <p class="card-text">1 hour, 30 min. $115.00</p>
                    </div>
                </div>
                <div class="card">
                    <img src="Vista/Imagenes/barberia.jpg" alt="Imagen 5" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">FACIAL</h5>
                        <p class="card-text">We apply mask rich in natural ingredients to deeply 
                                            nourish and hydrate the skin. This mask, inspired by the purity 
                                            of nature, returns luminosity and eslasticity to your face.</p>
                        <p class="card-text">30 min. $55.00</p>
                    </div>
                </div>
                <div class="card">
                    <img src="Vista/Imagenes/barberia.jpg" alt="Imagen 5" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">LINE UP</h5>
                        <p class="card-text">Defining the lines of the forehead, sideburns and nape,
                                            creating a symmetrical and polished finish.</p>
                        <p class="card-text">30 min. $40.00</p>
                    </div>
                </div>
                <div class="card">
                    <img src="Vista/Imagenes/barberia.jpg" alt="Imagen 5" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">HYDROGEN OXYGEN</h5>
                        <p class="card-text">Is a non-invasive skin care procedure that uses a special
                                            device to deliver a mixture of hydrogen gas and oxygen to the skin
                                            for deeply cleanising pores and reducing imperfections.</p>
                        <p class="card-text">1 hour. $140.00</p>
                    </div>
                </div>
            </div>
            <button class="prev" onclick="moveSlide(-1)">&#10094;</button>
            <button class="next" onclick="moveSlide(1)">&#10095;</button>
        </div> 

        </div>
    </section>

    <section class="secciones">
        <h2 class="titulo-secciones">NUESTRO TRABAJO</h2>
        <div class="partes">
            <div class="video-container">
                <iframe src="https://www.youtube.com/embed/dig_n1ryyWI?si=5NncztdVKXDki9EL" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>
        </div>
    </section>

    <section class="secciones">
        <div class="partes">
            <div class="contenedor_elementos">
                <div class="wild_deer_info">
                    <div class="seccion seccion-1">
                        <h2>OUR LOCATIONS</h2>
                        <hr>
                        <p>7111 NW 86th St, Kansas City, 64153</p>
                        <hr>
                        <h2>WE´RE OPEN FROM MONDAY TO FRIDAY</h2>
                        <hr>
                        <p>Contacto: </p>
                        <p>Teléfono: </p>
                    </div>
                    <div class="seccion seccion-2">
                        <img src="Vista/Imagenes/slogan_imagen.jpg" alt="Descripción de la imagen">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="secciones">
        <div class="partes">
            <div class="contenedor_elementos">
                <iframe 
                    class="mapa"
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.835434509847!2d-94.7052346846815!3d39.22990397941769!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x87c0a8b6a7e9c7c7%3A0x8e4b7a5e5f4a5b9!2s7111%20NW%2086th%20St%2C%20Kansas%20City%2C%20MO%2064153%2C%20Estados%20Unidos!5e0!3m2!1ses-419!2ses-419!4v1697123456789" 
                    width="100%" 
                    height="100%" 
                    style="border:0;" 
                    allowfullscreen="" 
                    loading="lazy">
                </iframe>
            </div>
        </div>
    </section>

    <section>
        <button id="scrollToTopBtn" class="scroll-to-top" onclick="scrollToTop()">
            <i class="fa fa-arrow-up"></i>
        </button>

        <button class="float-wa" onclick="openWhatsApp()">
            <i class="fa fa-whatsapp"></i>
        </button>

    </section>

    <footer>
        <div class="footer-content">
            <div class="text-content">
                <span>PROPUESTA DE DISEÑO #1</span>
                <span>POR DANI le FLEUR</span>
            </div>
            <img src="https://cdn.shopify.com/s/files/1/0587/8179/4470/files/dog.png?v=1697747175" alt="Dog Image" class="footer-image">
        </div>
    </footer>
</body>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="js/jQuery.js"></script>

<script>
    window.addEventListener('scroll', function() {
        const navbar = document.querySelector('.navbar');
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });
</script>

<script>
        // Obtener el botón
        var scrollToTopBtn = document.getElementById("scrollToTopBtn");

        // Cuando el usuario desplaza 20px desde la parte superior de la página, mostrar el botón
        window.onscroll = function() {scrollFunction()};

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                scrollToTopBtn.style.display = "block";
            } else {
                scrollToTopBtn.style.display = "none";
            }
        }

        // Cuando el usuario hace clic en el botón, desplazarse hasta la parte superior de la página
        scrollToTopBtn.addEventListener("click", function(){
            // Para navegadores modernos
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    </script>

    <script>
      jQuery(document).ready(function ($) {
        $(".slider-img").on("click", function () {
          $(".slider-img").removeClass("active");
          $(this).addClass("active");
        });
      });
    </script>

    <script>
        function openWhatsApp() {
            window.open('https://wa.me/NUMBER?text=Saludos', '_blank');
        }
    </script>

<script>
let currentIndex = 0;

function moveSlide(direction) {
    const slides = document.querySelectorAll('.card');
    const isLargeScreen = window.innerWidth > 768; // Adjust this value as needed

    // Calcular el nuevo índice
    const newIndex = currentIndex + direction;

    // Verificar si el nuevo índice está dentro de los límites
    if (isLargeScreen) {
        // Para pantallas grandes
        if (newIndex >= 0 && newIndex < slides.length - 2) {
            currentIndex = newIndex; // Actualizar solo si está dentro de los límites
        }
    } else {
        // Para pantallas pequeñas
        if (newIndex >= 0 && newIndex < slides.length) {
            currentIndex = newIndex; // Actualizar solo si está dentro de los límites
        }
    }

    const offset = -currentIndex * (slides[0].clientWidth + 20); // Ajustar el desplazamiento
    document.querySelector('.carrusel-inner').style.transform = `translateX(${offset}px)`;
}
    </script>
</html>