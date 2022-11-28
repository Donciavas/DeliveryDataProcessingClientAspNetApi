using System.ComponentModel.DataAnnotations;

namespace DeliveryDataProcessingAspNet.Api.Attributes
{
    public class AllowedExtensionsAttribute : ValidationAttribute
    {
        private readonly string[] _extensions;
        public AllowedExtensionsAttribute(string[] extensions)
        {
            _extensions = extensions;
        }
        protected override ValidationResult? IsValid(
            object? value, ValidationContext validationContext)
        {
            if (value is IFormFile file)
            {
                var extension = Path.GetExtension(file.FileName);
                if (!_extensions.Contains(extension.ToLower()))
                {
                    return new ValidationResult(GetErrorMessage(extension));
                }
            }
            return ValidationResult.Success;
        }
        private string GetErrorMessage(string extension)
        {
            return $"This file extension {extension} is not allowed !!!";
        }
    }
}
