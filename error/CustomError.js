class CustomError extends Error {
    constructor(message, status) {
      super(message);
      this.status = status;
    }
  }

function testError()
{
    throw new CustomError("Wrong Login", 400);
}

module.exports = {
    CustomError,
    testError
}