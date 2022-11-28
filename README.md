# DeliveryDataProcessingClientAspNetApi

.NET 6 Core

Task description

Task is to read clients from .json file and update with post codes through external API, using HTTP request and URI address.

---Important Notice---Result of the program code files and database script is in file 'DeliveryDataProcessingClientDB_script_withData'. Just copy paste to SQL server database query. In order to create new database, if needed, write 'Update-Database' in npm console or copy paste empty 'DeliveryDataProcessingClientDB_script' to SQL server database query.

Since version .NET 6, every SQL connection to database is encrypted by default, so it needs 'Trust server certificate' to be turned on in SQL server management studio. adding image, where that option is:

![image](https://user-images.githubusercontent.com/96888736/204286146-848960bb-c2bd-4134-9481-2714862fc5fc.png)

NuGet packages were used:

1. Microsoft.EntityFrameworkCore version 7.0.0
2. Microsoft.EntityFrameworkCore.SqlServer version 7.0.0
3. Microsoft.EntityFrameworkCore.Tools version 7.0.0
4. Newtonsoft.Json version 13.0.2
