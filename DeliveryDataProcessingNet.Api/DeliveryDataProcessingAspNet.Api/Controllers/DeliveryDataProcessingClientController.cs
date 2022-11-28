using DeliveryDataProcessingAspNet.Api.DTOs;
using DeliveryDataProcessingAspNet.Api.Models;
using DeliveryDataProcessingAspNet.Api.Services;
using Microsoft.AspNetCore.Mvc;

namespace DeliveryDataProcessingAspNet.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class DeliveryDataProcessingClientController : ControllerBase
    {
        private readonly IClientService _service;
        public DeliveryDataProcessingClientController(IClientService service)
        {
            _service = service;
        }
        [HttpGet("GetAllClients")]
        public ActionResult<List<Client>?> Get()
        {
            var clientList = _service.GetAllClients();
            if (clientList?.Count == 0)
                return BadRequest("No records in database");
            return clientList;
        }
        [HttpPost("LoadClientsFromFile")]
        public ActionResult<ResponseDto> LoadClientsFromFile([FromForm] ReadFileDto? readFileDto)
        {
            var response = _service.SaveClient(readFileDto);
            if (!response.IsSuccess)
                return BadRequest(response);
            return Ok(response);
        }
        [HttpPost("UpdatePostCodes")]
        public ActionResult<ResponseDto> UpdatePostCode()
        {
            var response = _service.UpdatePostCode();
            if (!response.IsSuccess)
                return BadRequest(response);
            return Ok(response);
        }
    }
}