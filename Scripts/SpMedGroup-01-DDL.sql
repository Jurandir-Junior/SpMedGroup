CREATE DATABASE SpMedGroup_Manha

USE SpMedGroup_Manha;

CREATE TABLE Clinica (
	IdClinica INT PRIMARY KEY IDENTITY,
	Endereço VARCHAR (250),
	HoraAtendimento TIME,
	CNPJ INT,
	NomeFantasia VARCHAR (250),
	RazãoSocial INT
);

CREATE TABLE TipoUsuario (
	IdTipoUsuario INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR (250),
);

CREATE TABLE Usuario (
	IdUsuario INT PRIMARY KEY IDENTITY,
	IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario)
);

CREATE TABLE Especialidade (
	IdEspecialidade INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR (200)
);

CREATE TABLE Medico (
	IdMedico INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (200),
	Genero VARCHAR (200),
	DataNascimento DATE,
	IdUsuario INT FOREIGN KEY REFERENCES Usuario (IdUsuario),
	IdEspecialidade INT FOREIGN KEY REFERENCES Especialidade (IdEspecialidade),
	IdClinica INT FOREIGN KEY REFERENCES Clinica (IdClinica)
);

CREATE TABLE Paciente (
	IdPaciente INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (200),
	DataNascimento DATE,
	Genero VARCHAR (200),
	CPF INT,
	Email VARCHAR (200)
);

CREATE TABLE Administrador (
	IdAdministrador INT PRIMARY KEY IDENTITY,
	Email VARCHAR (200),
	IdUsuario INT FOREIGN KEY REFERENCES Usuario (IdUsuario)
);