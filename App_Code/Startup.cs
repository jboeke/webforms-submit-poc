using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(onchange_poc.Startup))]
namespace onchange_poc
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            
        }
    }
}
