program ad2q4;

  {Vou criar dois conjuntos com o tipo abaixo como exemplo para testar a fun‡Æo!}
type
        T_cor = (vermelho,verde,azul);

        T_conj = set of T_cor;

function conjunto (x,y:T_conj):integer;
var
   z:integer;

begin
        if (x*y)=[] then
                z := 0
        else
        begin
                if x = y then
                z := 1
                else
                        z := 2;
        end;
        conjunto := z;

end;

   {Abaixo o teste da fun‡Æo!}
var
        cores: T_conj;
        cor: T_conj;
        resultado:integer;


begin
        cores:=[vermelho];  {pode testar com valor '[]'}{pode testar com valor '[vermelho]'}
        cor:=[vermelho];     {pode testar com valor '[]'}{pode testar com valor '[Verde]'}
        resultado:= conjunto(cores,cor);
        writeln('Resultado: ',resultado);

end.