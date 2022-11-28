using DeliveryDataProcessingAspNet.Api.DTOs;
using DeliveryDataProcessingAspNet.Api.Models;

namespace DeliveryDataProcessingAspNet.Api.Services
{
    public interface IClientService
    {
        ResponseDto SaveClient(ReadFileDto? readFileDto);
        List<Client>? GetAllClients();
        ResponseDto UpdatePostCode();
    }
}
