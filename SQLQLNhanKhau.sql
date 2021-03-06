create database QL_NK
use QL_NK

drop database QL_NK
--Tao bang chu ho
create table DSChuHo
	(SoHoKhau nvarchar(10) primary key(SoHoKhau), 
	HoTen nvarchar(30),
	QuanHe nvarchar(20),
	NoithuongTru nvarchar(50),
	NguyenQuan nvarchar(50),
	NgaySinh smalldatetime,
	GioiTinh nvarchar(5),
	DanToc nvarchar(30),
	QuocTich nvarchar(30),
	NgheNghiep nvarchar(20))
	
--drop table DSChuHo
--Tao sp them chu ho
create proc sp_ThemChuHo
	(@SoHoKhau nvarchar(10), 
	@HoTen nvarchar(30),
	@QuanHe nvarchar(20),
	@NoithuongTru nvarchar(50),
	@NguyenQuan nvarchar(50),
	@NgaySinh smalldatetime,
	@GioiTinh nvarchar(5),
	@DanToc nvarchar(30),
	@QuocTich nvarchar(30),
	@NgheNghiep nvarchar(20))
as 
insert into DSChuHo(SoHoKhau, HoTen, QuanHe, NoithuongTru, NguyenQuan, NgaySinh, GioiTinh, DanToc, QuocTich, NgheNghiep)
values (@SoHoKhau,@HoTen, @QuanHe, @NoithuongTru, @NguyenQuan, @NgaySinh, @GioiTinh, @DanToc, @QuocTich, @NgheNghiep )
--drop proc sp_ThemChuHo
-- thuc thi
exec sp_ThemChuHo N'CH100',N'Cao Thanh',N'Chủ hộ',N'23, Vo Van Ngan, Thu Duc, HCM', N'Thu Duc, HCM', '01/15/1987', N'Nam', N'Kinh', N'Việt Nam', N'Giao vien'
--exec sp_ThemChuHo N'CH101',N'Nguyen Minh',N'43, To Ngoc Van, Thu Duc, HCM', N'Thu Duc, HCM',1989, N'Nam',215574568, N'Xe om'
--exec sp_ThemChuHo N'CH102',N'Ly Thong',N'23, Nguyen Tri Phuong, Quan 10, HCM', N'Binh Dinh, HCM', 1987, N'Nam',215574568, N'Cong nhan'
--exec sp_ThemChuHo N'CH103',N'Nguyen Minh Hoang',N'100, Vo Van Ngan, Thu Duc, HCM', N'Gia Lai, HCM', 1990, N'Nam',215574565, N'Ky su'
--exec sp_ThemChuHo N'CH104',N'Cao Thi Tinh',N'23, Vo Van Ngan, Thu Duc, HCM', N'Gia Lai, HCM', 1984, N'Nu',215574568, N'Ke toan'
--exec sp_ThemChuHo N'CH105',N'Vo Cao Tuan',N'89, Ly Thuong Kiet, Quan 5, HCM', N'Vung Tau, HCM',1985, N'Nam',215574568, N'Giao Vien'
--exec sp_ThemChuHo N'CH106',N'Do Thanh Nam',N'1050, Pham Van Dong, Thu Duc, HCM', N'Quang Ngai, HCM', 1989, N'Nam',215574568, N'Bac si'

create proc LayDSChuHo
as
select * from DSChuHo
exec LayDSChuHo



-- tao ban than nhan
create table DSThanNhan(
	MaThanNhan nvarchar(20) primary key,
	SoHoKhau nvarchar(10) foreign Key (SoHoKhau) references DSChuHo(SoHoKhau),
	HoTen nvarchar(30),
	QuanHe nvarchar(20),
	NoithuongTru nvarchar(50),
	NguyenQuan nvarchar(50),
	NgaySinh smalldatetime,
	GioiTinh nvarchar(5),
	DanToc nvarchar(30),
	QuocTich nvarchar(30),
	NgheNghiep nvarchar(20))
--drop table DSThanNhan

-- them sp than nhan
create proc sp_ThemDSThanNhan(
	@MaThanNhan nvarchar(20),
	@SoHoKhau nvarchar(10), 
	@HoTen nvarchar(30),
	@QuanHe nvarchar(20),
	@NoithuongTru nvarchar(50),
	@NguyenQuan nvarchar(50),
	@NgaySinh smalldatetime,
	@GioiTinh nvarchar(5),
	@DanToc nvarchar(30),
	@QuocTich nvarchar(30),
	@NgheNghiep nvarchar(20))
as 
insert into DSThanNhan(MaThanNhan, SoHoKhau, HoTen, QuanHe, NoithuongTru, NguyenQuan, NgaySinh, GioiTinh, DanToc, QuocTich, NgheNghiep)
values (@MaThanNhan, @SoHoKhau, @HoTen, @QuanHe, @NoithuongTru, @NguyenQuan, @NgaySinh, @GioiTinh, @DanToc, @QuocTich, @NgheNghiep)

--drop proc sp_ThemDSThanNhan
--exec sp_ThemDSThanNhan N'Hehe',N'N01',N'Ong noi',N'Nhan soi',N'Tu',N'2',N'Nam',N'Kinh',N'VN','01/15/1987',N'BMT',N'Quan9'
--exec sp_ThemDSThanNhan N'AAA2',N'BBB',N'TTT',N'III',N'TTyyyT',N'IIIoo',N'TTT',N'III',1231213,N'IIIoo',N'I12IIoo'
exec sp_ThemDSThanNhan N'123', N'CH100', N'Nhan soi', N'Ong noi', N'23, Vo Van Ngan, Thu Duc, HCM', N'Thu Duc, HCM', '01/15/1987', N'Nam', N'Kinh', N'Việt Nam', N'Giao vien'

create proc LayDSTN
as
select * from DSThanNhan
--drop proc LayDSTN
exec LayDSTN