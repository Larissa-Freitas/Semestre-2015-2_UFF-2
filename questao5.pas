program ad2q5;

type
        T_info=integer;
        T_pont=^T_elemento;
        T_elemento=record
                num:T_info;
                prox:T_pont
                end;

procedure ponteiros (var p,p1:T_pont);
var
        z,y:integer;
        x,prim:T_pont;

begin
        z:=1;
        y:=1;

        x^.num:=p^.num;
        while x <> nil do
        begin
                x^.num:=p^.prox;
                y:=y+1;

        end;
        x^.num:=p1^.num;
        while x <> nil do
        begin
                x^.num:=p1^.prox;
                z:=z+1;

        end;
        if y < z then
        begin


        end;


end;

var
        p,p1,prim:T_pont;

begin

        prim:=nil;
        new(p);
        p^.num:=11;
        p^.prox:=prim;
        prim:=p;
        new(p);
        p^.num:=19;
        p^.prox:=prim;
        prim:=p;
        new(p);
        p^.num:=34;
        p^.prox:=prim;
        prim:=p;

         prim:=nil;
        new(p1);
        p1^.num:=10;
        p1^.prox:=prim;
        prim:=p1;
        new(p1);
        p1^.num:=20;
        p1^.prox:=prim;
        prim:=p1;




        ponteiros(p,p1);

end.