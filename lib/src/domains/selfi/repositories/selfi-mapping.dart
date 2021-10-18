class SelfiMapping {
  toResponse(response) {
    if (response.code == 0) {
      return response.data;
    } else {
      throw "Usuario incorrecto";
    }
  }

  toError(error) {
    if (error.status == 400) {
      throw "Usuario incorrecto";
    }
    if (error.status == 400) {
      throw "Usuario incorrecto";
    }
  }
}
