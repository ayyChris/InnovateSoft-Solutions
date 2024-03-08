const db = require('../models/db.js'); // Ruta relativa al archivo db.js
const crypto = require('crypto');
const nodemailer = require('nodemailer');

// Controlador para manejar la solicitud de registro de un nuevo usuario
async function registerUser(req, res) {
    try {
        // Obtener los datos del formulario de registro
        const { username, password, full_name, email, phone, security_question, security_answer } = req.body;

        // Insertar el usuario en la base de datos
        await db.registerUserDB(username, password, full_name, email, phone, security_question, security_answer);

        await logAction(username, 'Registro', 'Usuario registrado en el sistema');
        // Redirigir a una página de éxito o realizar alguna otra acción después de registrar al usuario
        res.send('<script>alert("¡Registro exitoso!"); window.location.href = "/login";</script>');
    } catch (error) {
        console.error('Error al registrar usuario:', error);
        // Manejar el error de alguna manera, como renderizar una página de error o redirigir a otra página
        res.status(500).send('Error al registrar usuario');
    }
}


async function loginUser(req, res) {
    try {
        const { username, password } = req.body;

        let failedAttempts = await db.getFailedVerificationAttempts(username);
        console.log("failedAttemptsLogin", failedAttempts);
        // Verificar las credenciales del usuario en la base de datos
        const isValidUser = await db.loginUserDB(username, password);

        // Verificar si el usuario está bloqueado
        const isBlocked = await db.isUserBlocked(username);

        if (isBlocked) {
            await db.insertFailedAttempts(username);
            await db.logAction(username, 'Inicio de sesion', 'Bloqueado');
            // Si el usuario está bloqueado, mostrar un mensaje de alerta y redirigir a la página de inicio de sesión
            res.send('<script>alert("¡Tu cuenta ha sido bloqueada! Por favor recupera cuenta."); window.location.href = "/login";</script>');
            return;
        }

        if (isValidUser) {
            // Restablecer el contador de intentos fallidos si las credenciales son válidas
            await db.resetFailedVerificationAttempts(username);

            // Generar un token de verificación
            const verificationToken = generateVerificationCode(6); // Código de 6 dígitos

            // Insertar el token en la base de datos
            await db.insertToken(username, verificationToken, new Date(Date.now() + 600000)); // Expira en 10 minutos

            // Agregar una cookie con el nombre de usuario
            res.cookie('username', username);

            // Enviar el código de verificación por correo electrónico
            await sendVerificationEmail(username, verificationToken);

            await db.logAction(username, 'Inicio de sesion', 'Exitoso');
            // Redirigir al usuario a la página donde puede ingresar el código de verificación
            res.redirect('/verify');
        } else {
            // Incrementar el contador de intentos fallidos solo si las credenciales son inválidas
            failedAttempts += 1;
            await db.insertFailedAttempts(username);
            await db.logAction(username, 'Inicio de sesion', 'Fallido');
            if (failedAttempts >= 3) {
                // Bloquear la cuenta si se han excedido los intentos fallidos
                await db.blockUserAccount(username);
                await db.logAction(username, 'Bloqueo', 'Exitoso');
                res.send('<script>alert("¡Cuenta bloqueada! Ha excedido el límite de intentos de verificación fallidos."); window.location.href = "/login";</script>');
            } else {
                // Enviar una SweetAlert de error si las credenciales son inválidas
                res.send('<script>alert("¡Credenciales inválidas!"); window.location.href = "/login";</script>');
            }
        }
    } catch (error) {
        // Enviar una SweetAlert de error en caso de excepción
        console.error('Error al iniciar sesión:', error);
        res.send('<script>alert("¡Ocurrió un error al iniciar sesión!"); window.location.href = "/login";</script>');
    }
}



async function getUserInfo(req, res) {
    try {
        const username = req.cookies.username;
        const userInfo = await db.getUserInfoDB(username);
        console.log("getUserInfo", userInfo);
        if (userInfo) {
            res.status(200).json({
                id_user: userInfo.id_user,
                full_name: userInfo.full_name,
                email: userInfo.email,
                username: userInfo.username,
                phone: userInfo.phone
            });
        } else {
            res.status(404).json({ error: 'Usuario no encontrado' });
        }
    } catch (error) {
        console.error('Error al obtener la información del usuario:', error);
        res.status(500).json({ error: 'Se produjo un error al procesar la solicitud' });
    }
}

async function buyServices(req, res) {
    try {
        const service = req.body.service;

        const username = req.cookies.username;

        // Comprar el servicio
        await db.buyServicesDB(service, username);

        res.send('<script>alert("¡Se ha añadido el servicio al carrito exitosamente!"); window.location.href = "/buyServices";</script>');

    } catch (error) {
        console.error('Error al comprar servicio:', error);
        res.status(500).json({ error: 'Se produjo un error al procesar la solicitud' });
    }
}

async function myServices(req, res) {
}

async function showCard(req, res) {
    try {
        const username = req.cookies.username;
        const cardInfoArray = await db.showCardDB(username);
        if (cardInfoArray && cardInfoArray.length > 0) {
            res.status(200).json(cardInfoArray);
            console.log("showCard", cardInfoArray);
        } else {
            res.status(404).json({ error: 'Informacion de carrito no encontrada' });
        }
    } catch (error) {
        console.error('Error al obtener la información del carrito:', error);
        res.status(500).json({ error: 'Se produjo un error al procesar la solicitud' });
    }
}

// Función para generar un código de verificación aleatorio
function generateVerificationCode(length) {
    return crypto.randomBytes(length).toString('hex').slice(0, length);
}

async function sendVerificationEmail(username, verificationCode) {
    try {
        // Obtener el correo electrónico asociado al nombre de usuario
        const email = await db.getEmail(username);

        // Configurar el transportador de correo electrónico
        const transporter = nodemailer.createTransport({
            service: 'gmail',
            auth: {
                user: 'emailsproyectopython@gmail.com',
                pass: 'npglayqvauxdpyhq'
            }
        });

        // Configurar el contenido del correo electrónico
        const mailOptions = {
            from: 'emailsproyectopython@gmail.com',
            to: email,
            subject: '¡Bienvenido a InnovateSoft Solutions! Código de verificación para iniciar sesión',
            text: `¡Hola!\n\nGracias por elegir InnovateSoft Solutions para tus necesidades de desarrollo. \n\nTu código de verificación es: ${verificationCode}. Utiliza este código para verificar tu cuenta e iniciar sesión en nuestra plataforma.\n\n¡Esperamos verte pronto y ayudarte a alcanzar tus objetivos!\n\nAtentamente,\nEquipo de InnovateSoft Solutions`
        };


        // Enviar el correo electrónico
        await transporter.sendMail(mailOptions);
    } catch (error) {
        console.error('Error al enviar el correo electrónico de verificación:', error);
        throw error;
    }
}


async function verifyCode(req, res) {
    try {
        const username = req.cookies.username;
        const verificationCode = req.body.verificationCode;

        // Obtener el número actual de intentos fallidos del usuario
        let failedAttempts = await db.getFailedVerificationAttempts(username);
        console.log("failedAttemptsVerify", failedAttempts);
        // Verificar si el código de verificación es válido
        const isValidToken = await db.getTokenByUsernameAndToken(username, verificationCode);

        if (isValidToken) {
            // Restablecer el contador de intentos fallidos si la verificación es exitosa
            await db.resetFailedVerificationAttempts(username);
            await db.logAction(username, 'Verificacion', 'Exitosa');
            res.send('<script>alert("¡Código de verificación válido! ¡Inicio de sesión exitoso!"); window.location.href = "/buyServices";</script>');
        } else {
            // Incrementar el contador de intentos fallidos
            failedAttempts += 1;
            await db.insertFailedAttempts(username);

            await db.logAction(username, 'Verificacion', 'Fallida');
            // Verificar si el usuario ha excedido el límite de intentos fallidos (por ejemplo, 3)
            if (failedAttempts >= 3) {
                // Bloquear la cuenta si se han excedido los intentos fallidos
                await db.blockUserAccount(username);
                await db.logAction(username, 'Bloqueo', 'Exitoso');
                res.send('<script>alert("¡Cuenta bloqueada! Ha excedido el límite de intentos de verificación fallidos."); window.location.href = "/login";</script>');
            } else {
                res.send('<script>alert("¡Código de verificación inválido!"); window.location.href = "/verify";</script>');
            }
        }
    } catch (error) {
        console.error('Error al verificar el código de verificación:', error);
        res.status(500).send('Error interno del servidor');
    }
}

async function verifyCodeRecover(req, res) {

}

async function recoverEnterEmail(req, res) {
    res.redirect("/recoverEnterCode")
}

// Exportar la función del controlador
module.exports = {
    registerUser,
    loginUser,
    getUserInfo,
    buyServices,
    myServices,
    showCard,
    generateVerificationCode,
    sendVerificationEmail,
    verifyCode,
    verifyCodeRecover,
    recoverEnterEmail
};