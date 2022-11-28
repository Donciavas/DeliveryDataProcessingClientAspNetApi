using DeliveryDataProcessingAspNet.Api.DTOs;

namespace DeliveryDataProcessingAspNet.Api.Services
{
    public interface IHttpClientExtension
    {
        public Task<ResposePostItDto> GetInfoFromPostItByAddressAsync(string address);
    }
}
