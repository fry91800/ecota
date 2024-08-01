class CustomError extends Error {
    constructor(message, status) {
      super(message);
      this.status = status;
    }
  }

function testError()
{
    throw new CustomError("testError", 400);
}

function missingFieldError()
{
    throw new CustomError("missingFieldError", 400);
}

function mailNoExistError()
{
    throw new CustomError("mailNoExistError", 400);
}
function wrongPassError()
{
    throw new CustomError("wrongPassError", 400);
}

module.exports = {
    CustomError,
    testError,
    missingFieldError,
    mailNoExistError,
    wrongPassError
}