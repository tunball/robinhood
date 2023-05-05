const conn = require("../database/connection");

class ErrorManager {
 
  errorMessage = ""

  constructor(error) {
   
    if (typeof error == 'string') {
      this.errorMessage = error
    } else if (error?.message) {
      this.errorMessage = error?.message;
    }         
    else {
      this.errorMessage = "An error occurs.";
    
      
    }    

  }

  toAPIResponse() {
    return {
      status: "fail",
      message: this.errorMessage    
    }
  }




}

module.exports = ErrorManager;


