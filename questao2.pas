program ad2q2;

type
        pessoa1 = record
                nome:string[30];
                idade:byte;
                salario:real;
                end;
        arqPessoas = file of pessoa1;

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



end.
