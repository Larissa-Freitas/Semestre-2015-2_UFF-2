program ad2q1(y,w);

procedure somar(var y:text);
var
    z,soma:real;


begin
        soma:=0.0;
        while not eof(y) do
        begin
                 read(y,z);
                 soma:=soma+z;
                 readln(y);
        end;
        writeln('A soma dos N£meros ‚: ',soma:9:2);

end;

procedure maiormenor(var y:text;var maior,menor: real);
var
    z:real;
begin
     maior:=0.0;
     menor:=999.9;
     z:=0.0;


     while not eof(y) do
     begin
        read(y,z);
        if maior < z then
        begin
                maior:=z;
        end
        else
        begin
                if menor > z  then
                begin
                        menor:=z;
                end;
        end;
        readln(y);


     end;
     writeln('O Maior N£mero ‚: ',maior:12:2,' e o Menor N£mero ‚: ',menor:12:2);
end;
procedure mostrar (var y:text);
var
        z:real;
begin
        writeln('_____Seu Arquivo_____');
        while not eof(y) do
        begin
                read(y,z);

                writeln(z:9:2);
                readln(y);
        end;
        writeln('____________________');



end;
procedure remover (var y:text;var w:text;var maior,menor:real);
var
   z:real;

begin
        while not eof(y) do
        begin
                read(y,z);
                readln(y);
                write(w,z);
                writeln(w);
        end;
        rewrite(y);
        while not  eof(w) do
        begin
                read(w,z);
                readln(w);
                if z <> maior then
                begin
                        if z <> menor then
                        begin
                                write(y,z);
                                writeln(y);

                        end;

                end;
        end;

        close(w);

end;



var
        y,w:text;
        x:string;
        maior,menor: real;


begin
        write('Entre com a localiza‡Æo do arquivo: ');
        read(x);
        assign (y,x);
        assign (w,'D:\FP\c.txt');

        reset(y);
        somar(y);
        reset(y);
        maiormenor(y,maior,menor);
        reset(y);
        mostrar(y);
        reset(y);
        reset(w);
        remover(y,w,maior,menor);
        reset(y);
        mostrar(y);
        close(y);





end.
