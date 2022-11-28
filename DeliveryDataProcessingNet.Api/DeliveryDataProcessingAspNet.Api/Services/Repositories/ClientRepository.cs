using DeliveryDataProcessingAspNet.Api.DTOs;
using DeliveryDataProcessingAspNet.Api.Models;
using Microsoft.EntityFrameworkCore;

namespace DeliveryDataProcessingAspNet.Api.Services.Repositories
{
    public class ClientRepository : IClientRepository
    {
        private readonly ApplicationDbContext _context;
        private readonly ILogger _logger;
        public ClientRepository(ApplicationDbContext context, ILogger<ClientRepository> logger)
        {
            _context = context;
            _logger = logger;
        }
        public List<Client>? GetAllClients()
        {
            return _context?.Clients?.Include(i => i.Log).ToList();
        }
        public bool SaveClient(ClientDto clientDto)
        {
            try
            {
                var clientDublicate = _context?.Clients?.FirstOrDefault(x => x.Address == clientDto.Address
                                                                    && x.Name == clientDto.Name);
                if (clientDublicate is null)
                {
                    var newLog = new Log { Id = Guid.NewGuid(), ClientCreationTime = DateTime.Now };
                    _context?.Log?.Add(newLog);
                    _context?.SaveChanges();

                    var newClient = new Client()
                    {
                        Id = Guid.NewGuid(),
                        Address = clientDto.Address,
                        Name = clientDto.Name,
                        PostCode = clientDto.PostCode,
                        Log = newLog
                    };
                    _context?.Clients?.Add(newClient);
                    _context?.SaveChanges();
                    return true;
                }
                else
                {
                    _logger.LogWarning("Client in database exists, didn't create new client");
                    return false;
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return false;
            }
        }
        public bool UpdatePostCode(string? postCode, Guid clientId)
        {
            try
            {
                var clientFromDb = _context?.Clients?.Include(i => i.Log).SingleOrDefault(x => x.Id.Equals(clientId));
                if (clientFromDb is not null)
                {
                    clientFromDb.PostCode = postCode;
                    if (clientFromDb.Log != null)
                    {
                        clientFromDb.Log.PostCodeUpdateTime = DateTime.Now;
                    }
                    _context?.SaveChanges();
                    _logger.LogInformation($"{clientFromDb} - Status: Post Code updated");
                    return true;
                }
                _logger.LogWarning($"Bad User Id");
                return false;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                return false;
            }
        }
    }
}
