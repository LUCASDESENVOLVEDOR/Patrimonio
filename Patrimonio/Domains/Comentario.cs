using System;
using System.Collections.Generic;

#nullable disable

namespace Patrimonio.Domains
{
    public partial class Comentario
    {
        public int Id { get; set; }
        public int IdEquipamentos { get; set; }
        public int IdPerfils { get; set; }
        public string Comentario1 { get; set; }
        public DateTime DataCadastro { get; set; }

        public virtual Equipamento IdEquipamentosNavigation { get; set; }
        public virtual Perfil IdPerfilsNavigation { get; set; }
    }
}
