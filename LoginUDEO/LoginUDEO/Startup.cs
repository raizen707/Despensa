using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LoginUDEO.Startup))]
namespace LoginUDEO
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
