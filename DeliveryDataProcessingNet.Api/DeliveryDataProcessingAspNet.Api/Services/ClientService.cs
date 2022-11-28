using DeliveryDataProcessingAspNet.Api.DTOs;
using DeliveryDataProcessingAspNet.Api.Models;
using DeliveryDataProcessingAspNet.Api.Services.Repositories;
using Newtonsoft.Json;

namespace DeliveryDataProcessingAspNet.Api.Services
{
    public class ClientService : IClientService
    {
        private readonly IClientRepository _repository;
        private readonly IHttpClientExtension _httpClientExtension;
        private readonly ILogger<ClientService> _logger;
        public ClientService(IClientRepository repository, IHttpClientExtension httpClientExtension, ILogger<ClientService> logger)
        {
            _repository = repository;
            _httpClientExtension = httpClientExtension;
            _logger = logger;
        }
        public List<Client>? GetAllClients()
        {
            return _repository.GetAllClients();
        }
        public ResponseDto SaveClient(ReadFileDto? readFileDto)
        {
            using var memoryStream = new MemoryStream();
            readFileDto?.ClientsFile?.CopyTo(memoryStream);
            var fileBytes = memoryStream.ToArray();
            // if the system do not recognize lithuanian letters use GetEncoding(1257), commented 2 lines below:
            //System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);
            //var convertedToString = System.Text.Encoding.GetEncoding(1257).GetString(fileBytes);
            var convertedToString = System.Text.Encoding.UTF8.GetString(fileBytes);
            var clientList = JsonConvert.DeserializeObject<List<ClientDto>>(convertedToString);
            var numberDublicateClients = 0;
            if (clientList != null)
            {
                foreach (var client in clientList)
                {
                    var response = _repository.SaveClient(client);
                    if (!response)
                        numberDublicateClients++;
                }
                return new ResponseDto(true, $"Number of clients saved to database = {clientList.Count - numberDublicateClients}, " +
                                             $"found  duplicates = {numberDublicateClients}");
            }
            return new ResponseDto(false, "file have no records");
        }
        public ResponseDto UpdatePostCode()
        {
            var clientList = _repository.GetAllClients();
            if (clientList?.Count > 0)
            {
                foreach (var client in clientList)
                {
                    if (client.Address != null)
                    {
                        var responseFromPostIt = _httpClientExtension.GetInfoFromPostItByAddressAsync(client.Address);
                        var postCode = responseFromPostIt?.Result?.data?.First().post_code;
                        if (postCode != null)
                        {
                            _repository.UpdatePostCode(postCode, client.Id);
                        }
                        else
                        {
                            _repository.UpdatePostCode("NotFound", client.Id);
                            _logger.LogWarning("Bad address or not found in postIt.api");
                        }
                    }
                    else
                        _logger.LogWarning("Client has no address or database is corrupted");
                }
            }
            else
                return new ResponseDto(false, "No Records in database");
            return new ResponseDto(true, $"Post Codes updated of {clientList.Count} clients ");
        }
    }
}
