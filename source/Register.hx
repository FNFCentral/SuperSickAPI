package;

/**
 * Communicates to the server that the API is ready to recieve info.
**/
class Register {
    static public function register() {
        #if html5
        html.HTMLRegister.register();
        #end
    }
}