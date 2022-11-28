using DeliveryDataProcessingAspNet.Api.DTOs;
using Newtonsoft.Json;

namespace DeliveryDataProcessingAspNet.Api.Services
{
    public class HttpClientExtension : IHttpClientExtension
    {
        public readonly IConfiguration Configuration;
        private readonly ILogger<HttpClientExtension> _logger;
        public HttpClient HttpClient { get; set; }
        public HttpClientExtension(IConfiguration configuration, ILogger<HttpClientExtension> logger)
        {
            Configuration = configuration;
            HttpClient = new HttpClient();
            _logger = logger;
        }
        public async Task<ResposePostItDto> GetInfoFromPostItByAddressAsync(string address)
        {
            try
            {
                var request = new HttpRequestMessage
                {
                    Method = HttpMethod.Get,
                    RequestUri = new Uri($"https://api.postit.lt/?term={address}&key={Configuration.GetConnectionString("AccessKey")}")
                };
                using var response = await HttpClient.SendAsync(request);
                response.EnsureSuccessStatusCode();
                var body = await response.Content.ReadAsStringAsync();
                var deserializeResponse = JsonConvert.DeserializeObject<ResposePostItDto>(body);
                if (deserializeResponse is null)
                {
                    _logger?.LogWarning("No Data acquired from PostIt.api");
                    return new ResposePostItDto();
                }
                _logger?.LogInformation("Data from PostIt downloaded");
                return deserializeResponse;
            }
            catch (Exception ex)
            {
                _logger?.LogError(ex.Message);
                return new ResposePostItDto();
            }
        }
    }
}

