program ad2q3;

type
        pessoa1 = record
                nome:string[30];
                idade:byte;
                salario:real;
                end;
        arqPessoas = file of pessoa1;
        vetor= array [1..100] of pessoa1;

procedure construir (var n:integer;var cadastro:arqPessoas;var pessoa:pessoa1);
var
        x:string[30];
        y:byte;
        z:real;
        i:integer;

begin
        for i:=1 to n do
        begin
             Writeln ('Digite o nome da pessoa: ');
             read(x);
             pessoa.nome:=x;
             writeln();
             writeln ('Digite a idade da pessoa: ');
             read(y);
             pessoa.idade:=y;
             writeln();
             writeln ('Digite o salario da pessoa: ');
             readln(z);
             pessoa.salario:=z;
             writeln();
             write(cadastro,pessoa);

        end;
        close(cadastro);


end;

procedure mostrar (var n:integer; var cadastro:arqPessoas;var pessoa:pessoa1);
var
        i:integer;

begin
        writeln('___________Arquivo___________');
        reset(cadastro);
        for i:=1 to n do
        begin

                read (cadastro,pessoa);
                writeln();
                writeln('Arquivo: ',i);
                writeln();
                write('Nome: ');
                writeln(pessoa.nome);
                write('Idade: ');
                writeln(pessoa.idade);
                write('Salario: ');
                writeln(pessoa.salario:9:2);
                writeln('___________________________');


        end;
        close(cadastro);


end;

procedure modificar (var n:integer;var cadastro:arqPessoas;var pessoa:pessoa1);
var
        i:integer;
        x:real;
        achou:boolean;
        no:string[30];
        id:integer;

begin
        x:=0.0;
        achou:=false;
        reset(cadastro);

        while not eof(cadastro) and not achou do
        begin
                read(cadastro,pessoa);
                with pessoa do
                begin
                        if idade > 60 then
                        begin
                                achou:=true;
                                x:=salario;
                                no:=nome;
                                id:=idade;
                                x:=((x*11)/100)+x;


                        end;
                        if x <> 0 then
                        salario:=x;
                        seek(cadastro,filepos(cadastro)-1);
                        write(cadastro,pessoa);


                end;
        end;


end;
procedure ordenar (var n:integer;var cadastro:arqPessoas;var pessoa:pessoa1);
var
        pessoaa: vetor;
        i,j,o,troca2:integer;
        troca1: string;
        troca3: real;
        parada:boolean;

begin
        reset(cadastro);
        for i:= 1 to n do
        begin
                read(cadastro,pessoa);
                pessoaa[i].nome:= pessoa.nome ;
                pessoaa[i].idade:=pessoa.idade ;
                pessoaa[i].salario:=pessoa.salario;

        end;
        parada := false;
        while parada = false do
        begin
        writeln('___________Ordena‡Æo_____________');
        writeln('Para ordenar por Nome Digite 1,');
        writeln('Para ordenar por Idade Digite 2,');
        writeln('Para ordenar por salario Digite 3');
        read(o);
        if o = 1 then
        begin
                for i:= 1 to n do
                begin
                        for j:=i+1 to n do
                        begin
                                if pessoaa[j].nome < pessoaa[i].nome then
                                begin
                                        troca1:= pessoaa[i].nome;
                                        pessoaa[i].nome:= pessoaa[j].nome;
                                        pessoaa[j].nome:= troca1;


                                        troca2:= pessoaa[i].idade;
                                        pessoaa[i].idade:= pessoaa[j].idade;
                                        pessoaa[j].idade:= troca2;


                                        troca3:= pessoaa[i].salario;
                                        pessoaa[i].salario:= pessoaa[j].salario;
                                        pessoaa[j].salario:= troca3;



                                end;

                        end;

                end;
                writeln('_______Ordena‡Æo por Nome: _______');
                for i:= 1 to n do
                begin
                        writeln('_____Arquivo: ',i,' _______');
                        writeln('Nome: ',pessoaa[i].nome);
                        writeln('idade: ',pessoaa[i].idade);
                        writeln('Salario: ',pessoaa[i].salario:9:2);
                        writeln('______________________________');
                        writeln();


                end;

        end;
        if o = 2 then
        begin
                 for i:= 1 to n do
                begin
                        for j:=i+1 to n do
                        begin
                                if pessoaa[j].idade < pessoaa[i].idade then
                                begin
                                        troca1:= pessoaa[i].nome;
                                        pessoaa[i].nome:= pessoaa[j].nome;
                                        pessoaa[j].nome:= troca1;


                                        troca2:= pessoaa[i].idade;
                                        pessoaa[i].idade:= pessoaa[j].idade;
                                        pessoaa[j].idade:= troca2;


                                        troca3:= pessoaa[i].salario;
                                        pessoaa[i].salario:= pessoaa[j].salario;
                                        pessoaa[j].salario:= troca3;



                                end;

                        end;

                end;
                writeln('_______Ordena‡Æo por Idade: _______');
                for i:= 1 to n do
                begin
                        writeln('_____Arquivo: ',i,' _______');
                        writeln('Nome: ',pessoaa[i].nome);
                        writeln('idade: ',pessoaa[i].idade);
                        writeln('Salario: ',pessoaa[i].salario:9:2);
                        writeln('______________________________');
                        writeln();


                end;

        end;
        if o = 3 then
        begin
                  for i:= 1 to n do
                begin
                        for j:=i+1 to n do
                        begin
                                if pessoaa[j].salario < pessoaa[i].salario then
                                begin
                                        troca1:= pessoaa[i].nome;
                                        pessoaa[i].nome:= pessoaa[j].nome;
                                        pessoaa[j].nome:= troca1;


                                        troca2:= pessoaa[i].idade;
                                        pessoaa[i].idade:= pessoaa[j].idade;
                                        pessoaa[j].idade:= troca2;


                                        troca3:= pessoaa[i].salario;
                                        pessoaa[i].salario:= pessoaa[j].salario;
                                        pessoaa[j].salario:= troca3;



                                end;

                        end;

                end;

                writeln('_______Ordena‡Æo por Salario: _______');
                for i:= 1 to n do
                begin
                        writeln('_____Arquivo: ',i,' _______');
                        writeln('Nome: ',pessoaa[i].nome);
                        writeln('idade: ',pessoaa[i].idade);
                        writeln('Salario: ',pessoaa[i].salario:9:2);
                        writeln('______________________________');
                        writeln();


                end;
        end;
                writeln('Para Ordenar Novamente Digite 1,');
                writeln('Para sair do programa digite 2.');
                read(j);
                if j=2 then
                        parada:= true;





        end;


end;




var
        cadastro:arqPessoas;
        pessoa:pessoa1;
        a:string;
        n:integer;

begin
        writeln('Digite a Localiza‡Æo do Arquivo: ');
        read(a);
        assign(cadastro,a);
        rewrite(cadastro);
        writeln('Quantidade de registros que deseja fazer: ');
        readln(n);

        construir(n,cadastro,pessoa);
        mostrar(n,cadastro,pessoa);
        modificar(n,cadastro,pessoa);
        writeln('_________Arquivo Moficado__________');
        mostrar(n,cadastro,pessoa);
        ordenar(n,cadastro,pessoa);


end.
