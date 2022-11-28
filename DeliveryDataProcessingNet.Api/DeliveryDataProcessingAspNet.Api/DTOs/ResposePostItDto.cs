namespace DeliveryDataProcessingAspNet.Api.DTOs
{
    public class ResposePostItDto
    {
        public string? status { get; set; }
        public bool success { get; set; }
        public string? message { get; set; }
        public int message_code { get; set; }
        public int total { get; set; }
        public List<DataPostItDto>? data { get; set; }
    }
}
