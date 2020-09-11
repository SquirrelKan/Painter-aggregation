var message = function (requestStatusCodes, data) {
    return {
        'status': requestStatusCodes.value,
        'message': requestStatusCodes.message,
        'data': data
    }
}
module.exports = message