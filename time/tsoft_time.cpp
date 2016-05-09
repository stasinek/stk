//---------------------------------------------------------------------------
// ------ Stanis³aw Stasiak = "sstsoft@2001-2015r"---------------------------
//---------------------------------------------------------------------------
#include "./../mem/tsoft_mem32.h"
#include "./../text/tsoft_cstr_manipulation.h"
#include  <time.h>
//---------------------------------------------------------------------------
#include "tsoft_time.h"

uint64_t __stdcall ts::time::clock_us(void)
// cross-platform timeGetTime (on Windows minimum return is 1000us, on linux there is us acuracy (probably?) CLOCKS_PER_SEC >=1M
{
#ifdef __DEBUG_TIME__
__DEBUG_FUNC_CALLED__
#endif
		clock_t t;
		register uint64_t r = 1000 * 1000 * (uint64_t)clock();
		r = r / CLOCKS_PER_SEC;
		return r;
}
//---------------------------------------------------------------------------

uint64_t __stdcall ts::time::clock_ms(void) // cross-platform timeGetTime
{
#ifdef __DEBUG_TIME__
__DEBUG_FUNC_CALLED__
#endif
		clock_t t;
		register uint64_t r = 1000 * (uint64_t)clock();
		r = r / CLOCKS_PER_SEC;
		return r;
}
//---------------------------------------------------------------------------

void __stdcall ts::time::wait_ms(const __int32 milliseconds) // cross-platform sleep function
{
#ifdef __DEBUG_TIME__
__DEBUG_FUNC_CALLED__
#endif
		#ifdef WIN32
		::Sleep(milliseconds);
		#else
		_usleep(milliseconds * 1000);
		#endif // win32
}
//---------------------------------------------------------------------------

void __stdcall ts::time::wait_us(const __int32 microseconds) // cross-platform sleep function
{
#ifdef __DEBUG_TIME__
__DEBUG_FUNC_CALLED__
#endif
		#ifdef WIN32
		::Sleep(microseconds / 1000);
		//MSDN: A value of zero causes the thread to relinquish the remainder of its time slice to any other thread that is ready to run
		#else
		_usleep(microseconds);
		#endif // win32
}
//---------------------------------------------------------------------------

time_t __stdcall ts::time::FILETIME_to_time_t(FILETIME const& ft)
{
#ifdef __DEBUG_TIME__
__DEBUG_FUNC_CALLED__
#endif
		ULARGE_INTEGER ull;
		ull.HighPart = ft.dwHighDateTime;
		ull.LowPart = ft.dwLowDateTime;
		return (ull.QuadPart / 10000000ULL) - 11644473600ULL;
}

FILETIME* __stdcall ts::time::time_t_to_FILETIME(time_t t, LPFILETIME pft)
{
#ifdef __DEBUG_TIME__
__DEBUG_FUNC_CALLED__
#endif
// Note that LONGLONG is a 64-bit value
		LONGLONG ull;
		ull = (LONGLONG)(((LONGLONG)(LONG)t) * (LONGLONG)((LONG)10000000) + 116444736000000000);
		pft->dwLowDateTime = (DWORD)ull;
		pft->dwHighDateTime = ull >> 32;
		return pft;
}
//---------------------------------------------------------------------------


#include <iostream>
#include <iomanip>

bool isLeapYear(const unsigned int& ); //checks if 'year' is leap year
unsigned int firstDayOfJanuary( unsigned int& year );
unsigned int numOfDaysInMonth( unsigned int , unsigned int& ); // takes the number of the month, and 'year' as arguments
void printHeader( unsigned int ); //takes the number of the month, and the first day, prints, and updates
void printMonth( unsigned int , unsigned int& ); //takes number of days in month, and reference to 'firstDayInCurrentMonth' so it updates after every call
void skip( unsigned int ); //prints the specified amount of spaces


int printcalendar() {
	unsigned int year , firstDayInCurrentMonth;
	std::cout << "Calendar year? ";
	std::cin >> year;
	std::cout << "\n";
	firstDayInCurrentMonth = firstDayOfJanuary( year );
	skip(9);
	std::cout << year << "\n";
	for ( unsigned int currentMonth = 1 ; currentMonth <= 12 ; currentMonth++ ) {
		printHeader( currentMonth );
		printMonth( numOfDaysInMonth( currentMonth , year ) , firstDayInCurrentMonth );
		std::cout << "\n\n\n";
	}
	std::cout << "Press Enter to Exit...";
	std::cin.ignore();
	std::cin.get();
	return 0;
}

bool __stdcall is_leap_year( const unsigned int& year )
{
    return (year % 4 == 0) && (year % 100 != 0 || year % 400==0);
}

unsigned int __stdcall days_in_month(const unsigned int& month, const unsigned int& year ) {
    if (month==2) return 28 + is_leap_year(year);
    else return 30 + (month & 1);
}

void printcalendarheader( unsigned int m ) {
	skip( 7 );

	if ( m == 1 ) std::cout << "January";
	else if ( m == 2 ) std::cout << "February";
	else if ( m == 3 ) std::cout << "March";
	else if ( m == 4 ) std::cout << "April";
	else if ( m == 5 ) std::cout << "May";
	else if ( m == 6 ) std::cout << "June";
	else if ( m == 7 ) std::cout << "July";
	else if ( m == 8 ) std::cout << "August";
	else if ( m == 9 ) std::cout << "September";
	else if ( m == 10 ) std::cout << "October";
	else if ( m == 11 ) std::cout << "November";
	else if ( m == 12 ) std::cout << "December";

	std::cout << "\n S  M  T  W  T  F  S" << "\n";
	std::cout << "____________________" << "\n";
}

void skip( unsigned int i ) {
	while ( i > 0 ) {
		std::cout << " ";
		i--;
	}
}

void printcalendarmonth( unsigned int numDays, unsigned int &weekDay ) {
	skip( 3 * weekDay ); //3 is width of a calendar number
	for ( unsigned int day = 1 ; day <= numDays ; day++ ) {
		std::cout << std::setw(2) << day << " ";

		if ( weekDay == 6 ) {
			std::cout << "\n";
			weekDay = 0;
		}
		else
			weekDay++;
	}
}
