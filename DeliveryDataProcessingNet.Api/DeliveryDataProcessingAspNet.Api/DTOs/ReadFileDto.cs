using DeliveryDataProcessingAspNet.Api.Attributes;
using System.ComponentModel.DataAnnotations;

namespace DeliveryDataProcessingAspNet.Api.DTOs
{
    public class ReadFileDto
    {
        [AllowedExtensions(new string[] { ".json" })]
        [Required]
        public IFormFile? ClientsFile { get; set; }
    }
}
