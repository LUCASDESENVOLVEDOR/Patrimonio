using System;
using System.Collections.Generic;

#nullable disable

namespace Patrimonio.Domains
{
    public partial class Usuario
    {
        public int Id { get; set; }
        public int IdPerfils { get; set; }
        public string Senha { get; set; }
        public string Email { get; set; }
        public virtual Perfil IdPerfilsNavigation { get; set; }
    }
}
