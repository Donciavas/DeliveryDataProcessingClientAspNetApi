using DeliveryDataProcessingAspNet.Api.DTOs;
using DeliveryDataProcessingAspNet.Api.Models;

namespace DeliveryDataProcessingAspNet.Api.Services.Repositories
{
    public interface IClientRepository
    {
        bool SaveClient(ClientDto clientDto);
        List<Client>? GetAllClients();
        bool UpdatePostCode(string postCode, Guid clientId);
    }
}