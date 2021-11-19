use prueba;
create table Usuario(
ci int,
nombre varchar(20) not null,
apellido varchar(20),
primary key(ci)
);
create table Usuario_email(
ci int,
email varchar(50),
pin int,
primary key(ci, email),
foreign key (ci) references Usuario (ci)
); 
create table Jugador(
ci_u int,
nickname varchar(20),
part_Jugada int,
part_Ganadas int,
primary key(ci_u), 
foreign key(ci_u) references Usuario(ci),
unique (nickname)
); 
create table Administrador(
ci_u int,
primary key(ci_u),
foreign key(ci_u) references Usuario(ci)
);
create table Palabra( codigo int not null,
letra char,
def varchar(100) not null,
palabra varchar(50),
emp_Por char,
estadoUso boolean,
cantRespo_Cor int,
palabrasErradas int,
primary key(codigo)
);
create table Categoria(nombre varchar(50), primary key(nombre));

create table Partida(codigo int not null,
nicknamePartida varchar(20),
puntaje int not null,
finalizada int,
primary key(codigo)
);
create table Tienen(codigoPalabra int not null,
nombre varchar(20),
primary key(codigoPalabra),
foreign key(codigoPalabra) references Palabra(codigo),
foreign key(nombre) references Categoria(nombre)
);
create table Contiene(codigoPalabra int not null,
codigoPartida int not null,
primary key(codigoPalabra),
foreign key(codigoPalabra) references Palabra(codigo),
foreign key(codigoPartida) references Partida(codigo)
);
create table Administra(codigoP int not null,
ciA int,
fecha datetime not null,
primary key(codigoP),
foreign key(codigoP)references Partida(codigo),
foreign key(ciA)references Administrador(ci_u)
);
create table Juega(
codigoPartida int not null,
primary key(codigoPartida),
foreign key(codigoPartida)references Contiene(codigoPartida)
);

alter table Partida 
drop puntaje;

alter table Juega
add puntaje int not null;

insert into Palabra(`codigo`, `letra`,`def`,`palabra`,`emp_Por`,`estadoUso`,`cantRespo_Cor`,`palabrasErradas`) values (null,'A','Agregar una hoja de codigo a otra','Enlazar','E',false,0,0);
insert into Palabra values(null,'B','Propiedad que se utiliza para dar color al fondo','Backgrounds','B',false,0,0);
insert into Palabra values(null,'C','Hoja para dar estilo','Css','C',false,0,0);
insert into Palabra values(null,'D','Puede añadir funciones escalares dentro de otras funciones escalares y dentro de funciones de columna','Anadida','D',false,0,0);
insert into Palabra values(null,'E','Objeto o sujeto de la base de datos que queremos almacenar informacion','Entidad','E',false,0,0);
insert into Palabra values(null,'F','Atributo que viene de otra tabla','Foreign Key','F',false,0,0);
insert into Palabra values(null,'G',' Metodo de describe el acceso en una propiedad','Get','G',false,0,0);
insert into Palabra values(null,'H','Homología particular de eje impropio, con centro en el de homología','Homotecia','H',false,0,0);
insert into Palabra values(null,'I','Ciencia que estudia las propiedades de la energia','Fisica','I',false,0,0);
insert into Palabra values(null,'J','Lenguaje de programación interpretado, dialecto del estándar ECMAScript.','JavaScript','J',false,0,0);
insert into Palabra values(null,'L','Hoja donde se hace el contenido de una pagina web','Html','L',false,0,0);
insert into Palabra values(null,'M','Etiqueta medidor o de medida','Meter','M',false,0,0);
insert into Palabra values(null,'N','Punto donde dos o más componentes tienen una conexión común','Nodo','N',false,0,0);
insert into Palabra values(null,'Ñ','Materia enfocada en el desarrollo de interfaces digitales.','Diseño web','Ñ',false,0,0);
insert into Palabra values(null,'O','Dos triángulos que tienen dos ángulos iguales, así como el lado comprendido entre ellos respectivamente igual, son:','Concruentes','O',false,0,0);
insert into Palabra values(null,'P','Es el proceso utilizado para idear y ordenar las acciones necesarias para realizar un proyecto.','Programación','P',false,0,0);
insert into Palabra values(null,'Q','Lugar en donde intersectan las curva de la demanda y la curva de la oferta','Equilibrio','Q',false,0,0);
insert into Palabra values(null,'R','Estudio de la economía de una zona, país o grupo de países en función de las actividades individuales de un comprador, de un fabricante, de una empresa, etc','Macroeconomia','R',false,0,0);
insert into Palabra values(null,'S','Disciplina lingüística que estudia el orden y la relación de las palabras o sintagmas en la oración, así como las funciones que cumplen','Sintaxis','S',false,0,0);
insert into Palabra values(null,'T','De las letras, en oposición a las ciencias, o relacionado con ellas.','Literario','T',false,0,0);
insert into Palabra values(null,'U','Cual es la avreviación de Lenguaje Unificado de Modelado','UML','U',false,0,0);
insert into Palabra values(null,'V','Proyecto que tiene 5to TIC desde mitad de año','Aviones','V',false,0,0);
insert into Palabra values(null,'X','Sistema filosófico, político y económico basado en las ideas de Karl Marx (1818-1883) y de Friedrich Engels (1820-1895), que rechaza el capitalismo y defiende la construcción de una sociedad sin clases y sin estado','Marxismo','X',false,0,0);
insert into Palabra values(null,'Y','Tipo de texto en prosa que explora, analiza, interpreta o evalúa un tema.','Ensayo','Y',false,0,0);
insert into Palabra values(null,'Z','Recurso de presentación que usa la profe de APT','Prezi','Z',false,0,0);
insert into Categoria(nombre) values('Diseño web');
insert into Categoria values('Programacion');
insert into Categoria values('APT');
insert into Categoria values('Base de datos');
insert into Categoria values('Geometria');
insert into Categoria values('Fisica');
insert into Categoria values('Economia');
insert into Categoria values('Electronica');