-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2020-12-04 14:42:15.827

-- tables
-- Table: CTHDs

-- CREATE DATABASE QLBH_db
-- CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- USE QLBH_db;

CREATE TABLE CTHDs (
    HoaDonSoH int NULL,
    maSP varchar(255) NULL,
    SL int NULL
);

CREATE INDEX HoaDonSoH ON CTHDs (HoaDonSoH);

CREATE INDEX maSP ON CTHDs (maSP);

-- Table: HoaDons
CREATE TABLE HoaDons (
    HoaDonSoH int NOT NULL,
    ngay datetime NULL,
    maKH varchar(255) NULL,
    triGia double NULL,
    CONSTRAINT HoaDons_pk PRIMARY KEY (HoaDonSoH)
);

CREATE INDEX maKH ON HoaDons (maKH);

-- Table: LoaiSPs
CREATE TABLE LoaiSPs (
    loai_sp_masp varchar(255) NOT NULL,
    xuatXu varchar(255) NULL,
    CONSTRAINT LoaiSPs_pk PRIMARY KEY (loai_sp_masp)
);

-- Table: SanPhams
CREATE TABLE SanPhams (
    maSP varchar(255) NOT NULL,
    tenSP varchar(255) NULL,
    dvt varchar(255) NULL,
    gia double NULL,
    loai_sp_masp varchar(255) NULL,
    CONSTRAINT SanPhams_pk PRIMARY KEY (maSP)
);

CREATE INDEX loai_sp_masp ON SanPhams (loai_sp_masp);

-- Table: Users
CREATE TABLE Users (
    maKH varchar(255) NOT NULL,
    hoten varchar(255) NULL,
    dchi varchar(255) NULL,
    sodt varchar(255) NULL,
    ngSinh datetime NULL,
    ngDK datetime NULL,
    doanhSo double NULL,
    CONSTRAINT Users_pk PRIMARY KEY (maKH)
);

-- foreign keys
-- Reference: CTHDs_ibfk_1 (table: CTHDs)
ALTER TABLE CTHDs ADD CONSTRAINT CTHDs_ibfk_1 FOREIGN KEY CTHDs_ibfk_1 (HoaDonSoH)
    REFERENCES HoaDons (HoaDonSoH)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: CTHDs_ibfk_2 (table: CTHDs)
ALTER TABLE CTHDs ADD CONSTRAINT CTHDs_ibfk_2 FOREIGN KEY CTHDs_ibfk_2 (maSP)
    REFERENCES SanPhams (maSP)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: HoaDons_ibfk_1 (table: HoaDons)
ALTER TABLE HoaDons ADD CONSTRAINT HoaDons_ibfk_1 FOREIGN KEY HoaDons_ibfk_1 (maKH)
    REFERENCES Users (maKH)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

-- Reference: SanPhams_ibfk_1 (table: SanPhams)
ALTER TABLE SanPhams ADD CONSTRAINT SanPhams_ibfk_1 FOREIGN KEY SanPhams_ibfk_1 (loai_sp_masp)
    REFERENCES LoaiSPs (loai_sp_masp)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

insert into Users (maKH,hoten,dchi,sodt,ngSinh,ngDK,doanhSo) values
    ('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','1960-10-22','1980-10-2',13060000),
    ('KH02','Tran Van B','23/5 Nguyen Trai, Q5, TpHCM','908256478','1960-10-11','1980-10-2',280000),
    ('KH03','Nguyen Van C','45 Nguyen Canh Chan, Q1, TpHCM','938776266','1960-11-11','1980-10-2',3860000),
    ('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','1968-10-5','1980-10-2',250000),
    ('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','1980-10-2','1982-10-6',21000);

insert into LoaiSPs (loai_sp_masp,xuatXu) values
    ('BC','Singapore'),
    ('AC','Singapore'),
    ('TV','Trung Quoc'),
    ('SV','Trung Quoc'),
    ('ST','Viet Nam');

insert into SanPhams (maSP,tenSP,dvt,gia,loai_sp_masp) values
    ('BC01','But chi 2B','cay',3000,'BC'),
    ('BC02','But chi 3B','cay',5000,'BC'),
    ('TV01','Tap 100 giay mong','quyen',2500,'TV'),
    ('TV02','Tap 200 giay mong','quyen',4500,'TV'),
    ('ST06','Phan viet bang','hop',5000,'ST'),
    ('ST07','Phan viet bang a','hop',7000,'ST');
select * from SanPhams;

insert into HoaDons (HoaDonSoH,ngay,maKH,triGia) values
    (1001,'2006-10-5','KH01',320000),
    (1002,'2006-10-5','KH01',840000),
    (1003,'2006-10-5','KH02',100000),
    (1004,'2006-10-5','KH02',180000),
    (1005,'2006-10-5','KH03',3800000);

insert into CTHDs (HoaDonSoH,maSP,SL) values
    (1001,'TV02',10),
    (1002,'TV01',5),
    (1003,'BC01',5),
    (1004,'BC02',10),
    (1005,'ST06',10);
-- End of file.

